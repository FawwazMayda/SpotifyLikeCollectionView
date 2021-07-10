//
//  CustomCell.swift
//  SpotifyLikeCollection
//
//  Created by Muhammad Fawwaz Mayda on 10/07/21.
//

import UIKit

class CustomCell: UICollectionViewCell {
    lazy var sectionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Section Title"
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(sectionTitleLabel)
        setupConstraint()
    }
    
    func setupConstraint() {
        sectionTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
