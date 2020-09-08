//
//  CategoryScrollView.swift
//  DynamicScrollPage
//
//  Created by mac on 2020/9/7.
//  Copyright © 2020 meryin. All rights reserved.
//

import UIKit
let kCateGoryViewHeight:CGFloat  =   44
let kBottomTagViewHeight:CGFloat  =  2
@objc protocol CateGoryScrollViewDelegate :NSObjectProtocol {
     @objc optional func didSelectCategory(index:Int)
   
}

class CategoryScrollView: UIScrollView, UIScrollViewDelegate {
  
    
    var containerWidth:CGFloat = 0
    var selectLabel: UILabel?

     weak var categoryDelegate:CateGoryScrollViewDelegate?
   

    var cateNormalColor: UIColor = UIColor.titleColor()
    var cateSelectedColor: UIColor = UIColor.yellowLine()
    var cateTagColor: UIColor = UIColor.yellowLine()
   
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateViews(){
       
        for view in containerView.subviews {
           if let v = view as? UILabel {
               v.textColor = cateNormalColor
           }
        }
        selectLabel?.textColor = self.cateSelectedColor
        if selectLabel != nil {
            UIView.animate(withDuration: 0.2) {
                self.bottomtTag.x = self.selectLabel!.x
                self.bottomtTag.width = self.selectLabel!.width-30
            }
            
        }
    }

    lazy  var bottomtTag :UIView = {
        return UIView()
    }()
    lazy  var containerView :UIView = {
        return UIView()
    }()
   

    func labelIndex(_ index:Int) -> UILabel? {
        return containerView.viewWithTag(index) as? UILabel
       
    }

    func setCateTagColor(_ cateTagColor:UIColor ) {
        self.cateTagColor = cateTagColor
        bottomtTag.backgroundColor = cateTagColor
    }
    init(frame: CGRect,categorys:[String],select:Int,colors:[UIColor]) {
        super.init(frame: frame)
        self.contentSize = self.bounds.size
        self.backgroundColor = UIColor.white
               
       self.showsHorizontalScrollIndicator = false
       self.showsVerticalScrollIndicator = false
       self.delegate = self
        
        if colors.count == 3 {
            cateTagColor = colors[0]
            cateNormalColor = colors[1]
            cateSelectedColor = colors[2]
        }
        containerView.frame = self.bounds
        containerView.tag = 99
        containerView.backgroundColor = UIColor.clear
        self.addSubview(containerView)
        let line = UIView(frame: CGRect(x: 0, y: kCateGoryViewHeight-0.5, width: self.frame.size.width, height: 0.5))
        line.tag = 100
        line.backgroundColor = UIColor.lineColor()
        containerView.addSubview(line)
        bottomtTag.frame = CGRect(x: 0, y: containerView.frame.size.height - kBottomTagViewHeight, width: 60, height: kBottomTagViewHeight)
        bottomtTag.backgroundColor = cateSelectedColor
        bottomtTag.tag = 101
        containerView.addSubview(bottomtTag)
        var leftLabel:UILabel?
        containerWidth  = 0
        if categorys.count > 0 {
            for  i:Int in 0..<categorys.count {
               
                let cateLabel = UILabel()
                cateLabel.text = categorys[i]
                cateLabel.isUserInteractionEnabled = true
                cateLabel.tag = i
                cateLabel.font = UIFont.systemFont(ofSize: 13)
                cateLabel.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(self.tapAction(_:))))
                
               
                let width:CGFloat = categorys[i].getStringSize( rectSize: CGSize(width: kScreenWidth, height: 20), fontSize: cateLabel.font).width
                 
                containerWidth = containerWidth + (width + 30)
                let rect = CGRect(x: leftLabel != nil ? leftLabel!.maxX:0, y: 0, width: width+30, height: self.frame.size.height)
                cateLabel.frame = rect
                containerView.addSubview(cateLabel)
                if i == select {
                    selectLabel = cateLabel
                    cateLabel.textColor = cateSelectedColor
                    var rect = bottomtTag.frame
                    rect.size.width = width
                    rect.origin.x = cateLabel.x
                        bottomtTag.frame = rect
                    } else {
                        cateLabel.textColor = cateNormalColor
                    }
                    
                    leftLabel = cateLabel
                }
            }
            
          var rect = containerView.frame
            var lRect = line.frame
            if (containerWidth < self.frame.size.width) {
                let leftSpace = (self.frame.size.width - containerWidth) / 2.0;
                rect.size.width = kScreenWidth;
                rect.origin.x = leftSpace;
                lRect.origin.x = -(self.frame.size.width-containerWidth)/2
            } else {
                rect.size.width = containerWidth
                lRect.size.width = containerWidth
            }
            containerView.frame = rect
            line.frame = lRect
            self.contentSize = rect.size
            updateContentOffset()
    }
  @objc open func tapAction(_ gestureRecognizer: UITapGestureRecognizer)
    {
        if let cateLabel = gestureRecognizer.view as? UILabel {
             setSelect(cateLabel:cateLabel)
        }
    }

    @objc func updateContentOffset() {
        if selectLabel == nil {
            return
        }
        let cateLabel = selectLabel!
        
        let point = cateLabel.center
        
        var offsetX:CGFloat  = 0
        if (containerView.frame.size.width > kScreenWidth && point.x > kScreenWidth / 2.0) {
            if (point.x < (containerWidth - kScreenWidth / 2.0)) {
                offsetX = point.x - kScreenWidth/2.0
            } else {
                offsetX = containerWidth - kScreenWidth
            }
        } else {
            offsetX = 0
        }
        
        
        let offsetY = self.contentOffset.y
        let  offset = CGPoint(x: offsetX, y: offsetY)
        self.setContentOffset(offset, animated: true)

    }

func setSelect(cateLabel:UILabel) {
    if (cateLabel == self.selectLabel) {
        return
    }

        if self.categoryDelegate != nil && categoryDelegate!.didSelectCategory != nil{
            categoryDelegate?.didSelectCategory?(index: cateLabel.tag)
          
       }

    }

    
}
