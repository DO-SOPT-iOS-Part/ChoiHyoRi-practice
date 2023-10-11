//
//  ResultViewController.swift
//  sopt33-first-seminar
//
//  Created by Hyori Choi on 10/7/23.
//


// 네비게이션 컨트롤러 : 후입선출(Stack)
import UIKit

class ResultViewController: UIViewController {
    //delegate선언 => 2번째 뷰컨트롤러에서 데이터를 넘기겠다
    var delegate: GetDataProtocol?
    
    //ResultVC애 데이터를 전달할 클로저 생성
    var loginDataCompletion: (([String]) -> Void)? //스트링 타입의 배열을 매개변수로 전달 할거고, 리턴타입은 void다!
    
    @IBOutlet weak var B: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        bindText()
        mySwitch.setOn(false, animated: true)
    }
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    var email: String = ""
    var passwordText: String = ""
    
    private func bindText(){
        self.emailLabel.text="email : \(email)"
        self.passwordLabel.text = "password : \(passwordText)"
        
    }
    
    @IBAction func backButtonTap(_ sender: Any) {
        if let navigationController = self.navigationController {//네비일땐 pop, 모달일땐 dismiss를 위한 분기처리
            navigationController.popViewController(animated: true)
        }else{
            self.dismiss(animated: true)
        }
        guard let loginDataCompletion else{return}
        loginDataCompletion([self.email, self.passwordText])
        delegate?.getLoginData(email: self.email, password: self.passwordText)
    }
    
    func setLabelText (id: String,
                       password: String){
        self.email=id
        self.passwordText=password
    }
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var mySwitch: UISwitch!
    
    
    
    @IBAction func switchChange(_ sender: Any) {
        if mySwitch.isOn{
            label.text = "켜짐!"
        }
        else{
            label.text = "꺼짐!"
        }
    }
    
}
