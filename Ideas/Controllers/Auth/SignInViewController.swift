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
        tf.layer.shadowRadius = 6.0
        tf.layer.shadowOpacity = 0.2
        tf.layer.shadowColor = UIColor.label.cgColor
        tf.layer.shadowOffset = CGSize(width: 0.0, height: 4.5)
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
        tf.layer.shadowRadius = 6.0
        tf.layer.shadowOpacity = 0.2
        tf.layer.shadowColor = UIColor.label.cgColor
        tf.layer.shadowOffset = CGSize(width: 0.0, height: 4.5)
        return tf
    }()

    lazy var signinButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 26, weight: .medium)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(signinButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var createAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create Account", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        button.setTitleColor( .link, for: .normal)
        button.addTarget(self, action: #selector(createAccountButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Sign In"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(signinHeaderView)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signinButton)
        view.addSubview(createAccountButton)
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
            emailTextField.topAnchor.constraint(equalTo: signinHeaderView.bottomAnchor, constant: 26),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            signinButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 22),
            signinButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            signinButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            signinButton.heightAnchor.constraint(equalToConstant: 50),
            
            createAccountButton.topAnchor.constraint(equalTo: signinButton.bottomAnchor, constant: 16),
            createAccountButton.leadingAnchor.constraint(equalTo: signinButton.leadingAnchor),
            createAccountButton.trailingAnchor.constraint(equalTo: signinButton.trailingAnchor),
            createAccountButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    @objc private func signinButtonTapped (){
        print("signed in")
    }
    
    @objc private func createAccountButtonTapped (){
        print("createAccountButtonTapped")
    }
}
