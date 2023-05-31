<!-- markdownlint-disable MD024 -->
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](http://semver.org).

## [v8.0.0](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/v8.0.0) - 2023-05-31

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/v7.0.1...v8.0.0)

### Added

- (CONT-596) - Updating readme with deferred function for sensitive fields [#325](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/325) ([Ramesh7](https://github.com/Ramesh7))

### Changed
- (CONT-774) Puppet 8 support / Drop Puppet 6 [#316](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/316) ([LukasAud](https://github.com/LukasAud))

### Fixed

- (CONT-898) Address Sorted_set failing gems [#318](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/318) ([LukasAud](https://github.com/LukasAud))

## [v7.0.1](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/v7.0.1) - 2023-03-16

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/v7.0.0...v7.0.1)

### Fixed

- (CONT-708) Set all execute's to run with sensitive [#310](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/310) ([david22swan](https://github.com/david22swan))

## [v7.0.0](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/v7.0.0) - 2022-10-31

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/v6.2.1...v7.0.0)

### Changed
- (GH-297) Raise minimum puppet version required [#298](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/298) ([LukasAud](https://github.com/LukasAud))

## [v6.2.1](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/v6.2.1) - 2022-10-03

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/v6.2.0...v6.2.1)

### Fixed

- (MAINT) Dropping of support for windows 7,8.1, 2008/2008R2 (Server) [#300](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/300) ([jordanbreen28](https://github.com/jordanbreen28))

## [v6.2.0](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/v6.2.0) - 2022-05-16

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/v6.1.1...v6.2.0)

### Added

- update holdable feature [#270](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/270) ([rico89](https://github.com/rico89))

## [v6.1.1](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/v6.1.1) - 2022-04-11

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/v6.1.0...v6.1.1)

### Fixed

- (GH-283) Fix deprecation error [#286](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/286) ([chelnak](https://github.com/chelnak))

## [v6.1.0](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/v6.1.0) - 2022-03-08

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/v6.0.1...v6.1.0)

### Added

- pdksync - (FM-8922) - Add Support for Windows 2022 [#278](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/278) ([david22swan](https://github.com/david22swan))
- (MODULES-11255) Add basic tasks to manage packages [#273](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/273) ([smortex](https://github.com/smortex))
- add support for version range [#269](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/269) ([rico89](https://github.com/rico89))

## [v6.0.1](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/v6.0.1) - 2021-04-19

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/v6.0.0...v6.0.1)

### Fixed

- (MODULES-10638) Ease mocking of chocolatey internals [#254](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/254) ([DavidS](https://github.com/DavidS))

## [v6.0.0](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/v6.0.0) - 2021-03-03

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/v5.2.1...v6.0.0)

### Changed
- pdksync - Remove Puppet 5 from testing and bump minimal version to 6.0.0 [#248](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/248) ([carabasdaniel](https://github.com/carabasdaniel))

### Fixed

- (MODULES-10704) - Have the code error out rather than return nil values when finding version [#247](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/247) ([david22swan](https://github.com/david22swan))

## [v5.2.1](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/v5.2.1) - 2021-01-11

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/v5.2.0...v5.2.1)

### Fixed

- Add back error fix for (MODULES-3677) [#241](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/241) ([daianamezdrea](https://github.com/daianamezdrea))

## [v5.2.0](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/v5.2.0) - 2020-12-09

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/v5.1.1...v5.2.0)

### Added

- pdksync - (feat) - Add support for Puppet 7 [#236](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/236) ([daianamezdrea](https://github.com/daianamezdrea))

## [v5.1.1](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/v5.1.1) - 2020-08-28

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/v5.1.0...v5.1.1)

### Fixed

- (MODULES-10791) Increase upper boundary for powershell dependency to 5.0.0 [#228](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/228) ([adrianiurca](https://github.com/adrianiurca))

## [v5.1.0](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/v5.1.0) - 2020-08-26

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/v5.0.2...v5.1.0)

### Added

- (IAC-980) - Removal of inappropriate terminology [#224](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/224) ([david22swan](https://github.com/david22swan))
- pdksync - (IAC-973) - Update travis/appveyor to run on new default branch `main` [#219](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/219) ([david22swan](https://github.com/david22swan))

### Fixed

- [MODULES-10759] - set a default value if custom facts fails [#223](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/223) ([adrianiurca](https://github.com/adrianiurca))

## [v5.0.2](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/v5.0.2) - 2020-01-16

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/v5.0.1...v5.0.2)

### Fixed

- MODULES-10387 - update dependencies [#198](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/198) ([lionce](https://github.com/lionce))

## [v5.0.1](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/v5.0.1) - 2019-12-09

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/v5.0.0...v5.0.1)

## [v5.0.0](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/v5.0.0) - 2019-10-14

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/v4.1.0...v5.0.0)

### Changed
- Use datatypes and facts hash. Remove logic for Puppet 3.x [#175](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/175) ([treydock](https://github.com/treydock))

### Fixed

- (MODULES-8521) Fix $chocolatey_version parameter [#103](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/103) ([helge000](https://github.com/helge000))

## [v4.1.0](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/v4.1.0) - 2019-08-19

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/v4.0.0...v4.1.0)

### Added

- (MODULES-9690) Redact Sensitive Commandline [#168](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/168) ([RandomNoun7](https://github.com/RandomNoun7))

## [v4.0.0](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/v4.0.0) - 2019-07-30

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/3.3.0...v4.0.0)

### Added

- (MODULES-9317) Add Puppet Strings docs [#162](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/162) ([eimlav](https://github.com/eimlav))
- (FM-8194) Convert tests to litmus [#156](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/156) ([eimlav](https://github.com/eimlav))
- (MODULES-9224) Add no progress flag [#154](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/154) ([michaeltlombardi](https://github.com/michaeltlombardi))

### Changed
- (MODULES-9310) Raise lower Puppet bound to 5.5.10 [#159](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/159) ([eimlav](https://github.com/eimlav))

## [3.3.0](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/3.3.0) - 2019-03-19

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/3.2.0...3.3.0)

### Fixed

- (MODULES-8491) Warn about `install_options` secrets [#147](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/147) ([michaeltlombardi](https://github.com/michaeltlombardi))
- (MODULES-8047) Fix puppet resource chocolateyconfig [#146](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/146) ([michaeltlombardi](https://github.com/michaeltlombardi))

### Other

- (MODULES-6652) Fix download 7z behind proxy [#94](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/94) ([helge000](https://github.com/helge000))

## [3.2.0](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/3.2.0) - 2019-02-20

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/3.1.1...3.2.0)

### Other

- (MODULES-8634) Minor README edit [#143](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/143) ([clairecadman](https://github.com/clairecadman))
- (MODULES-8634) Prep for 3.2.0 release [#142](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/142) ([michaeltlombardi](https://github.com/michaeltlombardi))
- (MAINT) Add a changelog entry [#141](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/141) ([RandomNoun7](https://github.com/RandomNoun7))
- (MAINT) Fix broken state which causes CI to fail [#140](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/140) ([michaeltlombardi](https://github.com/michaeltlombardi))
- (MAINT) Remove unused rake task [#139](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/139) ([ThoughtCrhyme](https://github.com/ThoughtCrhyme))
- (MODULES-7042) Document chocolatey_version [#138](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/138) ([michaeltlombardi](https://github.com/michaeltlombardi))
- (MODULES-5897) Add allow_self_service to chocolateysource [#137](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/137) ([michaeltlombardi](https://github.com/michaeltlombardi))
- (MODULES-5898) add admin_only to chocolateysource [#135](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/135) ([michaeltlombardi](https://github.com/michaeltlombardi))
- (FM-7693) Add Windows Server 2019 [#133](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/133) ([glennsarti](https://github.com/glennsarti))
- (MODULES-4418) Add bypass_proxy to chocolateysource [#132](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/132) ([michaeltlombardi](https://github.com/michaeltlombardi))
- (maint) Update pdk template [#130](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/130) ([jpogran](https://github.com/jpogran))
- (MODULES-8400) PDK Sync to fix Travis [#129](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/129) ([RandomNoun7](https://github.com/RandomNoun7))
- (MODULES-8329) Mergeback to master [#127](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/127) ([RandomNoun7](https://github.com/RandomNoun7))
- (MODULES-6948) Fix/generate types chocolateyfeature [#111](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/111) ([rico89](https://github.com/rico89))
- (MODULES-8493) Fix Source Syntax [#105](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/105) ([jcwest](https://github.com/jcwest))
- MODULES-7068 Only initialise constant when not defined [#104](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/104) ([btoonk](https://github.com/btoonk))
- (MODULES-5654) Support for proxies during installation [#87](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/87) ([GeoffWilliams](https://github.com/GeoffWilliams))
- (maint) Add description of the two modules [#86](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/86) ([binford2k](https://github.com/binford2k))
- (MODULES-5383) Remove exit codes arg with feature [#84](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/84) ([davidtwco](https://github.com/davidtwco))

## [3.1.1](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/3.1.1) - 2018-12-12

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/3.1.0...3.1.1)

### Other

- (Maint) Add an entry to the changelog [#126](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/126) ([RandomNoun7](https://github.com/RandomNoun7))
- Add Changelog Entry [#125](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/125) ([RandomNoun7](https://github.com/RandomNoun7))
- Update Changelog [#124](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/124) ([RandomNoun7](https://github.com/RandomNoun7))
- (MODULES-8329) Release Prep. [#123](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/123) ([RandomNoun7](https://github.com/RandomNoun7))
- (MAINT) Fix Feedback From Claire [#122](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/122) ([RandomNoun7](https://github.com/RandomNoun7))
- MAINT: Convert Changelog To KAC [#121](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/121) ([RandomNoun7](https://github.com/RandomNoun7))
- (WIN-231) Change curl_on command to add path to cacert bundle [#120](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/120) ([ThoughtCrhyme](https://github.com/ThoughtCrhyme))
- Release merge back 3.1.0 [#118](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/118) ([eimlav](https://github.com/eimlav))
- (MODULES-5859) Fix An already initialized constant' warning when doing a "puppet apply" [#89](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/89) ([psreed](https://github.com/psreed))

## [3.1.0](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/3.1.0) - 2018-10-08

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/3.0.0...3.1.0)

### Other

- (MODULES-8053) Prepare for 3.1.0 release [#117](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/117) ([glennsarti](https://github.com/glennsarti))
- (MODULES-7832) Update metadata for Puppet 6 [#116](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/116) ([glennsarti](https://github.com/glennsarti))
- pdksync - (MODULES-7658) use beaker4 in puppet-module-gems [#115](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/115) ([tphoney](https://github.com/tphoney))
- pdksync - (MODULES-7705) - Bumping stdlib dependency from < 5.0.0 to < 6.0.0 [#114](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/114) ([pmcmaw](https://github.com/pmcmaw))
- pdksync - (MODULES-7658) use beaker3 in puppet-module-gems [#113](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/113) ([tphoney](https://github.com/tphoney))
- (MODULES-7398) PDK Convert the module [#112](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/112) ([glennsarti](https://github.com/glennsarti))
- (MAINT) Update chocolatey sources to artifactory [#108](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/108) ([michaeltlombardi](https://github.com/michaeltlombardi))
- (PDK-1038) Remove rspec-puppet pin from Gemfile [#107](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/107) ([rodjek](https://github.com/rodjek))
- (MODULES-4271) Add Server 2016 to metadata [#102](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/102) ([glennsarti](https://github.com/glennsarti))
- (MODULES-6734) Add Beakser Testmode Switcher [#101](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/101) ([RandomNoun7](https://github.com/RandomNoun7))
- (MAINT) Remove unnecessary lines from Rakefile. [#99](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/99) ([RandomNoun7](https://github.com/RandomNoun7))
- (MODULES-6746) Convert Tests to RSpec [#98](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/98) ([RandomNoun7](https://github.com/RandomNoun7))
- (maint) modulesync 65530a4 Update Travis [#93](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/93) ([michaeltlombardi](https://github.com/michaeltlombardi))
- (maint) modulesync cd884db Remove AppVeyor OpenSSL update on Ruby 2.4 [#92](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/92) ([michaeltlombardi](https://github.com/michaeltlombardi))
- (maint) - modulesync 384f4c1 [#91](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/91) ([tphoney](https://github.com/tphoney))
- (maint) - modulesync 1d81b6a [#90](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/90) ([pmcmaw](https://github.com/pmcmaw))
- add choco_ver variable and string it [#88](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/88) ([tek0011](https://github.com/tek0011))
- (MODULES-5187)(MODULES-5356) Pin rspec-puppet to 2.5.x [#83](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/83) ([glennsarti](https://github.com/glennsarti))
- (maint) modulesync 915cde70e20 [#82](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/82) ([glennsarti](https://github.com/glennsarti))
- (MODULES-5187) mysnc puppet 5 and ruby 2.4 [#81](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/81) ([eputnam](https://github.com/eputnam))
- (MODULES-5144) Prep for puppet 5 [#80](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/80) ([hunner](https://github.com/hunner))

## [3.0.0](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/3.0.0) - 2017-06-02

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/2.0.2...3.0.0)

### Other

- (MODULES-4994) Prepare module for 3.0.0 release [#79](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/79) ([glennsarti](https://github.com/glennsarti))
- (MODULES-4846) Update metadata  [#78](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/78) ([chsnell](https://github.com/chsnell))
- (MODULES-4562) Use actual choco.exe [#77](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/77) ([ferventcoder](https://github.com/ferventcoder))
- (MODULES-4678) Explicitly close config on read [#76](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/76) ([ferventcoder](https://github.com/ferventcoder))

## [2.0.2](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/2.0.2) - 2017-04-04

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/2.0.1...2.0.2)

### Other

- (MODULES-4633) Prepare for 2.0.2 module release [#75](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/75) ([glennsarti](https://github.com/glennsarti))
- (MAINT) Fix .gitattributes for module development on Windows [#74](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/74) ([glennsarti](https://github.com/glennsarti))
- [msync] 786266 Implement puppet-module-gems, a45803 Remove metadata.json from locales config [#73](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/73) ([wilson208](https://github.com/wilson208))
- (MODULES-4601) Fail rototiller task correctly. [#72](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/72) ([ThoughtCrhyme](https://github.com/ThoughtCrhyme))
- [MODULES-4528] Replace Puppet.version.to_f version comparison from spec_helper.rb [#71](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/71) ([wilson208](https://github.com/wilson208))
- [MODULES-4556] Remove PE requirement from metadata.json [#70](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/70) ([wilson208](https://github.com/wilson208))
- (Modules-4508) Fixed error with version parameter [#69](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/69) ([derek-robinson](https://github.com/derek-robinson))
- Modules 3302 restore rototiller [#68](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/68) ([ThoughtCrhyme](https://github.com/ThoughtCrhyme))
- (maint) Fix parallel spec issue with coverage_spec [#67](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/67) ([glennsarti](https://github.com/glennsarti))
- Revert "MODULES-3302 add Rototiller to Rakefile" [#66](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/66) ([glennsarti](https://github.com/glennsarti))
- (MODULES-4098) Sync the rest of the files [#65](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/65) ([hunner](https://github.com/hunner))
- (MODULES-4263) add blacksmith rake tasks [#64](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/64) ([eputnam](https://github.com/eputnam))
- MODULES-3302 add Rototiller to Rakefile [#63](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/63) ([ThoughtCrhyme](https://github.com/ThoughtCrhyme))
- (MODULES-4097) Sync travis.yml [#62](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/62) ([hunner](https://github.com/hunner))
- (FM-5972) Update to next modulesync_configs [dedaf10] [#58](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/58) ([DavidS](https://github.com/DavidS))

## [2.0.1](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/2.0.1) - 2017-01-03

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/2.0.0...2.0.1)

### Other

- (FM-5832) Supported Release 2.0.1 [#59](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/59) ([ferventcoder](https://github.com/ferventcoder))
- (MODULES-4056) Helpful Error if No Sources Enabled [#57](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/57) ([ferventcoder](https://github.com/ferventcoder))
- (MODULES-4210) Do not use com unzip in PS 5+ [#56](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/56) ([helge000](https://github.com/helge000))
- (FM-5939) removes spec.opts [#55](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/55) ([eputnam](https://github.com/eputnam))
- (MODULES-4149) Unsuitable providers should not error [#54](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/54) ([ferventcoder](https://github.com/ferventcoder))
- (MODULES-4091) Explicitly Set ChocolateyInstall Environment [#53](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/53) ([ferventcoder](https://github.com/ferventcoder))
- (MODULES-4135) choco -v - Remove all extraneous messaging [#52](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/52) ([ferventcoder](https://github.com/ferventcoder))
- (MODULES-4090) Document installation considerations [#51](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/51) ([ferventcoder](https://github.com/ferventcoder))
- Workaround frozen strings on ruby 1.9 [#50](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/50) ([hunner](https://github.com/hunner))
- (maint) Set TLS 1.1+ When Available (For Ensure Chocolatey Installation) [#49](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/49) ([ferventcoder](https://github.com/ferventcoder))
- (MODULES-3704) Update gemfile template to be identical [#48](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/48) ([hunner](https://github.com/hunner))

## [2.0.0](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/2.0.0) - 2016-09-29

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/0.8.0...2.0.0)

### Other

- (FM-4687) Supported Release 2.0.0 [#47](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/47) ([ferventcoder](https://github.com/ferventcoder))
- (MODULES-3880) Ignore Package Exit Codes [#46](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/46) ([ferventcoder](https://github.com/ferventcoder))
- (MODULES-3298) Added beaker-hostgenerator for dymanic config creation. [#45](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/45) ([ThoughtCrhyme](https://github.com/ThoughtCrhyme))
- (MODULES-3758) Fix: chocolateysource user ensure sync [#42](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/42) ([ferventcoder](https://github.com/ferventcoder))
- (MODULES-3430) Do not set default location to resource title [#41](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/41) ([ferventcoder](https://github.com/ferventcoder))
- (MODULES-3775) (msync 8d0455c) update travis/appveyer w/Ruby 2.3 [#40](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/40) ([MosesMendoza](https://github.com/MosesMendoza))
- (maint) modulesync 70360747 [#39](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/39) ([glennsarti](https://github.com/glennsarti))
- (docs) Update README to current module readme style guidelines. [#38](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/38) ([jtappa](https://github.com/jtappa))
- (MODULES-3677) Ensure Chocolatey Config [#37](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/37) ([ferventcoder](https://github.com/ferventcoder))
- (MODULES-3391) Limit `rake spec` on older puppet [#36](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/36) ([MosesMendoza](https://github.com/MosesMendoza))
- (Modules 3391) remove `rake test` and fix failing test [#35](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/35) ([MosesMendoza](https://github.com/MosesMendoza))
- (MODULES-3641) Remove Windows_env module dependency [#34](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/34) ([ferventcoder](https://github.com/ferventcoder))
- (MODULES-3640) Update modulesync 30fc4ab [#33](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/33) ([MosesMendoza](https://github.com/MosesMendoza))

## [0.8.0](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/0.8.0) - 2016-07-13

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/1.2.6...0.8.0)

### Other

- (FM-5429) Unsupported Release 0.8.0 [#31](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/31) ([ferventcoder](https://github.com/ferventcoder))
- (MODULES-3490) Sync from Community Repo [#28](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/28) ([ferventcoder](https://github.com/ferventcoder))

## [1.2.6](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/1.2.6) - 2016-07-11

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/1.2.5...1.2.6)

### Other

- (MODULES-3275) fix VLC uninstall command [#30](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/30) ([ThoughtCrhyme](https://github.com/ThoughtCrhyme))
- (maint) modulesync 724153ca2 [#29](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/29) ([glennsarti](https://github.com/glennsarti))
- (maint) modulesync 99efa6139 [#27](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/27) ([glennsarti](https://github.com/glennsarti))
- (MODULES-3275) Chocolatey module testing [#26](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/26) ([ThoughtCrhyme](https://github.com/ThoughtCrhyme))
- (MODULES-3536) modsync update [#25](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/25) ([glennsarti](https://github.com/glennsarti))
- (MODULES-3035) Manage configuration settings [#17](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/17) ([ferventcoder](https://github.com/ferventcoder))

## [1.2.5](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/1.2.5) - 2016-06-20

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/1.2.4...1.2.5)

### Other

- (MODULES-3034) Feature Configuration [#24](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/24) ([ferventcoder](https://github.com/ferventcoder))

## [1.2.4](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/1.2.4) - 2016-06-04

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/0.7.0...1.2.4)

## [0.7.0](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/0.7.0) - 2016-06-01

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/1.2.3...0.7.0)

### Other

- (FM-4966) Release unsupported 0.7.0 [#22](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/22) ([ferventcoder](https://github.com/ferventcoder))
- (MODULES-3037) Acceptance tests - ChocolateySource [#21](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/21) ([ThoughtCrhyme](https://github.com/ThoughtCrhyme))
- (MODULES-3037) Acceptance tests - ChocolateySource [#20](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/20) ([ferventcoder](https://github.com/ferventcoder))
- (MODULES-3037) Confine version fact w/default [#19](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/19) ([ferventcoder](https://github.com/ferventcoder))
- (MODULES-3037) Confine install path fact w/default [#18](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/18) ([ferventcoder](https://github.com/ferventcoder))
- Change templates to use windows 2008r2 without wmf5 [#16](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/16) ([ThoughtCrhyme](https://github.com/ThoughtCrhyme))
- (MODULES-3356) Branding Name Change [#15](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/15) ([jpogran](https://github.com/jpogran))
- (MODULES-3043) add acceptance and reference test for choco install [#14](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/14) ([ThoughtCrhyme](https://github.com/ThoughtCrhyme))
- (MODULES-3037) Manage sources [#1](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/1) ([ferventcoder](https://github.com/ferventcoder))

## [1.2.3](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/1.2.3) - 2016-05-06

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/1.2.2...1.2.3)

### Other

- (maint) modsync update - master [#13](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/13) ([glennsarti](https://github.com/glennsarti))
- Tests/master/modules 3138 [#12](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/12) ([ThoughtCrhyme](https://github.com/ThoughtCrhyme))
- Tests/master/modules 3138 [#11](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/11) ([ThoughtCrhyme](https://github.com/ThoughtCrhyme))
- (MODULES-3138) Added presuites [#10](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/10) ([ThoughtCrhyme](https://github.com/ThoughtCrhyme))

## [1.2.2](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/1.2.2) - 2016-04-06

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/1.2.1...1.2.2)

### Other

- (MODULES-3161) Add acceptance test harness [#8](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/8) ([glennsarti](https://github.com/glennsarti))
- (maint) Update readme with puppetlabs references [#7](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/7) ([glennsarti](https://github.com/glennsarti))
- (MODULES-3209) Modify metadata with minimum specifications [#6](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/6) ([glennsarti](https://github.com/glennsarti))
- (MODULES-3161) Add rake tests task [#5](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/5) ([glennsarti](https://github.com/glennsarti))
- (MODULES-3200) Prepare chocolatey module for modulesync [#4](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/4) ([glennsarti](https://github.com/glennsarti))
- (FM-4881) Remove gem install bundler on Appveyor [#3](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/3) ([glennsarti](https://github.com/glennsarti))
- (maint) Remove compiled extensions from Gemfile [#2](https://github.com/puppetlabs/puppetlabs-chocolatey/pull/2) ([glennsarti](https://github.com/glennsarti))

## [1.2.1](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/1.2.1) - 2015-12-08

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/1.2.0...1.2.1)

## [1.2.0](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/1.2.0) - 2015-11-03

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/1.1.2...1.2.0)

## [1.1.2](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/1.1.2) - 2015-10-02

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/1.1.1...1.1.2)

## [1.1.1](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/1.1.1) - 2015-09-25

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/1.1.0...1.1.1)

## [1.1.0](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/1.1.0) - 2015-09-09

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/1.0.2...1.1.0)

## [1.0.2](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/1.0.2) - 2015-07-23

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/1.0.1...1.0.2)

## [1.0.1](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/1.0.1) - 2015-07-01

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/1.0.0...1.0.1)

## [1.0.0](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/1.0.0) - 2015-06-08

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/0.5.3...1.0.0)

## [0.5.3](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/0.5.3) - 2015-05-22

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/0.5.2...0.5.3)

## [0.5.2](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/0.5.2) - 2015-04-23

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/0.5.1...0.5.2)

## [0.5.1](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/0.5.1) - 2015-03-31

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/0.5.0...0.5.1)

## [0.5.0](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/0.5.0) - 2015-03-30

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/0.4.0...0.5.0)

## [0.4.0](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/0.4.0) - 2014-12-22

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/help...0.4.0)

## [help](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/help) - 2014-12-22

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/0.3...help)

## [0.3](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/0.3) - 2014-08-18

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/0.2...0.3)

## [0.2](https://github.com/puppetlabs/puppetlabs-chocolatey/tree/0.2) - 2013-11-19

[Full Changelog](https://github.com/puppetlabs/puppetlabs-chocolatey/compare/af285ea8dbb2b9dd2a08c5374f174cc73ca19e3b...0.2)
