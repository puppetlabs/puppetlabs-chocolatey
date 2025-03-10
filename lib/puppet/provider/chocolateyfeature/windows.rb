# frozen_string_literal: true

require 'puppet/type'
require 'pathname'
require 'rexml/document'

Puppet::Type.type(:chocolateyfeature).provide(:windows) do
  @doc = 'Windows based provider for chocolateyfeature type.'

  confine operatingsystem: :windows
  defaultfor operatingsystem: :windows

  require Pathname.new(__FILE__).dirname + '../../../' + 'puppet_x/chocolatey/chocolatey_common'
  include PuppetX::Chocolatey::ChocolateyCommon

  FEATURE_MINIMUM_SUPPORTED_CHOCO_VERSION = '0.9.9.0'

  commands chocolatey: PuppetX::Chocolatey::ChocolateyCommon.chocolatey_command

  def initialize(value = {})
    super(value)
    @property_flush = {}
  end

  def properties
    @property_hash = query if @property_hash.empty?
    @property_hash.dup
  end

  def query
    self.class.choco_features.each do |feature|
      return feature.properties if @resource[:name][%r{\A\S*}].casecmp(feature.name.downcase).zero?
    end

    {}
  end

  def self.read_choco_features
    PuppetX::Chocolatey::ChocolateyCommon.set_env_chocolateyinstall

    choco_config = PuppetX::Chocolatey::ChocolateyCommon.choco_config_file
    raise Puppet::ResourceError, 'Config file not found for Chocolatey. Please make sure you have Chocolatey installed.' if choco_config.nil?
    raise Puppet::ResourceError, "An install was detected, but was unable to locate config file at #{choco_config}." unless PuppetX::Chocolatey::ChocolateyCommon.file_exists?(choco_config)

    Puppet.debug("Gathering features from '#{choco_config}'.")
    config = REXML::Document.new File.open(choco_config)

    config.elements.to_a('//feature')
  end

  def self.get_choco_feature(element)
    feature = {}
    return feature if element.nil?

    feature[:name]        = element.attributes['name'].downcase if element.attributes['name']
    feature[:description] = element.attributes['description'].downcase if element.attributes['description']

    enabled = false
    enabled = element.attributes['enabled'].casecmp('true').zero? if element.attributes['enabled']

    feature[:ensure] = :disabled
    feature[:ensure] = :enabled if enabled

    Puppet.debug("Loaded feature '#{feature.inspect}'.")

    feature
  end

  def self.choco_features
    read_choco_features.map do |item|
      feature = get_choco_feature(item)
      new(feature)
    end
  end

  def self.instances
    choco_features
  end

  def self.prefetch(resources)
    instances.each do |provider|
      if (resource = resources[provider.name])
        resource.provider = provider
      end
    end
  end

  def enable
    @property_flush[:ensure] = :enabled
  end

  def exists?
    @property_hash[:ensure] == :enabled
  end

  def disable
    @property_flush[:ensure] = :disabled
  end

  def validate
    choco_version = Gem::Version.new(PuppetX::Chocolatey::ChocolateyCommon.choco_version)
    validate_check = PuppetX::Chocolatey::ChocolateyCommon.file_exists?(PuppetX::Chocolatey::ChocolateyCommon.chocolatey_command) &&
                     choco_version < Gem::Version.new(FEATURE_MINIMUM_SUPPORTED_CHOCO_VERSION)

    if validate_check # rubocop:disable Style/GuardClause
      raise Puppet::ResourceError, "Chocolatey version must be '#{FEATURE_MINIMUM_SUPPORTED_CHOCO_VERSION}' to manage configuration values with Puppet. " \
                                   "Detected '#{choco_version}' as your version. Please upgrade Chocolatey to use this resource."
    end
  end

  mk_resource_methods

  def flush
    args = []
    args << 'feature'

    command = 'enable'
    command = 'disable' if @property_flush[:ensure] == :disabled

    args << command
    args << '--name' << resource[:name]

    Puppet::Util::Execution.execute([command(:chocolatey), *args])

    @property_hash.clear
    @property_flush.clear

    self.class.choco_features
    @property_hash = query
  end
end
