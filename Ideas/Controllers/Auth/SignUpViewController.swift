//
//  SignUpViewController.swift
//  Ideas
//
//  Created by Amr Mohamad on 11/12/2023.
//

import UIKit

class SignUpViewController: UIViewController {

    
    lazy var pickPictureForUserButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "person.crop.rectangle.badge.plus"), for: .normal)
        return button
    }()
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.placeholder = "Full Name"
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        tf.leftViewMode = .always
        tf.backgroundColor = .secondarySystemBackground
        tf.layer.cornerRadius = 8
        tf.layer.shadowRadius = 6.0
        tf.layer.shadowOpacity = 0.2
        tf.layer.shadowColor = UIColor.black.cgColor
        tf.layer.shadowOffset = CGSize(width: 0.0, height: 4.5)
        return tf
    }()
    
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
        tf.layer.shadowColor = UIColor.black.cgColor
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
        tf.layer.shadowColor = UIColor.black.cgColor
        tf.layer.shadowOffset = CGSize(width: 0.0, height: 4.5)
        return tf
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 26, weight: .medium)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Create Account"
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let stack = UIStackView(arrangedSubviews: [
            pickPictureForUserButton,
            nameTextField,
            emailTextField,
            passwordTextField
        ])
        stack.axis = .vertical
        stack.spacing = 16
        stack.alignment = .center
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        view.addSubview(signUpButton)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            pickPictureForUserButton.heightAnchor.constraint(equalToConstant: 80),
            pickPictureForUserButton.widthAnchor.constraint(equalToConstant: 100),
            
            nameTextField.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            emailTextField.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            signUpButton.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            signUpButton.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            signUpButton.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 26),
            signUpButton.heightAnchor.constraint(equalToConstant: 66)
            
        ])
    }
    
    @objc private func signUpButtonTapped(){
        
    }
}
