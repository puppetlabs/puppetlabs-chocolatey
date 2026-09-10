# frozen_string_literal: true

require 'spec_helper'

describe 'chocolatey' do
  let(:facts) do
    {
      chocolateyversion: '0.9.9.8',
      choco_install_path: 'C:\ProgramData\chocolatey',
      choco_temp_dir: 'C:\Temp',
      path: 'C:\something'
    }
  end

  context 'contains install.pp' do
    let(:exec_environment) { catalogue.resource('exec', 'install_chocolatey_official').send(:parameters)[:environment] }

    ['c:\local_folder', 'C:\\ProgramData\\chocolatey', 'C:\Program Files\chocolatey'].each do |choco_install_path|
      context "choco_install_location => #{choco_install_path}" do
        let(:params) { { choco_install_location: choco_install_path } }

        it { is_expected.to contain_exec('install_chocolatey_official').with_creates("#{choco_install_path}\\bin\\choco.exe") }
        it { expect(exec_environment).to include("ChocolateyInstall=#{choco_install_path}") }
        it { is_expected.to contain_registry_value('ChocolateyInstall environment value').with_data(choco_install_path) }
      end
    end

    [1500, 35].each do |param_value|
      context "choco_install_timeout_seconds => #{param_value}" do
        let(:params) { { choco_install_timeout_seconds: param_value } }

        it { is_expected.to contain_exec('install_chocolatey_official').with_timeout(param_value.to_s) }
      end
    end

    context 'use_7zip => false' do
      let(:params) { { use_7zip: false } }

      it { expect(exec_environment).to include('chocolateyUseWindowsCompression=true') }
    end

    context 'use_7zip => true' do
      let(:params) { { use_7zip: true } }

      context 'seven_zip_download_url default' do
        it { expect(exec_environment).to include('chocolateyUseWindowsCompression=false') }
      end

      ['https://packages.organization.net/7za.exe'].each do |seven_zip_url|
        context "seven_zip_download_url => '#{seven_zip_url}'" do
          let(:params) do
            super().merge({ seven_zip_download_url: seven_zip_url })
          end

          it { is_expected.to contain_exec('install_chocolatey_official').with_command(%r{.*Request-File -Url #{seven_zip_url}.*}) }
        end
      end
    end

    ['http://proxy.megacorp.com:3128'].each do |proxy_url|
      context "install_proxy => '#{proxy_url}'" do
        let(:params) { { install_proxy: proxy_url } }

        it { expect(exec_environment).to include("chocolateyProxyLocation=#{proxy_url}") }

        context 'install_proxy_user => \'Bob\'' do
          let(:params) do
            super().merge({ install_proxy_user: 'Bob' })
          end

          it { expect(exec_environment).to include('chocolateyProxyUser=Bob') }
        end

        context 'install_proxy_password => \'SomeP@$$\'' do
          let(:params) do
            super().merge({ install_proxy_password: sensitive('SomeP@$$') })
          end

          it { expect(exec_environment).to include('chocolateyProxyPassword=SomeP@$$') }
        end

        context 'install_proxy_ignore => true' do
          let(:params) do
            super().merge({ install_ignore_proxy: true })
          end

          it { expect(exec_environment).to include('chocolateyIgnoreProxy=true') }
        end
      end
    end

    ['https://internalurl/to/chocolatey.nupkg'].each do |param_value|
      context "download_url => '#{param_value}'" do
        let(:params) { { chocolatey_download_url: param_value } }

        it { expect(exec_environment).to include("chocolateyDownloadUrl=#{param_value}") }
      end
    end

    ['C:/temp'].each do |param_value|
      context "install_tempdir => '#{param_value}'" do
        let(:params) { { install_tempdir: param_value } }

        it { expect(exec_environment).to include("TEMP=#{param_value}") }
      end
    end
  end
end
