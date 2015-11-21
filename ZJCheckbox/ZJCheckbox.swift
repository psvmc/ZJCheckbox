//
//  ZJCheckbox.swift
//
//  Created by PSVMC on 11/18/15
//  Copyright (c) 2015 PSVMC. All rights reserved.
//

import UIKit

class ZJCheckbox : UIButton {
    var checkboxDelegate: ZJCheckboxDelegate?;
    required init?(coder: NSCoder) {
        super.init(coder: coder);
    }
    
    init(frame: CGRect, title: String, selected: Bool) {
        super.init(frame: frame);
        
        self.adjustEdgeInsets();
        self.setTitle(title, forState: UIControlState.Normal);
        self.selected = selected;
        self.applyStyle();
        self.addTarget(self, action: "onTouchUpInside:", forControlEvents: UIControlEvents.TouchUpInside);
    }
    
    func adjustEdgeInsets() {
        let lLeftInset: CGFloat = 8.0;
        
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left;
        self.imageEdgeInsets = UIEdgeInsetsMake(0.0 as CGFloat, lLeftInset, 0.0 as CGFloat, 0.0 as CGFloat);
        self.titleEdgeInsets = UIEdgeInsetsMake(0.0 as CGFloat, (lLeftInset * 2), 0.0 as CGFloat, 0.0 as CGFloat);
    }
    
    func applyStyle() {
        self.setImage(UIImage(named: "zj_checkbox_checked"), forState: UIControlState.Selected);
        self.setImage(UIImage(named: "zj_checkbox_unchecked"), forState: UIControlState.Normal);
        self.setTitleColor(UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1), forState: UIControlState.Normal);
        self.titleLabel?.font = UIFont.systemFontOfSize(14);
    }
    
    func onTouchUpInside(sender: UIButton) {
        self.selected = !self.selected;
        checkboxDelegate?.didSelectCheckbox(self.selected, identifier: self.tag, title: self.titleLabel!.text!);
    }
}