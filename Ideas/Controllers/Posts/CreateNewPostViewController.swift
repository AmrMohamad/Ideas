//
//  CreateNewPostViewController.swift
//  Ideas
//
//  Created by Amr Mohamad on 11/12/2023.
//

import UIKit

class CreateNewPostViewController: UIViewController {
    
    let titleTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .emailAddress
        tf.autocapitalizationType = .words
        tf.autocorrectionType = .default
        tf.placeholder = "Enter the Title of Blog"
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        tf.leftViewMode = .always
        tf.backgroundColor = .secondarySystemBackground
        tf.layer.cornerRadius = 8
        tf.layer.shadowRadius = 1.2
        tf.layer.shadowOpacity = 0.2
        tf.layer.shadowColor = UIColor.black.cgColor
        tf.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        return tf
    }()
    
    let addHeaderImagelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.text = "Add the header image:"
        return label
    }()
    
    let headerImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "photo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let postTextView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.isEditable = true
        tv.layer.cornerRadius = 8
        tv.layer.shadowRadius = 1.5
        tv.layer.shadowOpacity = 0.2
        tv.layer.shadowColor = UIColor.black.cgColor
        tv.layer.shadowOffset = CGSize(width: 0.0, height: 3.5)
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        
        title = "Create Post"
        setupNavigationButtons()
        
        view.addSubview(titleTextField)
        view.addSubview(addHeaderImagelabel)
        view.addSubview(headerImage)
        view.addSubview(postTextView)
        
        setConstraints()
    }
    
    func setupNavigationButtons(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Post",
            style: .done,
            target: self,
            action: #selector(sendPost)
        )
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Cancel",
            style: .done,
            target: self,
            action: #selector(cancelPost)
        )
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            titleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2),
            titleTextField.heightAnchor.constraint(equalToConstant: 50),
            
            addHeaderImagelabel.leadingAnchor.constraint(equalTo: titleTextField.leadingAnchor, constant: 4),
            addHeaderImagelabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 3),
            
            headerImage.topAnchor.constraint(equalTo: addHeaderImagelabel.bottomAnchor, constant: 3),
            headerImage.leadingAnchor.constraint(equalTo: titleTextField.leadingAnchor),
            headerImage.trailingAnchor.constraint(equalTo: titleTextField.trailingAnchor),
            headerImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.22),
            
            postTextView.leadingAnchor.constraint(equalTo: titleTextField.leadingAnchor),
            postTextView.trailingAnchor.constraint(equalTo: titleTextField.trailingAnchor),
            postTextView.topAnchor.constraint(equalTo: headerImage.bottomAnchor, constant: 6),
            postTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24)
        ])
    }
    
    @objc func sendPost(){
        
    }
    
    @objc func cancelPost(){
        dismiss(animated: true)
    }
}
