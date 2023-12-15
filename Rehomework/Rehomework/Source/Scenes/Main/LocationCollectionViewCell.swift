//
//  LocationCollectionViewCell.swift
//  Rehomework
//
//  Created by Hyori Choi on 12/14/23.
//

import UIKit

class LocationCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "LocationCollectionViewCell"
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            self.setUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "small")
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    func setUI() {
        setHierarchy()
        setConstraints()
    }

    func setHierarchy() {
        contentView.backgroundColor = .clear
        contentView.addSubview(imageView)
    }

    func setConstraints() {
        imageView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalToSuperview()
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
    }
    
 
    
}
