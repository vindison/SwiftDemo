//
//  LoginViewController.swift
//  SwiftDemo
//
//  Created by Vindison on 2017/8/31.
//  Copyright © 2017年 Vindison. All rights reserved.
//

import UIKit
import SVProgressHUD

class LoginViewController: BaseViewController {

    @IBOutlet weak var loginBgView: UIView!
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loginBgView.layer.borderWidth = 0.7
        loginBgView.layer.borderColor = UIColor.withHex(hexString: "#dedede").cgColor
        loginBgView.layer.cornerRadius = 5
        loginBgView.layer.masksToBounds = true
        
        loginButton .addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func loginButtonAction(){
        SVProgressHUD.show(withStatus: "正在加载...")
        
        let password = "123456"
        let param = ["admin_account": "13242056961",
                     "admin_pass":  password.MD5()] as [String : Any]

        NetworkRequest .sharedInstance .getRequest(urlString: "api/pos/posLogin.do", papameters: param, success: { (result) in
//            print(result)
//            let userInfoModel = UserInfoModel.yy_model(with: result)
            
            SVProgressHUD.dismiss()
        }) { (Error) in
            print(Error)
        }
    }

}
