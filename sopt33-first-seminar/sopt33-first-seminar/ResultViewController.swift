//
//  ResultViewController.swift
//  sopt33-first-seminar
//
//  Created by Hyori Choi on 10/7/23.
//

import UIKit

class ResultViewController: UIViewController {
    var delegate: GetDataProtocol?

    //ResultVC
    var loginDataCompletion: (([String]) -> Void)? //스트링 타입의 배열을 매개변수로 전달 할거고, 리턴타입은 void다!
                              
                              
    override func viewDidLoad() {
        super.viewDidLoad()
        bindText()
    }
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!

    var email: String = ""
    var password: String = ""
    
    private func bindText(){
        self.emailLabel.text="email : \(email)"
        self.passwordLabel.text = "password : \(password)"

    }
    
    @IBAction func backButtonTap(_ sender: Any) {
        self.dismiss(animated: true)
        delegate?.getLoginData(email: self.email, password: self.password)
        guard let loginDataCompletion else {return}
        loginDataCompletion([self.email, self.password])
    }
    
    
    
    
}
