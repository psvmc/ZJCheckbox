//
//  ViewController.swift
//  ZJCheckbox
//
//  Created by 张剑 on 2016/10/31.
//  Copyright © 2016年 张剑. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ZJCheckboxDelegate {
    var checkbox:ZJCheckbox!;
    override func viewDidLoad() {
        super.viewDidLoad()
        initCheckbox();
    }
    
    func initCheckbox(){
        checkbox = ZJCheckbox(frame: CGRect(x: 100, y: 100, width: 100, height: 40), title: "好好学习", selected: true);
        self.view.addSubview(checkbox);
        checkbox.center = self.view.center;
        checkbox.checkboxDelegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didSelectCheckbox(_ state: Bool, identifier: Int, title: String) {
        print("选中状态:\(state) 文字:\(title)")
    }


}

