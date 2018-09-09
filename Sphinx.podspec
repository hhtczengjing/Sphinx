Pod::Spec.new do |s|
  s.name             = 'Sphinx'
  s.version          = '0.2.0'
  s.summary          = 'Sphinx: iOS Sqlite Browser in App.'
  s.description      = <<-DESC
    Sphinx: iOS Sqlite Browser in App.
                       DESC
  s.homepage         = 'http://blog.devzeng.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zengjing' => 'hhtczengjing@gmail.com' }
  s.source           = { :git => 'https://github.com/hhtczengjing/Sphinx.git', :tag => s.version.to_s }
  s.ios.deployment_target = '7.0'
  s.ios.frameworks   = 'CFNetwork', 'Security'
  s.osx.frameworks   = 'CoreServices', 'Security'
  s.libraries        = 'xml2'
  s.xcconfig         = {"HEADER_SEARCH_PATHS" => "\"$(SDKROOT)/usr/include/libxml2\""}
  s.source_files     = 'Sphinx/{Classes, Vendor}/**/*.{h,m,mm,c,cpp}'
  s.resource         = 'Sphinx/Assets/SphinxWeb.bundle'
  s.public_header_files = 'Sphinx/{Classes, Vendor}/**/*.h'
  s.dependency 'CocoaAsyncSocket', '~> 7.6.3'
  s.dependency 'FMDB', '~> 2.7.2'
end
