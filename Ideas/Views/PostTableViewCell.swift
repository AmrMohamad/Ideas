//
//  PostTableViewCell.swift
//  Ideas
//
//  Created by Amr Mohamad on 24/12/2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    static let identifier = "PostCell"
    
    let textOfContent: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(textOfContent)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        NSLayoutConstraint.activate([
            textOfContent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textOfContent.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16)
        ])
    }
}
