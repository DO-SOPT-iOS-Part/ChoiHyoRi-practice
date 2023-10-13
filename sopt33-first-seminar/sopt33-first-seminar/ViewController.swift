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
        // Do any additional setup after loading the view.
    }
    
//    @IBAction func idTextFieldDidEditing(_ sender: Any) {
//        guard let textField = sender as? UITextField else {return}
//        if let idText = textField.text{
//            self.idText=idText
//        }
//    }
    
    @IBAction func idTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        //        if let idText = textField.text{
        //            self.idText=idText
        //        }
    }
    @IBAction func passwordTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let passwordText = textField.text{
            self.passwordText=passwordText
        }
    }
    
    @IBAction func loginButtonTap(_ sender: Any) {
        print("\(idText)\n\(passwordText)")
        pushToResult()
    }
    
    func pushToResult(){
        guard let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
        resultVC.email = idText
        resultVC.password = passwordText
        resultVC.delegate=self
        //        self.navigationController?.pushViewController(resultVC, animated: true)
        self.present(resultVC, animated: true)
        resultVC.loginDataCompletion = { data in
                  print("클로저로 받아온 email : \(data[0]), 클로저로 받아온 password : \(data[1])")
              }
    }
}

extension ViewController: GetDataProtocol {
    func getLoginData(email: String, password: String) {
        print("받아온 email : \(email), 받아온 password : \(password)")
    }
    
    
}
