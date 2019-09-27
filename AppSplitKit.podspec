Pod::Spec.new do |s|
  s.name             = 'AppSplitKit'
  s.version          = '0.1.0'
  s.summary          = 'A light weight module for app  module'
  s.description      = <<-DESC
  use this you can split appdelegate into different modules
                       DESC
  s.homepage         = 'https://github.com/FelixScat/AppSplitKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Felix' => 'zyhzhangyunhao@gmail.com' }
  s.source           = { :git => 'https://github.com/FelixScat/AppSplitKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'

  s.source_files = 'AppSplitKit/Classes/**/*'
end
