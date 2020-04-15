//
//  ViewController.swift
//  NSTextField
//
//  Created by dengyonghao on 2019/12/18.
//  Copyright © 2019 DengYonghao. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    lazy var label: NSTextField = {
        let v = NSTextField(labelWithString: "Label")
        v.frame = NSRect(x: 50, y: 50, width: 100, height: 25)
        v.font = .systemFont(ofSize: 18)
        return v
    }()
    
    lazy var textField: NSTextField = {
        let v = NSTextField()
        v.stringValue = "TextField"
        v.frame = NSRect(x: 50, y: 120, width: 100, height: 25)
        return v
    }()
    
    lazy var secureTextField: NSSecureTextField = {
        let v = NSSecureTextField()
        v.frame = NSRect(x: 50, y: 190, width: 100, height: 25)
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(label)
        view.addSubview(textField)
        view.addSubview(secureTextField)
    }
}
