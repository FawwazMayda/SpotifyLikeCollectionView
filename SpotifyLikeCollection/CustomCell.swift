//
//  CustomCell.swift
//  SpotifyLikeCollection
//
//  Created by Muhammad Fawwaz Mayda on 10/07/21.
//

import UIKit

class CustomCell: UICollectionViewCell {
    let subCellId = "sub_cell_id"
    
    lazy var sectionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Section Title"
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        
        let cv = UICollectionView(frame: frame,collectionViewLayout: layout)
        cv.backgroundColor = UIColor.clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(sectionTitleLabel)
        self.contentView.addSubview(collectionView)
        backgroundColor = UIColor.systemPurple
        setupConstraint()
        
        // setup CV
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SubCustomCell.self, forCellWithReuseIdentifier: subCellId)
    }
    
    func setupConstraint() {
        sectionTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: sectionTitleLabel.bottomAnchor, constant: 10).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: subCellId, for: indexPath) as! SubCustomCell
        cell.backgroundColor = UIColor.gray
        cell.layer.cornerRadius = 16.0
        return cell
    }
    
    
}
