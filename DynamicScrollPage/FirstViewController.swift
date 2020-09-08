//
//  FirstViewController.swift
//  DynamicScrollPage
//
//  Created by mac on 2020/9/8.
//  Copyright © 2020 meryin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
var name = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel(frame: self.view.bounds)
        label.text = name
        self.view.addSubview(label)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
