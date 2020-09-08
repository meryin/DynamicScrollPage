//
//  Ext+UIView.swift
//  SwiftPractice
//
//  Created by liushaohua on 15/10/31.
//  Copyright © 2015年 liushaohua. All rights reserved.
//

import UIKit


//根据响应链获取最顶层控制器
extension UIView {
    public func viewController<T: UIViewController>() -> T? {
        var viewController: UIViewController?
        var next = self.next
        while let _next = next {
            if _next.isKind(of: UIViewController.self) {
                viewController = next as? UIViewController
                break
            }
            next = _next.next
        }
        return viewController as? T
    }
}

public extension UIView{
    
    var x:CGFloat{
        get{
            return self.frame.origin.x
        } set{
            self.frame.origin.x = newValue
        }
    }
    
    var y:CGFloat{
        get{
            return self.frame.origin.y
        }set{
            self.frame.origin.y = newValue
        }
    }
    
    
    var width:CGFloat{
        get{
            return self.frame.size.width
        }set{
            self.frame.size.width = newValue
        }
    }
    var maxX:CGFloat{
        get{
            return self.frame.size.width + self.frame.origin.x
        }
    }
    var maxY:CGFloat{
        get{
            return self.frame.size.height + self.frame.origin.y
        }
    }
    var height:CGFloat{
        get{
            return self.frame.size.height
        }set{
            self.frame.size.height = newValue
        }
    }
    var size:CGSize{
        get{
            return self.frame.size
        }set{
            self.frame.size = newValue
        }
    }
    
    var centerX:CGFloat{
        get{
            return self.center.x
        }set{
           self.center.x = newValue
        }
    }
    
    var centerY:CGFloat{
        get{
            return self.center.y
        }set{
            self.center.y = newValue
        }
    }
    
    // 关联 SB 和 XIB
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
        }
    }
    @IBInspectable  var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        
        set {
            layer.shadowRadius = newValue
        }
    }
    @IBInspectable  var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        
        set {
            layer.shadowOpacity = newValue
        }
    }
    @IBInspectable  var shadowColor: UIColor? {
        get {
            return layer.shadowColor != nil ? UIColor(cgColor: layer.shadowColor!) : nil
        }
        
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
    @IBInspectable  var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        
        set {
            layer.shadowOffset = newValue
        }
    }
    @IBInspectable  var zPosition: CGFloat {
        get {
            return layer.zPosition
        }
        
        set {
            layer.zPosition = newValue
        }
    }
    
    
    
    
}
