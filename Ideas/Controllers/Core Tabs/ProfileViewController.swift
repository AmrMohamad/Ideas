//
//  ProfileViewController.swift
//  Ideas
//
//  Created by Amr Mohamad on 11/12/2023.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Sign Out",
            style: .done,
            target: self,
            action: #selector(handleSignOutButtonTapped)
        )
    }

    @objc private func handleSignOutButtonTapped() {
        
    }
}
