//
//  UIColor+Yep.swift
//  Yep
//
//  Created by NIX on 15/3/16.
//  Copyright (c) 2015年 Catch Inc. All rights reserved.
//

import UIKit

extension UIColor {
    class func initRGB(r:CGFloat,g:CGFloat,b:CGFloat)->UIColor{
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
    class func initRGBA(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ a:CGFloat)->UIColor{
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    class func hexInt(_ hexValue: Int) -> UIColor {
        return UIColor(red: ((CGFloat)((hexValue & 0xFF0000) >> 16)) / 255.0,
                       green: ((CGFloat)((hexValue & 0xFF00) >> 8)) / 255.0,
                       blue: ((CGFloat)(hexValue & 0xFF)) / 255.0,
                       alpha: 1.0)
    }
    class func titleColor() -> UIColor {
        return UIColor.initRGB(r: 39, g: 42, b: 52)
    }
    class func grayColor() -> UIColor {
        return UIColor.initRGB(r: 142, g:144, b: 149)
    }
    class func grayLightColor() ->UIColor{
        return UIColor.hexInt(0x8B8D92)
    }
    class func contentColor() -> UIColor {
        return UIColor.hexInt(0x666666)
    }
  
    class func yellowColor() -> UIColor {
        return UIColor.initRGB(r: 255, g: 138, b: 57)
    }
    class func yellowLightColor() -> UIColor {
        return UIColor.initRGB(r: 254, g: 222, b: 185)
    }
    class func buttonUnableColor() -> UIColor {
        return UIColor.initRGB(r: 145, g: 147, b: 152)
    }
    class func lineColor() -> UIColor {
        return UIColor(red: 226/255.0, green: 226/255.0, blue: 226/255.0, alpha: 1.0)
    }
    class func yellowLine()->UIColor{
        return UIColor.hexInt(0xFBA73C)
    }
    
    class func blueColor() -> UIColor {
        return UIColor.hexInt(0x397EE3)
    }
    class func buttonYellowColor() -> UIColor {
        return UIColor.initRGB(r: 255, g: 232, b: 206)
    }

    class func yepViewBackgroundColor() -> UIColor {
        return UIColor.hexInt(0xF1F1F1)
    }
    class func viewBackgroundColor() -> UIColor {
        return UIColor.hexInt(0xF1F1F1)
    }
    class func cellBackgroundColor() -> UIColor {
        return UIColor.white
    }
    class func navigationLeftColor() -> UIColor {
        return UIColor.hexInt(0x272A34)
    }
//
    class func tipsRedColor() -> UIColor {
        return UIColor.hexInt(0xB63237)
    }
    class func greenColor() -> UIColor {
        return UIColor.hexInt(0x56A74C)
    }

   

    class func loginBuColor() -> UIColor {
        return UIColor(red: 100/255.0, green: 100/255.0, blue: 101/255.0, alpha: 0.2)
    }

    class func placeholderColor() -> UIColor {
        return UIColor.hexInt(0x8B8D92)
    }
//
    class func redColor() -> UIColor {
        return UIColor.hexInt(0xB63237)
    }

    
    class func yepGrayColor() -> UIColor {
        return UIColor.initRGB(r: 170, g: 170, b: 170)
    }
    
}

extension UIColor {

    class func yep_mangmorGrayColor() -> UIColor {
        return UIColor(red: 199/255.0, green: 199/255.0, blue: 204/255.0, alpha: 1)
    }
}

extension UIColor {

    // 反色
    var yep_inverseColor: UIColor {

        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return UIColor(red: 1 - red, green: 1 - green, blue: 1 - blue, alpha: alpha)
    }

    // 黑白色
    var yep_binaryColor: UIColor {

        var white: CGFloat = 0
        getWhite(&white, alpha: nil)

        return white > 0.92 ? UIColor.black : UIColor.white
    }

    var yep_profilePrettyColor: UIColor {
        //return yep_inverseColor
        return yep_binaryColor
    }
}

