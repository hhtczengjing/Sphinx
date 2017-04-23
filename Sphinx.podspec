Pod::Spec.new do |s|
  s.name             = 'Sphinx'
  s.version          = '0.1.0'
  s.summary          = 'Sphinx: iOS Sqlite Browser in App.'
  s.description      = <<-DESC
    Sphinx: iOS Sqlite Browser in App.
                       DESC
  s.homepage         = 'https://github.com/zengjing/Sphinx'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zengjing' => 'hhtczengjing@gmail.com' }
  s.source           = { :git => 'https://github.com/zengjing/Sphinx.git', :tag => s.version.to_s }
  s.ios.deployment_target = '7.0'
  s.source_files = 'Sphinx/Classes/**/*'
  s.resource             = 'Sphinx/Assets/SphinxWeb.bundle'
  s.public_header_files = 'Sphinx/Classes/**/*.h'
  s.dependency 'RoutingHTTPServer', '~> 1.0.1'
  s.dependency 'FMDB', '~> 2.6.2'
end
