//
//  OrderCommodityModel.swift
//  SwiftDemo
//
//  Created by Vindison on 2018/1/25.
//  Copyright © 2018年 Vindison. All rights reserved.
//

import UIKit

class OrderCommodityModel: NSObject {
    var commodityName : String = ""
    var commodityICon : String = ""
    var goodsCount : Int = 0
    var price : Int = 0
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
