//
//  HomeViewController.swift
//  Ideas
//
//  Created by Amr Mohamad on 11/12/2023.
//

import UIKit

class HomeViewController: UIViewController {

    var user: User?
    
    let composeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.setImage(UIImage(
            systemName: "square.and.pencil",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
        ),for: .normal)
        button.layer.cornerRadius = 30
        button.layer.shadowColor = UIColor.label.cgColor
        button.layer.shadowRadius = 14
        button.layer.shadowOpacity = 0.3
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        view.backgroundColor = .red
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(composeButton)
        
        composeButton.addTarget(self, action: #selector(createPost), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            composeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            composeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            composeButton.heightAnchor.constraint(equalToConstant: 60),
            composeButton.widthAnchor.constraint(equalToConstant: 60)
        ])
    }


    @objc func createPost(){
        let vc = CreateNewPostViewController()
        vc.user = self.user
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true)
    }
}

