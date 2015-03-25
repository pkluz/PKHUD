Pod::Spec.new do |s|
  s.name                      = 'PKHUD'
  s.module_name               = 'PKHUD'
  s.version                   = '1.0.1'
  s.summary                   = 'A Swift based reimplementation of the Apple HUD (Volume, Ringer, Rotation,…) for iOS 8'
  s.homepage                  = 'https://github.com/pkluz/PKHUD'
  s.license                   = 'MIT'
  s.author                    = { 'Philip Kluz' => 'Philip.Kluz@gmail.com' }
  s.platform                  = :ios, '8.0'
  s.ios.deployment_target     = '8.0'
  s.requires_arc              = true
  s.source                    = { :git => 'https://github.com/retsohuang/PKHUD.git', :tag => s.version }
  s.source_files              = 'PKHUD/**/*.{h,swift}'
  s.resources                 = 'PKHUD/*.xcassets'
end
