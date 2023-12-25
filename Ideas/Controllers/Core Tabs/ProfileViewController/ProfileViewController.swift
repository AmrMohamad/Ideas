//
//  ProfileViewController.swift
//  Ideas
//
//  Created by Amr Mohamad on 11/12/2023.
//

import UIKit

class ProfileViewController: UIViewController {

    var user:User? {
        didSet {
            emailLabelHeader.text = user!.email
            nameLabelHeader.text = user!.name
        }
    }
    
    let postsTableView: UITableView = {
        let table = UITableView()
        table.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        table.backgroundColor = .secondarySystemBackground
        return table
    }()
    
    let nameLabelHeader : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.text = "55555"
        return label
    }()
    
    let emailLabelHeader : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    let profilePictureHeader : UIImageView = {
        let profilePicture = UIImageView(image: UIImage(systemName: "person.circle"))
        profilePicture.translatesAutoresizingMaskIntoConstraints = false
        profilePicture.contentMode = .scaleAspectFill
        return profilePicture
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Sign Out",
            style: .done,
            target: self,
            action: #selector(handleSignOutButtonTapped)
        )
        
        setupTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        postsTableView.frame = view.bounds
    }
    
    func setupTableView() {
        postsTableView.dataSource = self
        postsTableView.delegate = self
        
        view.addSubview(postsTableView)
        
        setupHeaderTableView()
    }
    
    func setupHeaderTableView() {
        let headerViewContainer = UIView()
        headerViewContainer.frame = CGRect(x: 0, y: 0, width: view.frame.width , height: 100)
        postsTableView.tableHeaderView = headerViewContainer
        
        let headerView = UIView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = .systemBackground
        headerView.layer.cornerRadius = 12
        
        headerViewContainer.addSubview(headerView)
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: headerViewContainer.topAnchor, constant: 12),
            headerView.bottomAnchor.constraint(equalTo: headerViewContainer.bottomAnchor, constant: -12),
            headerView.leadingAnchor.constraint(equalTo: headerViewContainer.leadingAnchor, constant: 12),
            headerView.trailingAnchor.constraint(equalTo: headerViewContainer.trailingAnchor, constant: -12),
        ])
        //Profile Picture
        headerView.addSubview(profilePictureHeader)
        //Email
        headerView.addSubview(emailLabelHeader)
        headerView.addSubview(nameLabelHeader)
        
        NSLayoutConstraint.activate([
            profilePictureHeader.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            profilePictureHeader.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            profilePictureHeader.widthAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.80),
            profilePictureHeader.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.80),
            
            nameLabelHeader.leadingAnchor.constraint(equalTo: profilePictureHeader.trailingAnchor, constant: 8),
            nameLabelHeader.topAnchor.constraint(equalTo: profilePictureHeader.topAnchor, constant: 8),
            
            emailLabelHeader.leadingAnchor.constraint(equalTo: nameLabelHeader.leadingAnchor),
            emailLabelHeader.topAnchor.constraint(equalTo: nameLabelHeader.bottomAnchor, constant: 4)
            
        ])
        
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
