//
//  OrderViewModel.swift
//  SwiftDemo
//
//  Created by Vindison on 2018/1/25.
//  Copyright © 2018年 Vindison. All rights reserved.
//

import UIKit

class OrderViewModel: NSObject {
    lazy var orderModels : [OrderModel] = [OrderModel]()
    
    func requestOrderData(_ finishCallback : @escaping () -> ()){
        let param = ["agency_id": 379,
                     "auth_token": "1dce58a0440e4653b82da68805d05890",
                     "order_state": 0,
                     "pageNumber": 1,
                     "pageSize": 8] as [String : Any]
        
        NetworkRequest .sharedInstance .getRequest(urlString: "api/pos/order/queryOrderPosList.action", papameters: param, success: { (result) in
            guard let array = result["list"] as? [[String : Any]] else { return }
            for dict in array {
                let orderModel = OrderModel(dict: dict)
                let jsonData:Data = orderModel.spec.data(using: .utf8)!
                guard let commodityArray = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as! NSArray else { return }
                for commoditydict in commodityArray {
                    let commodityModel = OrderCommodityModel(dict: commoditydict as! [String : Any])
                    orderModel.commodityModels.append(commodityModel)
                }
                self.orderModels.append(orderModel)
            }
            
            finishCallback()
        }) { (Error) in
            print(Error)
        }
    }
}
