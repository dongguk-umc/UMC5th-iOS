//
//  UMC3weekDetailViewController.swift
//  UMC5th_iOS
//
//  Created by seonwoo on 2023/10/09.
//

import Foundation
import UIKit
import RealmSwift

class UMC4weekViewController : UIViewController {
    
    @IBOutlet weak var idText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginText: UILabel!
    
    var isLogin : Bool = false
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        if let object = defaults.object(forKey: "isAutoLogin") {
            isLogin = object as! Bool
        } else {
            isLogin = false
        }
        
        if(!isLogin){
            loginText.text = "로그인 해주세요"
        }else{
            loginText.text = "자동 로그인!"
        }
    
    }

    @IBAction func onTapLogin(_ sender: Any) {
        let savedUser = realm.objects(User.self)
        if(savedUser.first?.id == idText.text){
            if(savedUser.first?.id == idText.text){
                isLogin = true
                loginText.text = "로그인 완료"
                
                let defaults = UserDefaults.standard
                defaults.set(true, forKey: "isAutoLogin")
            }
        }else{
            loginText.text = "로그인 정보 틀림"
            idText.text = ""
            passwordText.text = ""
        }
    }
    
    @IBAction func onTapRegister(_ sender: Any) {
        var user = User()
        user.id = idText.text!
        user.password = passwordText.text!
        
        try! realm.write{
            realm.add(user)
        }
        
        loginText.text = "회원가입 완료. 로그인 해보세요"
        idText.text = ""
        passwordText.text = ""
    }
}
