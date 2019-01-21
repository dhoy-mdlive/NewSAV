# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

    # Fix for iOS Simulator deployment target warning on Xcode 10
    post_install do |installer|
        puts 'Determining pod project minimal deployment target'
    
        pods_project = installer.pods_project
        deployment_target_key = 'IPHONEOS_DEPLOYMENT_TARGET'
        deployment_targets = pods_project.build_configurations.map{ |config| config.build_settings[deployment_target_key] }
        minimal_deployment_target = deployment_targets.min_by{ |version| Gem::Version.new(version) }
    
        puts 'Minimal deployment target is ' + minimal_deployment_target
        puts 'Setting each pod deployment target to ' + minimal_deployment_target
    
        installer.pods_project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings[deployment_target_key] = minimal_deployment_target
            end
        end
    end
    

target 'MDLIVE New Dashboard' do
    # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
    use_frameworks!

    # Pods for MDLIVE New Dashboard
    pod 'Montserrat'
    pod 'UIView+Borders'
    pod 'M13BadgeView'
    #pod 'BEMCheckBox'
  
end
