//
//  SignInHeaderView.swift
//  Ideas
//
//  Created by Amr Mohamad on 22/12/2023.
//

import UIKit

class SignInHeaderView: UIView {
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        return imageView
    }()

    let descriptiveLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        label.text = "Explore millions of blogs!"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(logoImageView)
        addSubview(descriptiveLabel)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 68),
            logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -68),
            logoImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.68),
            logoImageView.topAnchor.constraint(equalTo: topAnchor),
            
            descriptiveLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptiveLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 6)
        ])
    }
}
