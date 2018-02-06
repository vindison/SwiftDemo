//
//  OrderStateViewController.swift
//  SwiftDemo
//
//  Created by Vindison on 2018/1/24.
//  Copyright © 2018年 Vindison. All rights reserved.
//

import UIKit

fileprivate let orderStateCellId = "orderStateCellId"

class OrderStateViewController: BaseViewController {
    fileprivate lazy var orderViewModel : OrderViewModel = OrderViewModel()
    
    fileprivate lazy var tableView: UITableView = {[unowned self] in
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH - kStatusBarH - kNavBarH - 44 - kTabBarH), style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        self.view .addSubview(tableView)
        
        tableView.register(UINib(nibName: "OrderStateTableViewCell", bundle: nil), forCellReuseIdentifier: orderStateCellId)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        loadData()
    }
}

extension OrderStateViewController{
    func loadData(){
        orderViewModel .requestOrderData {
            
            self.tableView .reloadData()
        }
    }
}

extension OrderStateViewController : UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return orderViewModel.orderModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: orderStateCellId) as? OrderStateTableViewCell
        cell?.orderModel = orderViewModel.orderModels[indexPath.section]
        cell?.commodityModel = orderViewModel.orderModels[indexPath.section].commodityModels[0]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 229
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

