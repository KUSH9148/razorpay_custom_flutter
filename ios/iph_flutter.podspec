#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint iph_flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'iph_flutter'
  s.version          = '0.0.1'
  s.summary          = 'Integrate iha in your flutter app.'
  s.description      = 'Integrate iha in your flutter app.'
  s.homepage         = 'http://exampledsfdsfdsf.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'iPhysicianHub' => 'XXXdsfdXX@XXXXXX.XXXXXXXXXXXX' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'razorpay-pod'
  s.platform = :ios, '10.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
