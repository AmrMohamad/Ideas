//
//  ProfileViewController+PostsTableViewHandling.swift
//  Ideas
//
//  Created by Amr Mohamad on 24/12/2023.
//

import UIKit

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.textOfContent.text = "Post \(indexPath.row)"
        return cell
    }
    

}
