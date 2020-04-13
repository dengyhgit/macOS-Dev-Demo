//
//  ViewController.swift
//  Reminder
//
//  Created by dengyonghao on 2020/3/29.
//  Copyright © 2020 DengYonghao. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    lazy var confirmButton: NSButton = {
        let button = NSButton(title: "confirm", target: self, action: #selector(confirm))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setButtonType(.momentaryPushIn)
        return button
    }()
        
    lazy var timer: Timer = {
        let timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(20), repeats: true) { _ in
            self.enterFullScreen()
        }
        return timer
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + 20) {
            DispatchQueue.main.async {
                self.timer.fire()
            }
        }
    }

    //MARK: - private
    
    private func setupSubviews() {
        view.addSubview(confirmButton)
        view.addConstraint(_LayoutConstraintMake(confirmButton, .centerY, .equal, view, .centerY))
        view.addConstraint(_LayoutConstraintMake(confirmButton, .centerX, .equal, view, .centerX))
        view.addConstraint(_LayoutConstraintMake(confirmButton, .width, .equal, nil, .width, 100))
        view.addConstraint(_LayoutConstraintMake(confirmButton, .height, .equal, nil, .height, 28))
    }
    
    @objc private func confirm() {
        view.isInFullScreenMode ? exitFullScreen() : enterFullScreen()
    }
    
    func enterFullScreen() {
        guard let screen = NSScreen.main else {
            return
        }
        if !view.isInFullScreenMode {
            view.enterFullScreenMode(screen, withOptions: [NSView.FullScreenModeOptionKey.fullScreenModeAllScreens : true])
        }
    }
    
    private func exitFullScreen() {
        view.exitFullScreenMode(options: [NSView.FullScreenModeOptionKey.fullScreenModeAllScreens : true])
    }

}

@inline(__always)
internal func _LayoutConstraintMake(_ item: AnyObject, _ attr1: NSLayoutConstraint.Attribute, _ related: NSLayoutConstraint.Relation, _ toItem: AnyObject? = nil, _ attr2: NSLayoutConstraint.Attribute = .notAnAttribute, _ constant: CGFloat = 0, priority: NSLayoutConstraint.Priority = NSLayoutConstraint.Priority(1000), multiplier: CGFloat = 1, output: UnsafeMutablePointer<NSLayoutConstraint?>? = nil) -> NSLayoutConstraint {
    let c = NSLayoutConstraint(item:item, attribute:attr1, relatedBy:related, toItem:toItem, attribute:attr2, multiplier:multiplier, constant:constant)
    c.priority = priority
    if output != nil {
        output?.pointee = c
    }
    return c
}
