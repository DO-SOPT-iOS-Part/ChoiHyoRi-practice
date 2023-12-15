//
//  ViewController.swift
//  Rehomework
//
//  Created by Hyori Choi on 12/4/23.
//
import UIKit

import SnapKit

final class ViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "날씨"
        label.textColor = .white
        label.font = .systemFont(ofSize: 36)
        return label
    }()
    private let moreBtn: UIButton = {
        var Button = UIButton()
        Button.setImage(UIImage(named: "more"), for: .normal)
        
        return Button
    }()
    
    private let SearchBar: UISearchBar = {
        var bar = UISearchBar()
        bar.placeholder = "도시 또는 공항 검색"
        bar.backgroundColor = .clear
        bar.isTranslucent = true
        bar.backgroundImage = UIImage()
        return bar
    }()
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 335, height: 117)
        flowLayout.minimumInteritemSpacing = 8
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionview.backgroundColor = .clear
        //collectionview.showsHorizontalScrollIndicator = false
        return collectionview
    }()
    
    private func setCollectionViewConfig() {
        self.collectionView.register(LocationCollectionViewCell.self,
                                     forCellWithReuseIdentifier: LocationCollectionViewCell.identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionViewConfig()
        setUI()
        view.backgroundColor = .black
    }
    
    func setUI() {
        setHierarchy()
        setConstraints()
    }
    
    func setHierarchy() {
        self.view.addSubview(titleLabel)
        self.view.addSubview(moreBtn)
        self.view.addSubview(SearchBar)
        self.view.addSubview(collectionView)
    }
    
    func setConstraints() {
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(97)
            $0.leading.equalToSuperview().inset(20)
        }
        moreBtn.snp.makeConstraints{
            $0.top.equalToSuperview().inset(52)
            $0.trailing.equalToSuperview().inset(10)
        }
        SearchBar.snp.makeConstraints{
            $0.width.equalTo(335)
            $0.height.equalTo(40)
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        collectionView.snp.makeConstraints{
            $0.top.equalTo(SearchBar.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(20)
        }
        
    }
}

extension ViewController: UICollectionViewDelegate {}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: LocationCollectionViewCell.identifier,for: indexPath) as? LocationCollectionViewCell else {return UICollectionViewCell()}
        return item
    }
}


