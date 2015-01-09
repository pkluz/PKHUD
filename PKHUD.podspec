Pod::Spec.new do |s|
  s.name = 'PKHUD'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = 'A Swift based reimplementation of the Apple HUD (Volume, Ringer, Rotation,…) for iOS 8.'
  s.homepage = 'https://github.com/pkluz/PKHUD'
  s.authors = { 'Philip Kluz' => 'philip.kluz@zuui.org' }
  s.source = { :git => 'https://github.com/pkluz/PKHUD.git', :tag => '0.0.1' }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'

  s.source_files = 'PKHUD/*.swift'

end
