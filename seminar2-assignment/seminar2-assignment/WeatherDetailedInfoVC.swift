//
//  WeatherDetailedInfoVC.swift
//  seminar2-assignment
//
//  Created by Hyori Choi on 11/14/23.
//

import UIKit

import SnapKit
import Then

class WeatherDetailedInfoVC: UIViewController {
    
    private let verticalScrollView = UIScrollView()
    private var contentView = UIView()
    private let weatherDetailedInfoView = WeatherDetailedInfoView()
    private let descriptionView = UIView()
    private let weatherBriefingView = WeatherBriefingView()
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.setBackgroundImage()
        self.setCollectionViewConfig()
        self.setTableViewConfig()
        self.setUI()
    }
    
}

extension WeatherDetailedInfoVC {
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        verticalScrollView.do {
            $0.showsVerticalScrollIndicator = false
        }
        
        descriptionView.do {
            $0.backgroundColor = UIColor.black.withAlphaComponent(0.2)
            $0.layer.cornerRadius = 20
        }
        
        weatherBriefingView.do {
            $0.bindData(text: "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다.")
        }
        
        collectionView.do {
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .clear
            $0.layer.cornerRadius = 20
        }
        
        tableView.do {
            $0.sectionHeaderTopPadding = 0
            $0.showsVerticalScrollIndicator = false
            $0.isScrollEnabled = false
            $0.backgroundColor = .black.withAlphaComponent(0.1)
            $0.layer.cornerRadius = 20
            $0.separatorStyle = .none
        }
    }
    
    private func setLayout() {
        self.view.addSubview(verticalScrollView)
        
        verticalScrollView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(80)
        }
        
        verticalScrollView.addSubview(contentView)
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(verticalScrollView)
            $0.width.equalTo(verticalScrollView)
            $0.height.greaterThanOrEqualTo(verticalScrollView.snp.height)
        }
        
        [weatherDetailedInfoView, descriptionView, tableView].forEach {
            contentView.addSubview($0)
        }
        
        weatherDetailedInfoView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.height.equalTo(212)
            $0.centerX.equalToSuperview()
        }
        
        descriptionView.snp.makeConstraints {
            $0.top.equalTo(weatherDetailedInfoView.snp.bottom).offset(100)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        [weatherBriefingView, collectionView].forEach {
            descriptionView.addSubview($0)
        }
        
        weatherBriefingView.snp.makeConstraints {
            $0.top.equalTo(descriptionView).inset(10)
            $0.leading.trailing.equalTo(descriptionView).inset(16)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(weatherBriefingView.snp.bottom)
            $0.leading.trailing.bottom.equalTo(descriptionView)
            $0.height.equalTo(120)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(descriptionView.snp.bottom).offset(10)
            $0.bottom.equalTo(contentView).inset(30)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(590)
        }
    }
    
    private func setBackgroundImage() {
        let backgroundImageView = UIImageView(image: UIImage(named: "background_image1"))
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = view.bounds
        view.insertSubview(backgroundImageView, at: 0)
    }
    
    private func setCollectionViewConfig() {
        self.collectionView.register(TimelyWeatherCollectionViewCell.self,
                                     forCellWithReuseIdentifier: TimelyWeatherCollectionViewCell.identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 60) / 5 , height: 142)
        flowLayout.scrollDirection = .horizontal
        self.collectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    private func setTableViewConfig() {
        self.tableView.register(WeatherForecastTableViewCell.self,
                                forCellReuseIdentifier: WeatherForecastTableViewCell.identifier)
        self.tableView.register(CustomTableHeaderView.self, forHeaderFooterViewReuseIdentifier: CustomTableHeaderView.identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func bindData(data: WeatherInfoListData) {
        weatherDetailedInfoView.bindData(data: data)
    }
    
}

extension WeatherDetailedInfoVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timelyWeatherListData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: TimelyWeatherCollectionViewCell.identifier,
                                                            for: indexPath) as? TimelyWeatherCollectionViewCell else {return UICollectionViewCell()}
        item.bindData(data: timelyWeatherListData[indexPath.row])
        return item
    }
    
}

extension WeatherDetailedInfoVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherForecastListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherForecastTableViewCell.identifier,
                                                       for: indexPath) as? WeatherForecastTableViewCell else {return UITableViewCell()}
        cell.bindData(data: weatherForecastListData[indexPath.row])
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomTableHeaderView.identifier) as? CustomTableHeaderView
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
}