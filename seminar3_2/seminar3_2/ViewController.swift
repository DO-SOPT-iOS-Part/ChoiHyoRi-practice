//
//  ViewController.swift
//  seminar3_2
//
//  Created by Hyori Choi on 10/28/23.
//

import UIKit
import Then
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setCollectionViewConfig()
        // Do any additional setup after loading the view.
    }
    private func setCollectionViewConfig() {
            self.collectionView.register(ImageCollectionViewCell.self,
                                         forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
        }


    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
            $0.backgroundColor = .black
        }
    private func setLayout() {
            self.view.addSubview(collectionView)
            collectionView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
        }
}
extension ViewController: UICollectionViewDelegate {}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImageCollectionData.imageCollectionList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier,
                                                            for: indexPath) as? ImageCollectionViewCell else {return UICollectionViewCell()}
        item.delegate = self
        item.bindData(data: ImageCollectionData.imageCollectionList[indexPath.row])
        return item
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 6) / 3 , height: (UIScreen.main.bounds.width - 6) / 3)
    }
}

extension ViewController: ItemSelectedProtocol {
    func getButtonState(state: Bool, row: Int) {
        imageCollectionList[row].isLiked = state
    }
}
