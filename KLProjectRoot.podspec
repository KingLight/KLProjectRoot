Pod::Spec.new do |s|

  s.name         = "KLProjectRoot"
  s.version      = "0.0.2"
  s.summary      = "一个通用的项目组件，包含NavigationController和TabBarController"

  s.homepage     = "https://github.com/KingLight/KLProjectRoot.git"

  s.license      = "MIT"

  s.author             = { "King" => "dreamhut417@163.com" }

  s.platform     = :ios
  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/KingLight/KLProjectRoot.git", :tag => "#{s.version}" }

  s.source_files  = "KLProjectRoot/KLProjectRoot/KLProjectRootHeader.h"

  s.frameworks = "Foundation", "UIKit"
  s.requires_arc = true

    s.subspec 'Navigation' do |ss|
        ss.subspec 'Config' do |sss|
            sss.source_files = 'KLProjectRoot/KLProjectRoot/Navigation/Config/*.{h,m}'
        end

        ss.subspec 'NavigationController' do |sss|
            sss.source_files = 'KLProjectRoot/KLProjectRoot/Navigation/NavigationController/*.{h,m}'
        end

        ss.subspec 'NavigationTitleLabel' do |sss|
            sss.dependency 'KLProjectRoot/Navigation/Config'
            sss.source_files = 'KLProjectRoot/KLProjectRoot/Navigation/NavigationTitleLabel/*.{h,m}'
        end

    end

    s.subspec 'Tab' do |ss|
        ss.subspec 'TabBar' do |sss|
            sss.source_files = 'KLProjectRoot/KLProjectRoot/Tab/TabBar/*.{h,m}'
        end

        ss.subspec 'TabBarController' do |sss|
            sss.dependency 'KLProjectRoot/Tab/TabBar'
            sss.source_files = 'KLProjectRoot/KLProjectRoot/Tab/TabBarController/*.{h,m}'
        end
    end

end
