Pod::Spec.new do |s|
  s.name             = 'ShopLogin'
  s.version          = '1.0.0'
  s.summary          = 'Login business component for the Shop app.'
  s.description      = 'ShopLogin provides LoginViewController, LoginViewModel, Target_Login, and route registration for the login flow.'
  s.homepage         = 'https://github.com/inhua/ShopLogin'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'inhua' => 'dev@inhua.com' }
  s.source           = { :git => 'https://github.com/inhua/ShopLogin.git', :tag => s.version.to_s }

  s.ios.deployment_target = '18.1'
  s.swift_version = '5.0'

  s.source_files = 'Sources/**/*.swift'

  s.dependency 'ShopBase'
  s.dependency 'ShopRouter'
  s.dependency 'ShopMediator'
  s.dependency 'ShopBusinessBase'
end
