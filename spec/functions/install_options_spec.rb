# frozen_string_literal: true

require 'spec_helper'

describe 'chocolatey::install_options' do
  it {
    is_expected.to run.with_params(
      '-override',
      '-installArgs',
      '/VERYSILENT /NORESTART'
    ).and_return(
      [
        '-override',
        '-installArgs',
        '"/VERYSILENT',
        '/NORESTART"'
      ]
    )
  }

  it {
    is_expected.to run.with_params(
      '-override',
      '-installArgs',
      '/INSTALLDIR="C:\Program Files\somewhere"',
    ).and_return(
      [
        '-override',
        '-installArgs',
        '"/INSTALLDIR=""C:\Program',
        'Files\somewhere"""',
      ]
    )
  }
end
