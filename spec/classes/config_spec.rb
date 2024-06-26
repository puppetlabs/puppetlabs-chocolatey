# frozen_string_literal: true

require 'spec_helper'

describe 'chocolatey' do
  let(:facts) do
    {
      path: 'C:\something'
    }
  end

  context 'contains config.pp' do
    context 'with older choco installed' do
      let(:facts) do
        super().merge(chocolateyversion: '0.9.8.33',
                      choco_install_path: 'C:\ProgramData\chocolatey')
      end

      [true, false].each do |param_value|
        feature_enable = 'enable'
        feature_enable = 'disable' unless param_value

        context "enable_autouninstaller => #{param_value}" do
          let(:params) { { enable_autouninstaller: param_value } }

          it { is_expected.not_to contain_exec("chocolatey_autouninstaller_#{feature_enable}") }

          it {
            expect(subject).not_to contain_exec("chocolatey_autouninstaller_#{feature_enable}").with_command("C:\\ProgramData\\chocolatey\\bin\\choco.exe feature -r #{feature_enable} -n autoUninstaller") # rubocop:disable Layout/LineLength
          }
        end
      end
    end

    context 'without choco installed' do
      let(:facts) do
        super().merge(chocolateyversion: '0',
                      choco_install_path: 'C:\ProgramData\chocolatey')
      end

      [true, false].each do |param_value|
        feature_enable = 'enable'
        feature_enable = 'disable' unless param_value

        context "enable_autouninstaller => #{param_value}" do
          let(:params) { { enable_autouninstaller: param_value } }

          it { is_expected.not_to contain_exec("chocolatey_autouninstaller_#{feature_enable}") }

          it {
            expect(subject).not_to contain_exec("chocolatey_autouninstaller_#{feature_enable}").with_command("C:\\ProgramData\\chocolatey\\bin\\choco.exe feature -r #{feature_enable} -n autoUninstaller") # rubocop:disable Layout/LineLength
          }
        end
      end
    end

    context 'with choco.exe installed' do
      let(:facts) do
        super().merge(chocolateyversion: '0.9.9.8',
                      choco_install_path: 'C:\ProgramData\chocolatey')
      end

      [true, false].each do |param_value|
        feature_enable = 'enable'
        feature_enable = 'disable' unless param_value

        context "enable_autouninstaller => #{param_value}" do
          let(:params) { { enable_autouninstaller: param_value } }

          it { is_expected.to contain_exec("chocolatey_autouninstaller_#{feature_enable}") }

          it {
            expect(subject).to contain_exec("chocolatey_autouninstaller_#{feature_enable}").with_command("C:\\ProgramData\\chocolatey\\bin\\choco.exe feature -r #{feature_enable} -n autoUninstaller")
          }
        end
      end
    end
  end
end
