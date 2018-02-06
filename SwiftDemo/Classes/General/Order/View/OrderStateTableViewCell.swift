//
//  OrderStateTableViewCell.swift
//  SwiftDemo
//
//  Created by Vindison on 2018/1/24.
//  Copyright © 2018年 Vindison. All rights reserved.
//

import UIKit
import Kingfisher

class OrderStateTableViewCell: UITableViewCell {

    @IBOutlet weak var orderNumberLabel: UILabel!
    @IBOutlet weak var orderStateLabel: UILabel!
    @IBOutlet weak var couponLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    @IBOutlet weak var commodityImageView: UIImageView!
    @IBOutlet weak var commodityName: UILabel!
    @IBOutlet weak var commodityPriceLabel: UILabel!
    @IBOutlet weak var commodityNumLabel: UILabel!
    
    var orderModel : OrderModel? {
        didSet {
            orderNumberLabel.text = "订单编号：\(orderModel?.order_id ?? "123456789")"
        }
    }
    
    var commodityModel : OrderCommodityModel? {
        didSet{
            let commodityIcon = "http://7tsxz7.com1.z0.glb.clouddn.com/" + (commodityModel?.commodityICon .components(separatedBy: ",")[0])!
            guard let commodityIconUrl = URL(string: commodityIcon) else { return }
            commodityImageView.kf.setImage(with:commodityIconUrl)
            commodityName.text = commodityModel?.commodityName
            commodityPriceLabel.text = String(format:"￥%.2f",Float((commodityModel?.price)!) / 100)
            commodityNumLabel.text = String(format:"x%d",(commodityModel?.goodsCount)!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.rightButton.layer.borderWidth = 0.7;
        self.rightButton.layer.borderColor =  UIColor .withHex(hexString: "#2b84e2").cgColor
        self.rightButton.layer.cornerRadius = 2.0;
        
        self.leftButton.layer.borderWidth = 0.7;
        self.leftButton.layer.borderColor = UIColor .withHex(hexString: "#dddddd").cgColor
        self.leftButton.layer.cornerRadius = 2.0;
    }
}
