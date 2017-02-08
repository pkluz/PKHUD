Pod::Spec.new do |s|
  s.name                      = 'PKHUD'
  s.module_name               = 'PKHUD'
  s.version                   = '4.2.0'
  s.summary                   = 'A Swift 3 based reimplementation of the Apple HUD (Volume, Ringer, Rotation,…) for iOS 8/macOS 10.11 and up'
  s.homepage                  = 'https://github.com/pkluz/PKHUD'
  s.license                   = 'MIT'
  s.author                    = { 'Philip Kluz' => 'Philip.Kluz@gmail.com' }
  s.ios.deployment_target     = '8.0'
  s.osx.deployment_target     = '10.11'
  s.requires_arc              = true
  s.source                    = { :git => 'https://github.com/pkluz/PKHUD.git', :tag => s.version.to_s }
  s.source_files              = 'PKHUD/**/*.swift'
  s.osx.source_files          = 'PKHUDMACOS/**/*.swift'
  s.resources                 = 'PKHUD/*.xcassets'
end
