//
//  ScrollPageController.swift
//  DynamicScrollPage
//
//  Created by mac on 2020/9/8.
//  Copyright © 2020 meryin. All rights reserved.
//

import UIKit

class ScrollPageController: UIViewController {

    var catebgColor:UIColor = UIColor.white
    var cateNormalColor:UIColor = UIColor.titleColor()
    var cateSelectedColor:UIColor = UIColor.yellowLine()
    var cateTagColor:UIColor = UIColor.yellowLine()
    var reuseSource = false
    var selectVC:UIViewController?
    
    var categoryView:CategoryScrollView? 
    var selectIndex:Int = 0
    
    var categoryTexts:[String] = []
    var viewControllers:[UIViewController] = []
    var selectCategory:String?

    
    
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
         prepares()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavi()
        reloadViews()
        // Do any additional setup after loading the view.
    }
    @objc func prepares(){
        
    }
    func setUpNavi(){

        self.automaticallyAdjustsScrollViewInsets = false
        self.extendedLayoutIncludesOpaqueBars = true
        self.edgesForExtendedLayout = [.left,.right,.bottom,.top]
        
    }
    func reloadViews() {
        if ((!reuseSource && self.categoryTexts.count > 0 && self.viewControllers.count > 0 )
            || (reuseSource && self.categoryTexts.count > 0))
        {
            addControllers()
            addBigScrollView()
            addFirstController()
            addCategoryScrollView()
        }
    }
    func addControllers() {
        for vc in self.viewControllers {
            self.addChild(vc)
        }
    }
    func addCategoryScrollView(){
        categoryView?.removeFromSuperview()
        if (selectCategory != nil && categoryTexts.contains(selectCategory!)) {
            selectIndex = categoryTexts.firstIndex(of: selectCategory!) ?? 0
        } else {
            selectIndex = 0
           
        }
        categoryView = CategoryScrollView(frame: CGRect(x: 0, y: kStatusBarHeight, width: kScreenWidth, height: kCateGoryViewHeight), categorys: categoryTexts, select: selectIndex, colors: [cateTagColor,cateNormalColor,cateSelectedColor])
        categoryView!.categoryDelegate = self
        categoryView!.backgroundColor = catebgColor
        self.view.addSubview(categoryView!)
       bigscrollView.setContentOffset(CGPoint(x: kScreenWidth*CGFloat(selectIndex), y: bigscrollView.contentOffset.y), animated: true)
       
    }
    func addBigScrollView(){
        let y = (categoryView?.maxY ?? kCateGoryViewHeight)
        bigscrollView.frame = CGRect(x: 0, y: y, width: kScreenWidth, height: kScreenHeight - y )
        bigscrollView.isPagingEnabled = true
      
       bigscrollView.delegate = self
       bigscrollView.showsHorizontalScrollIndicator = false
       bigscrollView.showsVerticalScrollIndicator = false
        bigscrollView.contentSize = CGSize(width: kScreenWidth*CGFloat(categoryTexts.count), height: kScreenHeight-y)
        self.view.addSubview(bigscrollView)
    }
    func addFirstController(){
        for i in 0..<viewControllers.count {
            let vc = viewControllers[i]
             self.addSubController(vc: vc, index: i)
        }
       
       
        bigscrollView.contentOffset = CGPoint(x: kScreenWidth*CGFloat(viewControllers.count-1), y: bigscrollView.contentOffset.y)
        
    }
  
    func addSubController(vc:UIViewController ,index:Int)
    {
        vc.view.removeFromSuperview()
        
        var rect = bigscrollView.bounds
        rect.origin.x = kScreenWidth * CGFloat(index)
        vc.view.frame = rect
        bigscrollView.addSubview(vc.view)
        
    }
    
    
    lazy var bigscrollView:UIScrollView={
        return UIScrollView()
    }()
}
extension ScrollPageController:CateGoryScrollViewDelegate,UIScrollViewDelegate{
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.scrollViewDidEndScrollingAnimation(scrollView)
    }
    func scrollViewDidEndScrollingAnimation(_ scrollView:UIScrollView ) {
        if categoryView == nil {
            return
        }
        let contentOffset = scrollView.contentOffset
        
        let index = Int(ceilf(Float(contentOffset.x / kScreenWidth)))
        print("scrollViewDidEndScrollingAnimation",index)
        if index == selectIndex {
            return
        }
        let vc = self.viewControllers[index]
        selectIndex = index
        selectVC = vc
        categoryView!.selectLabel = categoryView!.labelIndex(index)
         categoryView!.updateViews()
        categoryView!.updateContentOffset()
       
    }
    func didSelectCategory(index: Int) {
        print("didSelectCategory")
        if (index == selectIndex || index < 0 || index >= viewControllers.count) {
            return
        }
           bigscrollView.setContentOffset(CGPoint(x: kScreenWidth*CGFloat(index), y: bigscrollView.contentOffset.y), animated: true)
            let vc = self.viewControllers[index]
            
            self.didSelectControllers(controller: vc, atIndex: index)
        
    }
    @objc func didSelectControllers(controller:UIViewController ,atIndex:Int) {
        //
    }
}
