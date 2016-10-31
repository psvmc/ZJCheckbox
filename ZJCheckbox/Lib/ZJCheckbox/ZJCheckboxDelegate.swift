//
//  ZJCheckboxDelegate.swift
//
//  Created by PSVMC on 11/18/15.
//  Copyright (c) 2015 PSVMC. All rights reserved.
//

import Foundation

protocol ZJCheckboxDelegate {
    func didSelectCheckbox(_ state: Bool, identifier: Int, title: String);
}
