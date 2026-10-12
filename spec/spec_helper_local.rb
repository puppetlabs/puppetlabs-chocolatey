# frozen_string_literal: true

# require 'pry' if Bundler.rubygems.find_name('pry').any?
# require 'puppetlabs_spec_helper/module_spec_helper'
# require 'rake'
require 'fileutils'

# tasks/*.rb load TaskHelper with require_relative '../../ruby_task_helper/...',
# which resolves to a sibling of the module root (where Bolt installs it). Link
# that path to the spec fixture so spec/tasks can load the tasks. This used to be
# a CI step; doing it here lets the shared module_ci workflow (and plain local
# runs) work without it.
task_helper_fixture = File.expand_path('fixtures/modules/ruby_task_helper', __dir__)
task_helper_sibling = File.expand_path('../../ruby_task_helper', __dir__)
if File.directory?(task_helper_fixture) && !File.exist?(task_helper_sibling)
  begin
    FileUtils.ln_s(task_helper_fixture, task_helper_sibling)
  rescue Errno::EEXIST
    # another parallel_spec worker created it first
  end
end

RSpec.configure do |_c|
  # set the environment variable before files are loaded, otherwise it is too late
  ENV['ChocolateyInstall'] = 'c:\blah'

  begin
    # rubocop:disable RSpec/AnyInstance
    Win32::Registry.any_instance.stubs(:[]).with('Bind')
    Win32::Registry.any_instance.stubs(:[]).with('Domain')
    Win32::Registry.any_instance.stubs(:[]).with('ChocolateyInstall').raises(Win32::Registry::Error.new(2), 'file not found yo')
    # rubocop:enable RSpec/AnyInstance
  rescue StandardError
    # ignore errors thrown while setting up mocks
  end
end
