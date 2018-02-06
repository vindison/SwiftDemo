//
//  OrderModel.swift
//  SwiftDemo
//
//  Created by Vindison on 2018/1/25.
//  Copyright © 2018年 Vindison. All rights reserved.
//

import UIKit

class OrderModel: NSObject {
    var order_id : String = ""
    var spec : String = ""
    var orderState : Int = 0
    var order_type : Int = 0
    var delivery_price : Int = 0
    var redPacket : Int = 0
    var total_price : Int = 0
    var commodityModels : [OrderCommodityModel] = [OrderCommodityModel]()
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
