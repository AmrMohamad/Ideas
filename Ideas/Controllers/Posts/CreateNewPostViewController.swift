//
//  CreateNewPostViewController.swift
//  Ideas
//
//  Created by Amr Mohamad on 11/12/2023.
//

import UIKit

class CreateNewPostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        
        title = "Create Post"
        setupNavigationButtons()
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
    
    @objc func sendPost(){
        
    }
    
    @objc func cancelPost(){
        dismiss(animated: true)
    }
}
