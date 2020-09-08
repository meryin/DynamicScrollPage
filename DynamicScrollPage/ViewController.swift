//
//  ViewController.swift
//  DynamicScrollPage
//
//  Created by mac on 2020/9/7.
//  Copyright © 2020 meryin. All rights reserved.
//

import UIKit

class ViewController: ScrollPageController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
       
    }
    override func prepares(){
        super.prepares()
        self.reuseSource = true
        self.categoryTexts = ["新闻","消息中心","个人","更多","生活","天气","阿沙发沙发沙发撒粉撒","阿凡达说法","萨达"]
        var arr:[UIViewController] = []
        for str in categoryTexts {
            let vc1 = FirstViewController()
            vc1.name = str
            arr.append(vc1)
        }
       self.viewControllers = arr
      
    
       self.selectCategory = "消息中心"
    }
    override func didSelectControllers(controller: UIViewController, atIndex: Int) {
         print("didSelect",controller,atIndex)
    }
    
     

}

