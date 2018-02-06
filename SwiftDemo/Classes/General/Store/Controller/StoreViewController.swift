//
//  StoreViewController.swift
//  SwiftDemo
//
//  Created by Vindison on 2017/8/30.
//  Copyright © 2017年 Vindison. All rights reserved.
//

import UIKit

fileprivate let storeInfoCellId = "storeInfoCellId"
fileprivate let storeOrderCellId = "storeOrderCellId"
fileprivate let storeWalletCellId = "storeWalletCellId"
fileprivate let storeCellId = "storeCellId"

class StoreViewController: BaseViewController {
    lazy var tableView: UITableView = {[unowned self] in
        let tableView = UITableView(frame: self.view.frame, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        self.view .addSubview(tableView)
        
        tableView.register(UINib(nibName: "StoreInfoTableViewCell", bundle: nil), forCellReuseIdentifier: storeInfoCellId)
        tableView.register(UINib(nibName: "StoreOrderTableViewCell", bundle: nil), forCellReuseIdentifier: storeOrderCellId)
        tableView.register(UINib(nibName: "StoreWalletTableViewCell", bundle: nil), forCellReuseIdentifier: storeWalletCellId)
        tableView.register(UINib(nibName: "StoreTableViewCell", bundle: nil), forCellReuseIdentifier: storeCellId)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = self.view.frame
    }
}

extension StoreViewController : UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            return 2
        }
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: storeInfoCellId) as? StoreInfoTableViewCell
            
            return cell!
        }else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: storeOrderCellId) as? StoreOrderTableViewCell
            
            return cell!
        }else if indexPath.section == 2 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: storeCellId) as? StoreTableViewCell
                return cell!
            }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: storeWalletCellId) as? StoreWalletTableViewCell
                
                return cell!
            }
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: storeCellId) as? StoreTableViewCell
            
            return cell!
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        }else if indexPath.section == 1 {
            return 80
        }else if indexPath.section == 2 && indexPath.row == 1 {
            return 90
        }
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0.01
        }
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

