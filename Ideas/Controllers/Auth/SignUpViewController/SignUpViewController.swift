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
        tf.textContentType = .username
        tf.isSecureTextEntry = false
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
        tf.textContentType = .password
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
        view.addSubview(pickPictureForUserButton)
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signUpButton)
        
        NSLayoutConstraint.activate([
            
            pickPictureForUserButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.28),
            pickPictureForUserButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.14),
            pickPictureForUserButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pickPictureForUserButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2),
            
            nameTextField.topAnchor.constraint(equalTo: pickPictureForUserButton.bottomAnchor, constant: 14),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),

            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 12),
            emailTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),

            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 12),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            signUpButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            signUpButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            signUpButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            signUpButton.heightAnchor.constraint(equalToConstant: 66),
            
            
        ])
    }
    
    @objc private func signUpButtonTapped(){
        guard let name = nameTextField.text, !name.isEmpty,
              let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty
        else {
            let alert = UIAlertController(
                title: "Something Wrong",
                message: "Check that the form are filled",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "Try Again", style: .default))
            self.present(alert, animated: true)
            return
        }
        AuthManager.shared.signUp(email: email, password: password) { [weak self] isSuccess, errorMessage in
            if isSuccess {
                let vc = TabBarViewController()
                vc.modalPresentationStyle = .fullScreen
                self?.present(vc, animated: true)
            }
            else {
                let alert = UIAlertController(title: "Something Wrong", message: errorMessage, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Try Again", style: .default))
                self?.present(alert, animated: true)
            }
        }
    }
}
