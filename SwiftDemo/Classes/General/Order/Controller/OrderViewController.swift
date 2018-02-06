//
//  OrderViewController.swift
//  SwiftDemo
//
//  Created by Vindison on 2017/8/30.
//  Copyright © 2017年 Vindison. All rights reserved.
//

import UIKit

private let kTitleViewH :CGFloat = 44

class OrderViewController: BaseViewController {
    
    let titles = ["全部","待发货","已发货","已完成","已取消"]

    fileprivate lazy var pageTitleView : PageTitleView = {[weak self] in
        let titleFrame = CGRect(x: 0, y: kStatusBarH+kNavBarH, width: kScreenW, height: kTitleViewH)
        let titleView = PageTitleView(frame: titleFrame, titles: (self?.titles)!)
        titleView.delegate = self
        return titleView
    }()
    
    fileprivate lazy var pageContentView : PageContentView = { [weak self] in
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavBarH + kTitleViewH, width: kScreenW, height: kScreenH - kStatusBarH - kNavBarH - kTitleViewH - kTabBarH)
        var childVcs = [UIViewController]()
    
        for _ in 0..<(self?.titles.count)! {
            let vc = OrderStateViewController()
            childVcs.append(vc)
        }
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentVc: self)
        //MARK:- 控制器作为PageContentViewDelegate代理
        contentView.delegate = self
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        if #available(iOS 11.0, *){
//            self.pageTitleView.contentInsetAdjustmentBehavior = .never;
//        }else {
            self.automaticallyAdjustsScrollViewInsets = false;
//        }

        
        view.addSubview(pageTitleView)
        view .addSubview(pageContentView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK:- PageTitleViewDelegate代理实现
extension OrderViewController : PageTitleViewDelegate{
    func pageTitleView(_ titleView: PageTitleView, selectedIndex index: Int) {
        pageContentView.setCurrentIndex(currentIndex: index)
    }
}

//MARK:- PageContentViewDelegate代理实现
extension OrderViewController : PageContentViewDelegate{
    func pageContentView(_ contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTitleWithProgress(progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}
