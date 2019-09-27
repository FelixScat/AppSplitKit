Pod::Spec.new do |s|
  s.name             = 'AppSplitKit'
  s.version          = '0.1.0'
  s.summary          = 'A short description of AppSplitKit.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
  s.homepage         = 'https://github.com/Felix/AppSplitKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Felix' => 'Felix@gmail.com' }
  s.source           = { :git => 'https://github.com/Felix/AppSplitKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'

  s.source_files = 'AppSplitKit/Classes/**/*'
end
