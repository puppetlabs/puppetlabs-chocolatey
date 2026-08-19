# frozen_string_literal: true

# For puppetcore, set GEM_SOURCE_PUPPETCORE = 'https://rubygems-puppetcore.puppet.com'
gemsource_default = ENV['GEM_SOURCE'] || 'https://rubygems.org'
gemsource_puppetcore = if !ENV['PUPPET_FORGE_TOKEN']
  'https://rubygems-puppetcore.puppet.com'
else
  ENV['GEM_SOURCE_PUPPETCORE'] || gemsource_default
end
source gemsource_default

def location_for(place_or_constraint, fake_constraint = nil, opts = {})
  git_url_regex  = /\A(?<url>(?:https?|git)[:@][^#]*)(?:#(?<branch>.*))?/
  file_url_regex = %r{\Afile://(?<path>.*)}

  if place_or_constraint && (git_url = place_or_constraint.match(git_url_regex))
    # Git source → ignore :source, keep fake_constraint
    [fake_constraint, { git: git_url[:url], branch: git_url[:branch], require: false }].compact

  elsif place_or_constraint && (file_url = place_or_constraint.match(file_url_regex))
    # File source → ignore :source, keep fake_constraint or default >= 0
    [fake_constraint || '>= 0', { path: File.expand_path(file_url[:path]), require: false }]

  else
    # Plain version constraint → merge opts (including :source if provided)
    [place_or_constraint, { require: false }.merge(opts)]
  end
end

# Print debug information if DEBUG_GEMS or VERBOSE is set
def print_gem_statement_for(gems)
  puts 'DEBUG: Gem definitions that will be generated:'
  gems.each do |gem_name, gem_params|
    puts "DEBUG:   gem #{([gem_name.inspect] + gem_params.map(&:inspect)).join(', ')}"
  end
end

gem 'puppet-syntax', git: 'https://github.com/puppetlabs/puppet-syntax', tag: '5.1.0'

group :development do
  gem "json", '= 2.6.1',                         require: false if Gem::Requirement.create(['>= 3.1.0', '< 3.1.3']).satisfied_by?(Gem::Version.new(RUBY_VERSION.dup))
  gem "json", '= 2.6.3',                         require: false if Gem::Requirement.create(['>= 3.2.0', '< 4.0.0']).satisfied_by?(Gem::Version.new(RUBY_VERSION.dup))
  gem "racc", '~> 1.4.0',                        require: false if Gem::Requirement.create(['>= 2.7.0', '< 3.0.0']).satisfied_by?(Gem::Version.new(RUBY_VERSION.dup))
  gem "deep_merge", '~> 1.2.2',                  require: false
  gem "voxpupuli-puppet-lint-plugins", '~> 7.0', require: false
  gem "facterdb", '~> 2.1',                      require: false if Gem::Requirement.create(['< 3.0.0']).satisfied_by?(Gem::Version.new(RUBY_VERSION.dup))
  gem "facterdb", '~> 3.0',                      require: false if Gem::Requirement.create(['>= 3.0.0']).satisfied_by?(Gem::Version.new(RUBY_VERSION.dup))
  gem "metadata-json-lint", '~> 4.0',            require: false
  gem "json-schema", '< 5.1.1',                  require: false
  gem "rspec-puppet-facts", '~> 4.0',            require: false if Gem::Requirement.create(['< 3.0.0']).satisfied_by?(Gem::Version.new(RUBY_VERSION.dup))
  gem "rspec-puppet-facts", '~> 5.0',            require: false if Gem::Requirement.create(['>= 3.0.0']).satisfied_by?(Gem::Version.new(RUBY_VERSION.dup))
  gem "dependency_checker", '~> 1.0.0',          require: false
  gem "parallel_tests", '= 3.12.1',              require: false
  gem "pry", '~> 0.10',                          require: false
  gem "simplecov-console", '~> 0.9',             require: false
  gem "puppet-debugger", '~> 1.6',               require: false
  gem "rubocop", '~> 1.73.0',                    require: false
  gem "rubocop-performance", '~> 1.24.0',        require: false
  gem "rubocop-rspec", '~> 3.5.0',               require: false
  gem "rubocop-rspec_rails", '~> 2.31.0',        require: false
  gem "rubocop-factory_bot", '~> 2.27.0',        require: false
  gem "rubocop-capybara", '~> 2.22.0',           require: false
  gem "rb-readline", '= 0.5.5',                  require: false, platforms: [:mswin, :mingw, :x64_mingw]
  gem "bigdecimal", '< 3.2.2',                   require: false, platforms: [:mswin, :mingw, :x64_mingw]
  gem "ruby-pwsh",                               require: false
end
group :development, :release_prep do
  gem "puppet-strings", '~> 4.0',         require: false
  # TODO(MODULES-11731): temporary — voxpupuli-puppet-lint-plugins ~> 7.0 (above) needs
  # puppet-lint ~> 5.1, which conflicts with the released puppetlabs_spec_helper ~> 8.0's
  # puppet-lint ~> 4.0 requirement. puppet-lint 5.x support merged to puppetlabs_spec_helper
  # main in puppetlabs/puppetlabs_spec_helper#485 but hasn't shipped in a release yet (latest
  # is v8.0.0). Swap back to a released '~> 8.x' (or newer) gem once one contains that commit.
  gem "puppetlabs_spec_helper", git: 'https://github.com/puppetlabs/puppetlabs_spec_helper.git', branch: 'MODULES-11926', require: false
  gem "puppet-blacksmith", '~> 7.0',      require: false
end
group :system_tests do
  # TODO(MODULES-11731): temporary — --collection-platform-exclude support for
  # matrix_from_metadata_v3 (keeps a platform in the Puppet 8 acceptance lane while dropping
  # it from Puppet 9, e.g. ubuntu-20.04) merged to puppet_litmus main in puppetlabs/puppet_litmus#627
  # but hasn't shipped in a release yet (latest is v2.7.0). Swap back to a released '~> 2.x'
  # gem once a version containing that commit ships.
  gem "puppet_litmus", git: 'https://github.com/puppetlabs/puppet_litmus.git', branch: 'main', require: false, platforms: [:ruby, :x64_mingw]
  gem "CFPropertyList", '< 3.0.7', require: false, platforms: [:mswin, :mingw, :x64_mingw]
  gem "serverspec", '~> 2.41',     require: false
  gem "nokogiri",                  require: false, platforms: [:ruby, :mswin, :mingw, :x64_mingw]
end

gems = {}
puppet_version = ENV.fetch('PUPPET_GEM_VERSION', nil)
facter_version = ENV.fetch('FACTER_GEM_VERSION', nil)
hiera_version = ENV.fetch('HIERA_GEM_VERSION', nil)

# The Puppet 9 stream (8.99.x PRE-releases) is served from a source injected via the
# PUPPET_GEM_SOURCE env var (a CI secret / local export) so no internal host is committed
# here; it defaults to the puppetcore source. A plain '~> 8.99' skips prereleases and
# matches nothing, so honour an exact PUPPET_GEM_VERSION when given, else use a
# prerelease-aware range that resolves the newest 8.99.x build. facter uses the same source.
if puppet_version.to_s.match?(/\A(?:~>\s*)?(?:8\.99|9)/)
  puppet9_source = ENV['PUPPET_GEM_SOURCE'].to_s.empty? ? gemsource_puppetcore : ENV['PUPPET_GEM_SOURCE']
  puppet9_req = puppet_version.to_s.match?(/\d+\.\d+\.\d/) ? [puppet_version] : ['>= 8.99.0.a', '< 10']
  gems['puppet'] = [*puppet9_req, { require: false, source: puppet9_source }]
  gems['facter'] = ['>= 4.11', { require: false, source: puppet9_source }]
else
  gems['puppet'] = location_for(puppet_version, nil, { source: gemsource_puppetcore })
  gems['facter'] = location_for(facter_version, nil, { source: gemsource_puppetcore })
end
gems['hiera'] = location_for(hiera_version, nil, {}) if hiera_version

# Generate the gem definitions
print_gem_statement_for(gems) if ENV['DEBUG']
gems.each do |gem_name, gem_params|
  gem gem_name, *gem_params
end

# Evaluate Gemfile.local and ~/.gemfile if they exist
extra_gemfiles = [
  "#{__FILE__}.local",
  File.join(Dir.home, '.gemfile')
]

extra_gemfiles.each do |gemfile|
  next unless File.file?(gemfile) && File.readable?(gemfile)

  # rubocop:disable Security/Eval
  eval(File.read(gemfile), binding)
  # rubocop:enable Security/Eval
end
# vim: syntax=ruby
