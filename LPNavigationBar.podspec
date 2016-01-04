Pod::Spec.new do |s|
  s.name             = "LPNavigationBar"
  s.version          = "1.0.0"
  s.summary          = "change the height & backgroundColor of UINavigationBar dynamically"
  s.description      = <<-DESC
                       a swift extension for changing the height & backgroundColor of UINavigationBar dynamically.
                       DESC
  s.homepage         = "https://github.com/litt1e-p/LPNavigationBar"
  # s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = { :type => 'MIT' }
  s.author           = { "litt1e-p" => "litt1e.p4ul@gmail.com" }
  s.source           = { :git => "https://github.com/litt1e-p/LPNavigationBar.git", :tag => '1.0.0' }
  # s.social_media_url = 'https://twitter.com/NAME'
  s.platform = :ios, '7.0'
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true
  s.source_files = 'LPNavigationBar/*'
  # s.resources = 'Assets'
  # s.ios.exclude_files = 'Classes/osx'
  # s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  s.frameworks = 'Foundation', 'UIKit'
end
