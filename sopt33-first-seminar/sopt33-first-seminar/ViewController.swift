//
//  ViewController.swift
//  sopt33-first-seminar
//
//  Created by Hyori Choi on 10/7/23.
//

import UIKit

class ViewController: UIViewController {
    
    private var idText: String = ""
    private var passwordText: String = ""
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func idTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let idText = textField.text{
            self.idText=idText
        }
    }
    @IBAction func passwordTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let passwordText = textField.text{
            self.passwordText=passwordText
        }
    }
    
    
    
    
    @IBAction func loginButtonTap(_ sender: Any) {
        print("\(idText)\n\(passwordText)")
//        pushToResultVC() //네비게이션
        presentToResultVC() //모달 방식
        
    }
    // \()로 문자열을 출력할 수 있음 : 문자열 보간법
    
    
    func pushToResultVC(){
        guard let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
//        resultVC.email = idText
//        resultVC.passwordText = passwordText
        resultVC.delegate=self
        resultVC.setLabelText(id: idText, password: passwordText)
        self.navigationController?.pushViewController(resultVC, animated: true)
//        self.present(resultVC, animated: true)
        resultVC.loginDataCompletion = { data in
            print("클로저로 받아온 email : \(data[0]), 클로저로 받아온 password : \(data[1])")
        }
        guard let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
                self.navigationController?.pushViewController(resultVC, animated: true)
    }
    
    func presentToResultVC(){ //아래에서 위로 올라오는 모달
        //프로퍼티 사용
        guard let resultVC =   self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else{return}
//        resultVC.email=idText
//        resultVC.passwordText=passwordText
        resultVC.setLabelText(id: idText, password: passwordText) //함수를 이용한 데이터 전달
        self.present(resultVC, animated: true)
    }
}
    //함수 구현부
    extension ViewController: GetDataProtocol {
        func getLoginData(email: String, password: String) {
            print("받아온 email : \(email), 받아온 password : \(password)")
        }
        
        
    }
