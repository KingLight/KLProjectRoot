Pod::Spec.new do |s|

  s.name         = "KLProjectRoot"
  s.version      = "0.0.1"
  s.summary      = "一个通用的项目组件，包含NavigationController和TabBarController"

  s.homepage     = "https://github.com/KingLight/KLProjectRoot.git"

  s.license      = "MIT"

  s.author             = { "King" => "dreamhut417@163.com" }

  s.platform     = :ios
  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/KingLight/KLProjectRoot.git", :tag => "#{s.version}" }

  s.source_files  = "KLProjectRoot/KLProjectRoot"

  s.frameworks = "Foundation", "UIKit"
  s.requires_arc = true

end
