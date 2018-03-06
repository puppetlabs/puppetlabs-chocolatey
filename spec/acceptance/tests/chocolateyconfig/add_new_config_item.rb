require 'spec_helper_acceptance'

confine(:to, :platform => 'windows')

before(:each) do
  backup_config
end

after(:each) do
  reset_config
end


context 'Chocolatey Config' do
  context 'MODULES-3035 - Add New Config Item' do

    # arrange
    chocolatey_src = <<-PP
      chocolateyconfig {'hello123':
        ensure => present,
        value  => 'this guy',
      }
    PP

    execute_manifest(chocolatey_src, :catch_failures => true)

    agents.each do |agent|
      on(agent, "cmd.exe /c \"type #{config_file_location}\"") do |result|
        it "Should create the expected key" do
          expect(get_xml_value("//config/add[@key='hello123']/@value", result.output).to match(/this guy/)
        end
      end
    end
  end
end
