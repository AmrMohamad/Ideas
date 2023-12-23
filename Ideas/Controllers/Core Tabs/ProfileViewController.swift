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
        let alert = UIAlertController(title: "Sign Up", message: "Are you sure about Signing Out?", preferredStyle: .alert)
        let signoutAction = UIAlertAction(title: "Sign Out", style: .destructive) { [weak self]_ in
            AuthManager.shared.signOut { [weak self] isSuccess in
                if isSuccess {
                    let nav = UINavigationController(rootViewController: SignInViewController())
                    nav.modalPresentationStyle = .fullScreen
                    self?.present(nav, animated: true)
                }else{
                    let alert = UIAlertController(title: "Something Wrong", message: "There is someting wrong with network. Try again later.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Try Again", style: .default))
                    self?.present(alert, animated: true)
                }
            }
        }
        let cancelAction = UIAlertAction(title: "Canecl", style: .cancel)
        alert.addAction(signoutAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}
