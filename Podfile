# Uncomment the next line to define a global platform for your project
platform :ios, '14.6'

post_install do |installer|
  installer.pods_project.targets.each do |target|
   target.build_configurations.each do |config|
    config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.6'
   end
  end
 end

target 'Ideas' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Ideas
  pod 'RevenueCat'
  pod 'Firebase/Core'
  pod 'Firebase/Storage'
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'

end
