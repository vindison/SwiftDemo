//
//  UserInfoModel.swift
//  SwiftDemo
//
//  Created by Vindison on 2017/9/1.
//  Copyright © 2017年 Vindison. All rights reserved.
//

import UIKit

class UserInfoModel: NSObject {
    var auth_token : String?
    var admin_agency : Int?
    
    static let instance = UserInfoModel()
    
    class func shareInstance() -> UserInfoModel{
        return instance
    }
}
