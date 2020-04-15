//
//  CustomTextFieldCell.swift
//  NSTextField
//
//  Created by dengyonghao on 2019/12/19.
//  Copyright © 2019 DengYonghao. All rights reserved.
//

import Cocoa

class CustomTextFieldCell: NSTextFieldCell {
    
    override init(textCell string: String) {
        super.init(textCell: string)
        self.isScrollable = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomTextFieldCell {
    
    override func edit(withFrame rect: NSRect, in controlView: NSView, editor textObj: NSText, delegate: Any?, event: NSEvent?) {
        let frame = adjustedFrameToVerticallyCenter(frame: rect)
        super.edit(withFrame: frame, in: controlView, editor: textObj, delegate: delegate, event: event)
    }
    
    override func select(withFrame rect: NSRect, in controlView: NSView, editor textObj: NSText, delegate: Any?, start selStart: Int, length selLength: Int) {
        let frame = adjustedFrameToVerticallyCenter(frame: rect)
        super.select(withFrame: frame, in: controlView, editor: textObj, delegate: delegate, start: selStart, length: selLength)
    }
    
    override func drawInterior(withFrame cellFrame: NSRect, in controlView: NSView) {
        let frame = adjustedFrameToVerticallyCenter(frame: cellFrame)
        super.drawInterior(withFrame: frame, in: controlView)
    }
    
    private func adjustedFrameToVerticallyCenter(frame: NSRect) -> NSRect {
        let ascender = font?.ascender ?? 0.0
        let descender = font?.descender ?? 0.0
        let offset = ceilf(Float(NSHeight(frame)/2 - ascender - descender))
        return NSInsetRect(frame, 0, CGFloat(offset))
    }

}
