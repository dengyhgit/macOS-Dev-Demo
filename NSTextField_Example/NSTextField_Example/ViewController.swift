//
//  ViewController.swift
//  NSTextField_Example
//
//  Created by dengyonghao on 2019/12/19.
//  Copyright © 2019 DengYonghao. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
        
    lazy var textField: NSTextField = {
        let v = NSTextField()
        v.stringValue = "TextField"
        v.frame = NSRect(x: 50, y: 120, width: 100, height: 38)
        v.delegate = self
        return v
    }()

    lazy var centerTextField: NSTextField = {
        let v = NSTextField()
        v.frame = NSRect(x: 50, y: 190, width: 100, height: 38)
        let cell = CustomTextFieldCell(textCell: "CustomTextFieldCell")
        cell.isEditable = true
        v.cell = cell
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textField)
        view.addSubview(centerTextField)
    }

}

extension ViewController: NSTextFieldDelegate
{
    /// 开始编辑
    func controlTextDidBeginEditing(_ obj: Notification) {
        print("controlTextDidBeginEditing")
    }
    
    /// 结束编辑
    func controlTextDidEndEditing(_ obj: Notification) {
        print("controlTextDidEndEditing")
    }
    
    /// 内容改变
    func controlTextDidChange(_ obj: Notification) {
        let textField = obj.object as? NSTextField
//        let textView = obj.userInfo?[AnyHashable("NSFieldEditor")] as? NSTextView
        print("controlTextDidChange,text:" + (textField?.stringValue ?? ""))
    }
}

extension NSTextField {
        
    override open func performKeyEquivalent(with event: NSEvent) -> Bool {
        let modifierkeys = event.modifierFlags.intersection(.deviceIndependentFlagsMask)
        let key = event.characters ?? ""
        
        /// 点击 esc 取消焦点
        if modifierkeys.rawValue == 0 && key == "\u{1B}" {
            self.window?.makeFirstResponder(nil)
        }
        
        if modifierkeys == [.command, .shift] && key == "z" {
            self.window?.firstResponder?.undoManager?.redo()
            return true
        }
        
        if modifierkeys != .command {
            return super.performKeyEquivalent(with: event)
        }
        
        switch key {
        case "a":
            return NSApp.sendAction(#selector(NSText.selectAll(_:)), to: self.window?.firstResponder, from: self)
        case "c":
            return NSApp.sendAction(#selector(NSText.copy(_:)), to: self.window?.firstResponder, from: self)
        case "v":
            return NSApp.sendAction(#selector(NSText.paste(_:)), to: self.window?.firstResponder, from: self)
        case "x":
            return NSApp.sendAction(#selector(NSText.cut(_:)), to: self.window?.firstResponder, from: self)
        case "z":
            self.window?.firstResponder?.undoManager?.undo()
            return true
        default:
            return super.performKeyEquivalent(with: event)
        }
    }
}
