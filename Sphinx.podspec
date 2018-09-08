Pod::Spec.new do |s|
  s.name             = 'Sphinx'
  s.version          = '0.1.1'
  s.summary          = 'Sphinx: iOS Sqlite Browser in App.'
  s.description      = <<-DESC
    Sphinx: iOS Sqlite Browser in App.
                       DESC
  s.homepage         = 'http://blog.devzeng.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zengjing' => 'zengjing@szboanda.net' }
  s.source           = { :git => 'https://github.com/hhtczengjing/Sphinx.git', :tag => s.version.to_s }
  s.ios.deployment_target = '7.0'
  s.source_files    = 'Sphinx/Classes/**/*'
  s.resource        = 'Sphinx/Assets/SphinxWeb.bundle'
  s.public_header_files = 'Sphinx/Classes/**/*.h'
  s.dependency 'RoutingHTTPServer', '~> 1.0.0'
  s.dependency 'FMDB', '~> 2.7.2'
end
