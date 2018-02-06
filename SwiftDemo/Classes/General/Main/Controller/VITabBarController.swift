//
//  VITabBarController.swift
//  SwiftDemo
//
//  Created by Vindison on 2017/6/30.
//  Copyright © 2017年 Vindison. All rights reserved.
//

import UIKit

class VITabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tabBar = UITabBar.appearance()
        tabBar.tintColor = UIColor .withHex(hexString: "#2b84e2")
        addChildViewControllers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /**
     * 添加子控制器
     */
    private func addChildViewControllers() {
        addChildViewController(childController: HomeViewController(), title: "首页", imageName: "tab_home")
        addChildViewController(childController: PurchaseViewController(), title: "采购", imageName: "tab_cart")
        addChildViewController(childController: OrderViewController(), title: "订单", imageName: "tab_order")
        addChildViewController(childController: StoreViewController(), title: "店铺", imageName: "tab_store")
    }
    
    /**
     # 初始化子控制器
     - parameter childControllerName: 需要初始化的控制器
     - parameter title:               标题
     - parameter imageName:           图片名称
     */
    private func addChildViewController(childController: UIViewController, title: String, imageName: String) {
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_pre")
        childController.title = title
        let navC = VINavigationController(rootViewController: childController)
        addChildViewController(navC)
    }

}
