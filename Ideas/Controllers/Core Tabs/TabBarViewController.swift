//
//  TabBarViewController.swift
//  Ideas
//
//  Created by Amr Mohamad on 11/12/2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        setupControllers()
    }

    func setupControllers() {
        let homeVC = HomeViewController()
        homeVC.title = "Home"
        let profileVC = ProfileViewController()
        profileVC.title = "Profile"
        DatabaseManager.shared.getUserInfo { user in
            DispatchQueue.main.async {
                profileVC.user = user
                homeVC.user = user
                if let url = user.profilePictureURL{
                    profileVC.profilePictureHeader.loadImagefromCacheWithURLstring(urlString: url )
                }
            }
        }

        let homeVCNav = UINavigationController(rootViewController: homeVC)
        let ProfileVCNav = UINavigationController(rootViewController: profileVC)

        homeVCNav.tabBarItem.image = UIImage(systemName: "house")
        homeVCNav.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        ProfileVCNav.tabBarItem.image = UIImage(systemName: "person")
        ProfileVCNav.tabBarItem.selectedImage = UIImage(systemName: "person.fill")

        setViewControllers(
            [
                homeVCNav,
                ProfileVCNav,
            ],
            animated: true
        )
    }
}
