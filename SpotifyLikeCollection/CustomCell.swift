//
//  CustomCell.swift
//  SpotifyLikeCollection
//
//  Created by Muhammad Fawwaz Mayda on 10/07/21.
//

import UIKit

class CustomCell: UICollectionViewCell {
    let subCellId = "sub_cell_id"
    let tagCellId = "tag_cell_id"
    
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
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    lazy var tagCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 2.0, left: 2.0, bottom: 2.0, right: 2.0)
        
        let cv = UICollectionView(frame: frame, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(sectionTitleLabel)
        self.contentView.addSubview(tagCollectionView)
        self.contentView.addSubview(collectionView)
        backgroundColor = UIColor.systemPurple
        setupConstraint()
        
        // setup Tag CV
        tagCollectionView.dataSource = self
        tagCollectionView.delegate = self
        tagCollectionView.register(SongTagCell.self, forCellWithReuseIdentifier: tagCellId)
        // for differentiation
        tagCollectionView.tag = 1
        
        // setup CV
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SubCustomCell.self, forCellWithReuseIdentifier: subCellId)
        // for differentiation
        collectionView.tag = 2
    }
    
    func setupConstraint() {
        sectionTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        
        tagCollectionView.topAnchor.constraint(equalTo: sectionTitleLabel.bottomAnchor, constant: 10.0).isActive = true
        tagCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5.0).isActive = true
        tagCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5.0).isActive = true
        tagCollectionView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: tagCollectionView.bottomAnchor, constant: 10).isActive = true
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
        if collectionView.tag == 1 {
            return 20
        }
        return 5
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 1 {
            return CGSize(width: 40, height: 16)
        }
        return CGSize(width: 160, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tagCellId, for: indexPath) as! SongTagCell
            cell.backgroundColor = UIColor.brown
            cell.layer.cornerRadius = 4.0
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: subCellId, for: indexPath) as! SubCustomCell
        cell.backgroundColor = UIColor.gray
        cell.layer.cornerRadius = 16.0
        return cell
    }
    
    
}
