#
# Be sure to run `pod lib lint GSCountryPickerController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "GSCountryPickerController"
  s.version          = "1.0.0"
  s.summary          = "A simple country picker for iOS with full language support."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
                       GSCountryPickerController provides user to select country from a UITableViewController. It looks like system country picker (Setting -> Preference -> Language & Locale -> Region). Full language support and without any additonal resource bundles.
                       DESC

  s.homepage         = "https://github.com/0x5e/GSCountryPickerController"
  s.screenshots      = "https://github.com/0x5e/GSCountryPickerController/raw/master/Resource/screenshots_1.png", "https://github.com/0x5e/GSCountryPickerController/raw/master/Resource/screenshots_2.png", "https://github.com/0x5e/GSCountryPickerController/raw/master/Resource/screenshots_3.png"
  s.license          = 'MIT'
  s.author           = { "gaosen" => "0x5e@sina.cn" }
  s.source           = { :git => "https://github.com/0x5e/GSCountryPickerController.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'GSCountryPickerController' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
