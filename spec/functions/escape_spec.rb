# frozen_string_literal: true

require 'spec_helper'

describe 'chocolatey::escape' do
  it { is_expected.to run.with_params('-installArgs').and_return('-installArgs') }
  it { is_expected.to run.with_params('C:\Program Files').and_return('"C:\Program Files"') }
  it { is_expected.to run.with_params('/INSTALLDIR="C:\Program Files"').and_return('"/INSTALLDIR=""C:\Program Files"""') }
end
