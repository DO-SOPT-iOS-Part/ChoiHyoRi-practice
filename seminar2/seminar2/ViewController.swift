//
//  ViewController.swift
//  sopt33-second-seminar
//
//
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setLayout()
        // Do any additional setup after loading the view.
    }
    private var leftStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing  = 0
        return stackView
    }()
    private var rightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing  = 0
        return stackView
    }()
    private var scrollView : UIScrollView = {
        let view = UIScrollView()
        //           view.backgroundColor = .blue
        return view
    }()
    private var contentView : UIView = {
        let view = UIView()
        //           view.backgroundColor = .green
        return view
    }()
    private var blueView : UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    private var greenView : UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    //
    private var yellowView : UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    private var whiteView1 : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private var whiteView2 : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private var whiteView3 : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private var whiteView4 : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private var blackView : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private func setLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)])
        
        NSLayoutConstraint.activate([contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
                                     contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
                                     contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
                                     contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)])
        
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
        
        
        
        [leftStackView, rightStackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([leftStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                                     leftStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                                     leftStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
                                     leftStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2)])
        
        NSLayoutConstraint.activate([rightStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                                     rightStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
                                     rightStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
                                     rightStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2)])
        
        [yellowView, blackView].forEach {
            NSLayoutConstraint.activate([$0.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                                         $0.heightAnchor.constraint(equalToConstant: 600)])
            $0.translatesAutoresizingMaskIntoConstraints = false
            leftStackView.addArrangedSubview($0)
        }
        
        [greenView, blueView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([$0.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                                         $0.heightAnchor.constraint(equalToConstant: 600)])
            rightStackView.addArrangedSubview($0)
        }
        
        
        //    private func setLayout(){
        //        self.view.addSubview(stackView)
        //        self.view.addSubview(stackView2)
        //        stackView.translatesAutoresizingMaskIntoConstraints = false
        //        stackView2.translatesAutoresizingMaskIntoConstraints = false
        //
        //        [yelloView,whiteView1,blackView,whiteView2].forEach{
        //            $0.translatesAutoresizingMaskIntoConstraints = false
        //            stackView.addArrangedSubview($0)
        //        }
        //        [whiteView3,greenView,whiteView4,blueView].forEach{
        //            $0.translatesAutoresizingMaskIntoConstraints = false
        //            stackView2.addArrangedSubview($0)
        //        }
        //
        //        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: self.view.topAnchor),
        //
        //                                     stackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
        //                                     stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
        //                                     stackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2  )])
        //
        //        NSLayoutConstraint.activate([stackView2.topAnchor.constraint(equalTo: self.view.topAnchor),
        //                                     stackView2.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        //                                     stackView2.leadingAnchor.constraint(equalTo: self.stackView.trailingAnchor, constant: 0
        //                                                                        ),
        //                                     stackView2.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2)])
        //
        //
        //    }
        //    private var stackView: UIStackView = {
        //        let stackView = UIStackView()
        //        stackView.axis = .vertical
        //        stackView.distribution = .fillEqually
        //        stackView.spacing  = 0
        //        return stackView
        //    }()
        //    private var stackView2: UIStackView = {
        //        let stackView = UIStackView()
        //        stackView.axis = .vertical
        //        stackView.distribution = .fillEqually
        //        stackView.spacing  = 0
        //        return stackView
        //    }()
        //    private func setLayout() {
        //        [view1,view2,view3,view4,view5,view6,view7,view8].forEach{ [weak self] view in
        //            guard let self else { return }
        //            // 충돌 방지를 위한 거임
        //            view.translatesAutoresizingMaskIntoConstraints = false //기존 뷰를 버리고 새로운뷰 적용
        //            self.view.addSubview(view) //한 번에 쓰기
        //        }
        //
        //        NSLayoutConstraint.activate([view1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0), view1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0), view1.widthAnchor.constraint(equalToConstant: self.view.frame.width/2),
        //                                     view1.heightAnchor.constraint(equalToConstant: self.view.frame.height/4)])
        //
        //        NSLayoutConstraint.activate([view2.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0), view2.leadingAnchor.constraint(equalTo: view1.trailingAnchor, constant: 0), view2.widthAnchor.constraint(equalToConstant: self.view.frame.width/2),
        //                                     view2.heightAnchor.constraint(equalToConstant: self.view.frame.height/4)])
        //
        //        NSLayoutConstraint.activate([view3.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 0), view3.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0), view3.widthAnchor.constraint(equalToConstant: self.view.frame.width/2),
        //                                     view3.heightAnchor.constraint(equalToConstant: self.view.frame.height/4)])
        //
        //
        //
        //        NSLayoutConstraint.activate([view4.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 0), view4.leadingAnchor.constraint(equalTo: view3.trailingAnchor, constant: 0), view4.widthAnchor.constraint(equalToConstant: self.view.frame.width/2),
        //                                     view4.heightAnchor.constraint(equalToConstant: self.view.frame.height/4)])
        //
        //
        //    NSLayoutConstraint.activate([view5.topAnchor.constraint(equalTo: view4.bottomAnchor, constant: 0), view5.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0), view5.widthAnchor.constraint(equalToConstant: self.view.frame.width/2),
        //                                 view5.heightAnchor.constraint(equalToConstant: self.view.frame.height/4)])
        //
        //        NSLayoutConstraint.activate([view8.topAnchor.constraint(equalTo: view5.bottomAnchor, constant: 0), view8.leadingAnchor.constraint(equalTo: view4.leadingAnchor, constant: 0), view8.widthAnchor.constraint(equalToConstant: self.view.frame.width/2),
        //                                     view8.heightAnchor.constraint(equalToConstant: self.view.frame.height/4)])
        //
        //    }
        //
        //    var view1: UIView = {
        //        let view = UIView()
        //        view.backgroundColor = .yellow
        //        view.clipsToBounds = true
        //        return view
        //    }()
        //
        //    var view2: UIView = {
        //        let view = UIView()
        //        view.backgroundColor = .white
        //        view.clipsToBounds = true
        //        return view
        //    }()
        //
        //    var view3: UIView = {
        //        let view = UIView()
        //        view.backgroundColor = .white
        //        return view
        //    }()
        //    var view4: UIView = {
        //        let view = UIView()
        //        view.backgroundColor = .green
        //        return view
        //    }()
        //    var view5: UIView = {
        //        let view = UIView()
        //        view.backgroundColor = .black
        //        return view
        //    }()
        //    var view6: UIView = {
        //        let view = UIView()
        //        view.backgroundColor = .white
        //        return view
        //    }()
        //    var view7: UIView = {
        //        let view = UIView()
        //        view.backgroundColor = .white
        //        return view
        //    }()
        //    var view8: UIView = {
        //        let view = UIView()
        //        view.backgroundColor = .blue
        //        return view
        //    }()
        //
        //
        //
    }
    
}
