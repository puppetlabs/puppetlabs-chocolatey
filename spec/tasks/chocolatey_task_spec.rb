# frozen_string_literal: true

require 'spec_helper'
require_relative '../../tasks/init'

describe ChocolateyTask do
  subject { described_class.new.task(action: action, package: package, version: version) }

  let(:package) { 'puppet-bolt' }
  let(:version) { nil }

  let(:sucess_status) do
    res = double
    allow(res).to receive(:==).with(0).and_return(true)
    allow(res).to receive_messages(exited?: true, exitstatus: 0)
    res
  end

  context 'when action=install' do
    let(:action) { 'install' }

    context 'without version' do
      before(:each) do
        allow(Open3).to receive(:capture2).with('choco', 'install', 'puppet-bolt', '--yes', '--no-color', '--no-progress').and_return(['', sucess_status])
      end

      it { is_expected.to eq(nil) }
    end

    context 'with version' do
      let(:version) { '3.21.0' }

      before(:each) do
        allow(Open3).to receive(:capture2).with('choco', 'install', 'puppet-bolt', '--yes', '--no-color', '--no-progress', '--version', '3.21.0').and_return(['', sucess_status])
      end

      it { is_expected.to eq(nil) }
    end
  end

  context 'when action=upgrade' do
    let(:action) { 'upgrade' }

    context 'without version' do
      before(:each) do
        allow(Open3).to receive(:capture2).with('choco', 'upgrade', 'puppet-bolt', '--yes', '--no-color', '--no-progress').and_return(['', sucess_status])
      end

      it { is_expected.to eq(nil) }
    end

    context 'with version' do
      let(:version) { '3.21.0' }

      before(:each) do
        allow(Open3).to receive(:capture2).with('choco', 'upgrade', 'puppet-bolt', '--yes', '--no-color', '--no-progress', '--version', '3.21.0').and_return(['', sucess_status])
      end

      it { is_expected.to eq(nil) }
    end
  end

  context 'when action=uninstall' do
    let(:action) { 'uninstall' }

    context 'without version' do
      before(:each) do
        allow(Open3).to receive(:capture2).with('choco', 'uninstall', 'puppet-bolt', '--yes', '--no-color', '--no-progress').and_return(['', sucess_status])
      end

      it { is_expected.to eq(nil) }
    end

    context 'with version' do
      let(:version) { '3.21.0' }

      before(:each) do
        allow(Open3).to receive(:capture2).with('choco', 'uninstall', 'puppet-bolt', '--yes', '--no-color', '--no-progress', '--version', '3.21.0').and_return(['', sucess_status])
      end

      it { is_expected.to eq(nil) }
    end
  end

  # MODULES-11957: Bolt and PE add their own metaparameters to the task input,
  # which TaskHelper.run splats into `task`, so the signature has to tolerate
  # keywords it does not declare.
  context 'when the runner passes its own metaparameters' do
    subject { described_class.new.task(action: action, package: package, version: version, _task: 'chocolatey', _installdir: 'C:/Windows/Temp/install') }

    let(:action) { 'install' }

    before(:each) do
      allow(Open3).to receive(:capture2).with('choco', 'install', 'puppet-bolt', '--yes', '--no-color', '--no-progress').and_return(['', sucess_status])
    end

    it { is_expected.to eq(nil) }
  end
end
