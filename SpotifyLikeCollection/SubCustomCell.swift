//
//  SubCustomCell.swift
//  SpotifyLikeCollection
//
//  Created by Muhammad Fawwaz Mayda on 10/07/21.
//

import UIKit

class SubCustomCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 16.0
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(artistLabel)
        clipsToBounds = true
        imageView.image = #imageLiteral(resourceName: "annie")
        titleLabel.text = "Save your tears"
        artistLabel.text = "Annie Leonhart"
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraint() {
        
        // artistLabel
        artistLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
        artistLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5).isActive = true
        
        // titleLabel
        titleLabel.bottomAnchor.constraint(equalTo: artistLabel.topAnchor, constant: -5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5).isActive = true
        
        
        // img
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -5.0).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: 0).isActive = true
    }
}
