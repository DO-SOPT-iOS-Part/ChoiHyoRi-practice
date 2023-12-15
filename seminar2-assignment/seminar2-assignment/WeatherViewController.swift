
//
//  WeatherViewController.swift
//  seminar2-assignment
//
//  Created by Hyori Choi on 11/1/23.
//

import UIKit
import SnapKit

class WeatherViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        setBackGround()
        setWeatherScroll()
        
    }
    @objc func pop() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private var backgroundImageView: UIImageView = {
        let backgroundImage = UIImage(named: "backgroundLarge")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill
        return backgroundImageView
    }()
    
    private func setBackGround(){
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(backgroundImageView)
        NSLayoutConstraint.activate([backgroundImageView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     backgroundImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     backgroundImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     backgroundImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)])
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                                     scrollView.leadingAnchor.constraint(equalTo:backgroundImageView.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)])
        
        NSLayoutConstraint.activate([contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                                     contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                                     contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                                     contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                                     contentView.heightAnchor.constraint(equalToConstant: 1000)])
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        setLayout()
        
    }
    
    private func setLayout() {
        [locationLabel, temperature, weatherText, maxmin].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([locationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 90),
                                     locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 130)
                                    ])
        NSLayoutConstraint.activate([temperature.topAnchor.constraint(equalTo: locationLabel.topAnchor, constant: 50),
                                     temperature.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 135),
                                    ])
        NSLayoutConstraint.activate([weatherText.topAnchor.constraint(equalTo: locationLabel.topAnchor, constant: 165),
                                     weatherText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 165),
                                    ])
        NSLayoutConstraint.activate([maxmin.topAnchor.constraint(equalTo: locationLabel.topAnchor, constant: 195),
                                     maxmin.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 120),
                                    ])
        
        contentView.addSubview(smallView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        ])
        //        smallView.addSubview(descriptionLabel)
        //        smallView.addSubview(line)
        //        smallView.addSubview(TimeStackView)
        //
        timeScroll.addSubview(TimeStackView)
        [descriptionLabel, line, timeScroll].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            smallView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([descriptionLabel.topAnchor.constraint(equalTo: smallView.topAnchor, constant: 1),
                                     descriptionLabel.leadingAnchor.constraint(equalTo: smallView.leadingAnchor, constant: 15),
                                     descriptionLabel.trailingAnchor.constraint(equalTo: smallView.trailingAnchor, constant: -15),
                                     descriptionLabel.widthAnchor.constraint(equalToConstant: 305),
                                     descriptionLabel.heightAnchor.constraint(equalToConstant: 45)])
        
        NSLayoutConstraint.activate([    line.heightAnchor.constraint(equalToConstant: 0.1),
                                         line.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 66),
                                         line.leadingAnchor.constraint(equalTo: smallView.leadingAnchor, constant: 14),
                                         line.trailingAnchor.constraint(equalTo: smallView.trailingAnchor, constant: -14),
                                         line.bottomAnchor.constraint(equalTo: smallView.bottomAnchor, constant: -20)])
        
        NSLayoutConstraint.activate([timeScroll.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
                                     timeScroll.leadingAnchor.constraint(equalTo: smallView.leadingAnchor, constant: 10),
                                     timeScroll.trailingAnchor.constraint(equalTo: smallView.trailingAnchor, constant: -10),
                                     timeScroll.bottomAnchor.constraint(equalTo: smallView.bottomAnchor, constant: -10)])
        
        
    }
    
    
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    let timeScroll : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: 100)// 적절한 높이 값)
        
        return scrollView
    }()
    private var contentView: UIView = {
        let view = UIView()
        return view
    }()
    private var TimeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing  = 0
        return stackView
        
    }()
    private var locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Light", size: 36)
        label.text = "의정부시"
        label.textColor = .white
        
        return label
    }()
    private var temperature: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Light", size: 102 )
        label.text = "21°"
        label.textColor = .white
        return label
    }()
    private var weatherText: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Light", size: 24 )
        label.text = "흐림"
        label.textColor = .white
        return label
    }()
    private var maxmin: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Light", size: 20 )
        label.text = "최고: 29° 최저: 15°"
        label.textColor = .white
        return label
    }()
    private var smallView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 30, y: 350, width: 334, height: 211)
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.03).cgColor
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 0.5
        
        return view
    }()
    private var line: UIView = {
        let line = UIView()
        line.layer.borderWidth = 0.2
        line.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        
        return line
    }()
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 10, width: 305, height: 45)
        label.textColor = .white
        label.font = UIFont(name: "SFProDisplay-Regular", size: 18)
        label.numberOfLines = 0 // 글이 끝날때 까지 자동으로 아래로 내려서 보여줌
        label.lineBreakMode = .byWordWrapping //단어 기준으로 줄바꿈
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.02
        label.attributedText = NSMutableAttributedString(string: "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다.",
                                                         attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return label
    }()
    private var mapImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "map"))
        return imageView
    }()
    
    private var listButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "list"), for: .normal)
        button.addTarget(self, action: #selector(pop), for: .touchUpInside)
        return button
    }()
    
    private var nowImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "now"))
        return imageView
    }()
    
    private var oneImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "one"))
        return imageView
    }()
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
            $0.backgroundColor = .black
        }
 
    
}


    extension WeatherViewController {
        private func setWeatherScroll() {
            let ItemArray = [weatherScroll(time: "Now", imageName: "thunder", temperature: "21°"),
                             weatherScroll(time: "10시", imageName: "rain", temperature: "21°"),
                             weatherScroll(time: "11시", imageName: "thunder", temperature: "19°"),
                             weatherScroll(time: "12시", imageName: "thunder", temperature: "19°"),
                             weatherScroll(time: "1시", imageName: "thunder", temperature: "18°"),
                             weatherScroll(time: "2시", imageName: "rain", temperature: "18°"),
                             weatherScroll(time: "3시", imageName: "morerain", temperature: "17°"),
                             weatherScroll(time: "4시", imageName: "sunRain", temperature: "18°"),
                             weatherScroll(time: "5시", imageName: "rainy", temperature: "11°")]
            for item in ItemArray {
                item.translatesAutoresizingMaskIntoConstraints = false
                TimeStackView.addArrangedSubview(item)
                
               
                NSLayoutConstraint.activate([
                    item.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.15)
                ])
            }
        }
    }
