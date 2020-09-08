//
//  Ext+UILable.swift
//  DynamicScrollPage
//
//  Created by mac on 2020/9/7.
//  Copyright © 2020 meryin. All rights reserved.
//

import UIKit

extension UILabel {
    func setSelect(_ selected:Bool){
        if selected{
            self.textColor = UIColor.yellowLine()
        }else{
            self.textColor = UIColor.titleColor()
        }
    }
}
