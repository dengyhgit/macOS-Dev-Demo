//
//  ViewController.swift
//  NSButton
//
//  Created by dengyonghao on 2019/12/25.
//  Copyright © 2019 DengYonghao. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    lazy var pushInbutton: NSButton = {
        let button = NSButton(title: "button", target: self, action: #selector(click))
        button.setButtonType(.momentaryPushIn)
        button.frame = NSRect(x: 50, y: 70, width: 70, height: 25)
        button.keyEquivalent = "\r"
        return button
    }()
    
    lazy var changeButton: NSButton = {
        let button = NSButton()
        button.setButtonType(.momentaryChange)
        button.title = "button"
        button.alternateTitle = "Change"
        button.bezelStyle = .regularSquare
        button.frame = NSRect(x: 130, y: 70, width: 70, height: 25)
        return button
    }()
    
    lazy var onOrOffButton: NSButton = {
        let button = NSButton()
        button.action = #selector(click)
        button.setButtonType(.pushOnPushOff)
        button.title = "button"
        button.frame = NSRect(x: 210, y: 70, width: 70, height: 25)
        button.bezelStyle = .rounded
        return button
    }()
    
    lazy var toggleButton: NSButton = {
        let button = NSButton()
        button.action = #selector(click)
        button.setButtonType(.toggle)
        button.title = "start"
        button.alternateTitle = "stop"
        button.frame = NSRect(x: 290, y: 70, width: 70, height: 25)
        button.bezelStyle = .regularSquare
        return button
    }()

    
    lazy var radioBtnView: NSView = {
        let v = NSView(frame: NSRect(x: 70, y: 90, width: 80, height: 200))
        let b1 = NSButton(title: "红色", target: self, action: #selector(click))
        b1.setButtonType(.radio)
        b1.frame = NSRect(x: 5, y: 100, width: 70, height: 25)
        v.addSubview(b1)
        
        let b2 = NSButton(title: "绿色", target: self, action: #selector(click))
        b2.setButtonType(.radio)
        b2.frame = NSRect(x: 5, y: 130, width: 70, height: 25)
        v.addSubview(b2)
        let b3 = NSButton(title: "蓝色", target: self, action: #selector(click))
        b3.setButtonType(.radio)
        b3.frame = NSRect(x: 5, y: 160, width: 70, height: 25)
        v.addSubview(b3)
        return v
    }()
    
    lazy var switchBtnView: NSView = {
        let v = NSView(frame: NSRect(x: 270, y: 90, width: 80, height: 200))
        let b1 = NSButton(title: "红色", target: self, action: #selector(click))
        b1.setButtonType(.switch)
        b1.frame = NSRect(x: 5, y: 100, width: 70, height: 25)
        v.addSubview(b1)
        b1.bezelStyle
        let b2 = NSButton(title: "绿色", target: self, action: #selector(click))
        b2.setButtonType(.switch)
        b2.frame = NSRect(x: 5, y: 130, width: 70, height: 25)
        v.addSubview(b2)
        
        let b3 = NSButton(title: "蓝色", target: self, action: #selector(click))
        b3.setButtonType(.switch)
        b3.frame = NSRect(x: 5, y: 160, width: 70, height: 25)
        v.addSubview(b3)
        return v
    }()
    
    
//    typedef NS_ENUM(NSUInteger, NSButtonType) {
//        NSButtonTypeMomentaryLight    = 0,
//        NSButtonTypePushOnPushOff     = 1,
//        NSButtonTypeToggle            = 2,
//        NSButtonTypeSwitch            = 3,
//        NSButtonTypeRadio             = 4,
//        NSButtonTypeMomentaryChange   = 5,
//        NSButtonTypeOnOff             = 6,
//        NSButtonTypeMomentaryPushIn   = 7,
//        NSButtonTypeAccelerator API_AVAILABLE(macos(10.10.3)) = 8,
//        NSButtonTypeMultiLevelAccelerator API_AVAILABLE(macos(10.10.3)) = 9,
//    };

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSubviews()
    }

    private func setupSubviews() {
        
        view.addSubview(pushInbutton)
        view.addSubview(changeButton)
        view.addSubview(onOrOffButton)
        view.addSubview(toggleButton)
        view.addSubview(radioBtnView)
        view.addSubview(switchBtnView)
        
    }
    
    @objc private func click(_ sender: NSButton) {
        print("click button")
    }
    
}

