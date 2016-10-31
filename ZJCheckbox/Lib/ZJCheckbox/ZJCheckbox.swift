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
        self.setTitle(title, for: UIControlState());
        self.isSelected = selected;
        self.applyStyle();
        self.addTarget(self, action: #selector(ZJCheckbox.onTouchUpInside(_:)), for: UIControlEvents.touchUpInside);
    }
    
    func adjustEdgeInsets() {
        let lLeftInset: CGFloat = 8.0;
        
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left;
        self.imageEdgeInsets = UIEdgeInsetsMake(0.0 as CGFloat, lLeftInset, 0.0 as CGFloat, 0.0 as CGFloat);
        self.titleEdgeInsets = UIEdgeInsetsMake(0.0 as CGFloat, (lLeftInset * 2), 0.0 as CGFloat, 0.0 as CGFloat);
    }
    
    func applyStyle() {
        self.setImage(UIImage(named: "zj_checkbox_checked"), for: UIControlState.selected);
        self.setImage(UIImage(named: "zj_checkbox_unchecked"), for: UIControlState());
        self.setTitleColor(UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1), for: UIControlState());
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14);
    }
    
    func onTouchUpInside(_ sender: UIButton) {
        self.isSelected = !self.isSelected;
        checkboxDelegate?.didSelectCheckbox(self.isSelected, identifier: self.tag, title: self.titleLabel!.text!);
    }
}
