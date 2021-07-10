//
//  SongTagCell.swift
//  SpotifyLikeCollection
//
//  Created by Muhammad Fawwaz Mayda on 10/07/21.
//

import UIKit

class SongTagCell: UICollectionViewCell {
    lazy var tagLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 8.0)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(tagLabel)
        tagLabel.text = "For You"
        tagLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        tagLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
