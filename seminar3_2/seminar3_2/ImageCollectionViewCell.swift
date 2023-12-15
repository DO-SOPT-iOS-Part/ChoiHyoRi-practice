//
//  ImageCollectionViewCell.swift
//  seminar3_2
//
//  Created by Hyori Choi on 10/28/23.
//

import UIKit

protocol ItemSelectedProtocol: NSObject {
    func getButtonState(state: Bool, row: Int)
}

class ImageCollectionViewCell: UICollectionViewCell {
    
        static let identifier: String = "ImageCollectionViewCell"
   
    var itemRow: Int?
    func bindData(data: ImageCollectionData,
                      row: Int) {
            self.imageView.image = UIImage(named: data.image)
            self.likeButton.isSelected = data.isLiked
            self.itemRow = row
        }
    
    weak var delegate: ItemSelectedProtocol?

    @objc private func likeButtonTap() {
            self.likeButton.isSelected.toggle()
            if let itemRow {
                self.delegate?.getButtonState(state: self.likeButton.isSelected,
                                              row: itemRow)
            }
        }
        
        private lazy var likeButton = UIButton().then {
            $0.addTarget(self,
                         action: #selector(likeButtonTap),
                         for: .touchUpInside)
            $0.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
            $0.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .selected)
        }
    
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            self.setLayout()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setLayout() {
            [imageView, likeButton].forEach {
                self.contentView.addSubview($0)
            }
            
            imageView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
            likeButton.snp.makeConstraints {
                $0.bottom.trailing.equalToSuperview().inset(16)
            }
        }
    
    func bindData(data: ImageCollectionData) {
        self.imageView.image = UIImage(named: data.image)
        self.likeButton.isSelected = data.isLiked
    }
        
        private let imageView = UIImageView()

    
}





