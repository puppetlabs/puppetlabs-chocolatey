# frozen_string_literal: true

require 'spec_helper'
require 'stringio'
require 'puppet/type/chocolateyconfig'
require 'puppet/provider/chocolateyconfig/windows'
require 'rexml/document'

describe Puppet::Type.type(:chocolateyconfig).provider(:windows) do
  let(:name) { 'configItem' }
  let(:resource) { Puppet::Type.type(:chocolateyconfig).new(provider: :windows, name: name, value: 'yes') }
  let(:choco_config) { 'c:\choco.config' }
  let(:choco_install_path) { 'c:\dude\bin\choco.exe' }
  let(:choco_config_contents) do
    <<~EOT
      <?xml version="1.0" encoding="utf-8"?>
      <chocolatey xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
        <config>
          <add key="cacheLocation" value="" description="Cache location if not TEMP folder." />
          <add key="commandExecutionTimeoutSeconds" value="2700" description="Default timeout for command execution." />
          <add key="containsLegacyPackageInstalls" value="true" description="Install has packages installed prior to 0.9.9 series." />
          <add key="proxy" value="" description="Explicit proxy location." />
          <add key="proxyUser" value="" description="Optional proxy user." />
          <add key="proxyPassword" value="" description="Optional proxy password. Encrypted." />
          <add key="virusCheckMinimumPositives" value="5" description="Minimum numer of scan result positives before flagging a binary as a possible virus. Available in 0.9.10+. Licensed versions only." />
          <add key="virusScannerType" value="VirusTotal" description="Virus Scanner Type (Generic or VirusTotal). Defaults to VirusTotal for Pro. Available in 0.9.10+. Licensed versions only." />
          <add key="genericVirusScannerPath" value="" description="The full path to the command line virus scanner executable. Used when virusScannerType is Generic. Available in 0.9.10+. Licensed versions only." />
          <add key="genericVirusScannerArgs" value="[[File]]" description="The arguments to pass to the generic virus scanner. Use [[File]] for the file path placeholder. Used when virusScannerType is Generic. Available in 0.9.10+. Licensed versions only." />
          <add key="genericVirusScannerValidExitCodes" value="0" description="The exit codes for the generic virus scanner when a file is not flagged. Separate with comma, defaults to 0. Used when virusScannerType is Generic. Available in 0.9.10+. Licensed versions only." />
        </config>
        <sources>
          <source id="local" value="c:\packages" disabled="true" user="rob" password="bogus/encrypted+value=" priority="0" />
          <source id="chocolatey" value="https://chocolatey.org/api/v2/" disabled="false" priority="0" />
          <source id="chocolatey.licensed" value="https://licensedpackages.chocolatey.org/api/v2/" disabled="false" user="customer" password="bogus/encrypted+value=" priority="10" />
        </sources>
        <features>
          <feature name="checksumFiles" enabled="true" setExplicitly="false" description="Checksum files when pulled in from internet (based on package)." />
          <feature name="virusCheckFiles" enabled="false" setExplicitly="false" />
          <feature name="autoUninstaller" enabled="true" setExplicitly="true" description="Uninstall from programs and features without requiring an explicit uninstall script." />
          <feature name="allowGlobalConfirmation" enabled="false" setExplicitly="true" description="Prompt for confirmation in scripts or bypass." />
          <feature name="allowInsecureConfirmation" enabled="false" setExplicitly="false" />
          <feature name="failOnAutoUninstaller" enabled="false" setExplicitly="false" description="Fail if automatic uninstaller fails." />
          <feature name="failOnStandardError" enabled="false" setExplicitly="false" description="Fail if install provider writes to stderr." />
          <feature name="powershellHost" enabled="true" setExplicitly="false" description="Use Chocolatey''s built-in PowerShell host." />
          <feature name="logEnvironmentValues" enabled="false" setExplicitly="false" description="Log Environment Values - will log values of environment before and after install (could disclose sensitive data)." />
          <feature name="virusCheck" enabled="true" setExplicitly="true" description="Virus Check - perform virus checking on downloaded files. Available in 0.9.10+. Licensed versions only." />
          <feature name="downloadCache" enabled="true" setExplicitly="false" description="Download Cache - use the private download cache if available for a package. Available in 0.9.10+. Licensed versions only." />
          <feature name="failOnInvalidOrMissingLicense" enabled="false" setExplicitly="false" description="Fail On Invalid Or Missing License - allows knowing when a license is expired or not applied to a machine." />
          <feature name="ignoreInvalidOptionsSwitches" enabled="true" setExplicitly="false" description="Ignore Invalid Options/Switches - If a switch or option is passed that is not recognized, should choco fail?" />
          <feature name="usePackageExitCodes" enabled="true" setExplicitly="false" description="Use Package Exit Codes - Package scripts can provide exit codes. With this on, package exit codes will be what choco uses for exit when non-zero (this value can come from a dependency package). Chocolatey defines valid exit codes as 0, 1605, 1614, 1641, 3010. With this feature off, choco will exit with a 0 or a 1 (matching previous behavior). Available in 0.9.10+." />
        </features>
        <apiKeys>
          <apiKeys source="https://chocolatey.org/" key="bogus/encrypted+value=" />
       </apiKeys>
      </chocolatey>
    EOT
  end

  let(:minimum_supported_version) { '0.9.10.0' }
  let(:last_unsupported_version) { '0.9.9.12' }
  let(:provider_class) { subject.class }
  let(:provider) { subject.class.new(resource) }

  before(:each) do
    allow(PuppetX::Chocolatey::ChocolateyInstall).to receive(:install_path).and_return('c:\dude')
    allow(PuppetX::Chocolatey::ChocolateyCommon).to receive(:choco_version).and_return(minimum_supported_version)

    provider = provider_class.new(resource)
    resource.provider = provider

    # Stub all file and config tests
    allow(provider_class).to receive(:healthcheck)
  end

  context 'verify provider' do
    it 'is an instance of Puppet::Type::Chocolateyconfig::ProviderWindows' do
      expect(provider).to be_an_instance_of(Puppet::Type::Chocolateyconfig::ProviderWindows)
    end

    it 'has a create method' do
      expect(provider).to respond_to(:create)
    end

    it 'has an exists? method' do
      expect(provider).to respond_to(:exists?)
    end

    it 'has a destroy method' do
      expect(provider).to respond_to(:destroy)
    end

    it 'has a properties method' do
      expect(provider).to respond_to(:properties)
    end

    it 'has a query method' do
      expect(provider).to respond_to(:query)
    end
  end

  context 'properties' do
    context ':value' do
      # it "should default to nil" do
      #  resource[:value].should be_nil
      # end

      it 'accepts c:\\cache' do
        resource[:value] = 'c:\cache'
      end

      it 'accepts 2700' do
        resource[:value] = '2700'
      end

      it "accepts 'value with spaces'" do
        resource[:value] = 'value with spaces'
      end
    end
  end

  context 'self.read_configs' do
    before(:each) do
      allow(PuppetX::Chocolatey::ChocolateyCommon).to receive(:set_env_chocolateyinstall)
    end

    it 'errors when the config file location is null' do
      expect(PuppetX::Chocolatey::ChocolateyCommon).to receive(:choco_config_file).and_return(nil)

      expect {
        provider_class.read_configs
      }.to raise_error(Puppet::ResourceError, %r{Config file not found for Chocolatey})
    end

    it 'errors when the config file is not found' do
      expect(PuppetX::Chocolatey::ChocolateyCommon).to receive(:choco_config_file).and_return(choco_config)
      expect(PuppetX::Chocolatey::ChocolateyCommon).to receive(:file_exists?).with(choco_config).and_return(false)

      expect {
        provider_class.read_configs
      }.to raise_error(Puppet::ResourceError, %r{was unable to locate config file at})
    end

    context 'when getting configs from the config file' do
      configs = []

      before(:each) do
        allow(PuppetX::Chocolatey::ChocolateyCommon).to receive(:choco_config_file).and_return(choco_config)
        allow(PuppetX::Chocolatey::ChocolateyCommon).to receive(:file_exists?).with(choco_config).and_return(true)
        allow(File).to receive(:read).with(choco_config).and_return(choco_config_contents)
      end

      it 'matches the count of configs in the config' do
        configs = provider_class.read_configs
        expect(configs.count).to eq(11)
      end

      it 'contains xml elements' do
        configs = provider_class.read_configs
        expect(configs[0]).to be_an_instance_of(REXML::Element)
      end
    end
  end

  context 'self.get_config' do
    let(:element) { REXML::Element.new('add') }

    element_key = 'cacheLocation'
    element_value = 'c:\\cache'
    element_description = 'Cache location if not TEMP folder.'

    before(:each) do
      element.add_attributes('key' => element_key,
                             'value' => element_value,
                             'description' => element_description)
    end

    it 'returns nil config when element is nil' do
      expect(provider_class.get_config(nil)).to eq({})
    end

    it 'converts an element to a config' do
      config = provider_class.get_config(element)

      expect(config[:name]).to eq(element_key)
      expect(config[:value]).to eq(element_value)
      expect(config[:description]).to eq(element_description)
      expect(config[:ensure]).to eq(:present)
    end
  end

  describe '.validation' do
    it 'does not error when Chocolatey is not installed' do
      allow(PuppetX::Chocolatey::ChocolateyCommon).to receive(:file_exists?).and_return(false)
      allow(PuppetX::Chocolatey::ChocolateyCommon).to receive(:file_exists?).with(choco_install_path).and_return(false)
      expect(PuppetX::Chocolatey::ChocolateyCommon).to receive(:choco_version).and_return('')

      resource.provider.validate
    end

    it 'does not error when the minimum version is met' do
      allow(PuppetX::Chocolatey::ChocolateyCommon).to receive(:file_exists?).and_return(false)
      allow(PuppetX::Chocolatey::ChocolateyCommon).to receive(:file_exists?).with(choco_install_path).and_return(true)
      expect(PuppetX::Chocolatey::ChocolateyCommon).to receive(:choco_version).and_return(minimum_supported_version)

      resource.provider.validate
    end

    it 'errors when the minimum version is not met' do
      allow(PuppetX::Chocolatey::ChocolateyCommon).to receive(:file_exists?).and_return(true)
      expect(PuppetX::Chocolatey::ChocolateyCommon).to receive(:choco_version).and_return(last_unsupported_version)

      expect {
        resource.provider.validate
      }.to raise_error(Puppet::ResourceError, %r{Chocolatey version must be '0.9.10.0' to manage configuration values. Detected '#{last_unsupported_version}'})
    end

    it 'errors when the property_hash is empty, :ensure is :present, and no :value is supplied' do
      resource.delete(:value)

      expect {
        resource.provider.validate
      }.to raise_error(ArgumentError, 'Unless ensure => absent, value is required.')
    end

    it 'does not error when the property_hash is defined, even if :ensure is :present and no :value is supplied' do
      resource.delete(:value)
      resource.provider.instance_variable_set(:@property_hash, value: 'something')
      resource.provider.validate
    end

    it 'does not error when the property_hash is empty, :ensure is :present and a :value is supplied' do
      resource.provider.validate
    end

    it 'does not error when the property_hash is empty, :ensure is :absent and no :value is supplied' do
      resource[:ensure] = :absent
      resource.delete(:value)
      resource.provider.validate
    end
  end

  describe '.flush' do
    resource_name = 'yup'
    resource_value = 'this'
    resource_ensure = :present

    before(:each) do
      allow(PuppetX::Chocolatey::ChocolateyCommon).to receive(:set_env_chocolateyinstall).at_most(:once)
      allow(PuppetX::Chocolatey::ChocolateyCommon).to receive(:choco_config_file).and_return(choco_config).at_most(:once)
      allow(PuppetX::Chocolatey::ChocolateyCommon).to receive(:file_exists?).with(choco_config).and_return(true).at_most(:once)
      allow(File).to receive(:read).with(choco_config).and_return(choco_config_contents).at_most(:once)

      resource[:name] = resource_name
      resource[:value] = resource_value
      resource[:ensure] = resource_ensure
    end

    it 'ensures a config setting is set' do
      # PuppetX::Chocolatey::ChocolateyCommon.allow(:choco_version).returns(minimum_supported_version)
      expect(Puppet::Util::Execution).to receive(:execute).with([provider_class.command(:chocolatey),
                                                                 'config', 'set',
                                                                 '--name', resource_name,
                                                                 '--value', resource_value],
                                                                { sensitive: true })

      resource.flush
    end

    it 'ensures a config setting is removed' do
      resource.provider.destroy

      # PuppetX::Chocolatey::ChocolateyCommon.allow(:choco_version).returns(minimum_supported_version)
      expect(Puppet::Util::Execution).to receive(:execute).with([provider_class.command(:chocolatey),
                                                                 'config', 'unset',
                                                                 '--name', resource_name],
                                                                { sensitive: true })

      resource.flush
    end

    it 'provides an error message when choco execution fails' do
      # PuppetX::Chocolatey::ChocolateyCommon.allow(:choco_version).returns(minimum_supported_version)
      expect(Puppet::Util::Execution).to receive(:execute).with([provider_class.command(:chocolatey),
                                                                 'config', 'set',
                                                                 '--name', resource_name,
                                                                 '--value', resource_value],
                                                                { sensitive: true }).and_raise(Puppet::ExecutionFailure, 'Nooooo')

      expect { resource.flush }.to raise_error(Puppet::Error, %r{Unable to set Chocolateyconfig})
    end
  end
end
