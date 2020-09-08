//
//  Const.swift
//  CheLingWangBuyer
//
//  Created by mac on 2018/7/13.
//  Copyright © 2018年 meryin. All rights reserved.
//

import UIKit

let KiosVersion:Float =  Float(UIDevice.current.systemVersion)!
let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height

var kStatusBarHeight : CGFloat{
    if #available(iOS 13.0, *) {
        let statusBarManager = UIApplication.shared.windows.first?.windowScene?.statusBarManager
        return  (statusBarManager?.statusBarFrame.size.height ?? 20)
        
    }
    else {
       return UIApplication.shared.statusBarFrame.size.height
        
    }
}




let kNavigationBarHeight : CGFloat = 44+kStatusBarHeight

func _keyWindow() -> UIWindow? {
    if #available(iOS 13.0, *) {
        return UIApplication.shared.windows[0]
    } else {
        return UIApplication.shared.keyWindow
    }
}


//封装的日志输出功能（T表示不指定日志信息参数类型）
func MLog<T>(_ message:T, file:String = #file, function:String = #function,
              line:Int = #line) {
    #if !RELEASE
    //获取文件名
    let fileName = (file as NSString).lastPathComponent
    //打印日志内容
    print("\(fileName):\(line) \(function) \n")
    print(message)
    #endif
}
