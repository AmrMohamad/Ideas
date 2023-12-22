//
//  SignInViewController.swift
//  Ideas
//
//  Created by Amr Mohamad on 11/12/2023.
//

import UIKit

class SignInViewController: UIViewController {
    
    let signinHeaderView = SignInHeaderView()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .emailAddress
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.placeholder = "Email Address"
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        tf.leftViewMode = .always
        tf.backgroundColor = .secondarySystemBackground
        tf.layer.cornerRadius = 8
        tf.layer.masksToBounds = true
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        tf.leftViewMode = .always
        tf.backgroundColor = .secondarySystemBackground
        tf.layer.cornerRadius = 8
        tf.layer.masksToBounds = true
        return tf
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Sign In"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(signinHeaderView)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signinHeaderView.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            signinHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2),
            signinHeaderView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signinHeaderView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            signinHeaderView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
            
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: signinHeaderView.bottomAnchor, constant: 36),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
}
