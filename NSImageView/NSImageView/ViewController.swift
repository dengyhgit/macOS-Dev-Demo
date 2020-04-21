//
//  ViewController.swift
//  NSImageView
//
//  Created by dengyonghao on 2020/4/18.
//  Copyright © 2020 DengYonghao. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    lazy var imageView: NSImageView = {
        let imageView = NSImageView()
        imageView.frame = NSRect(x: 30, y: 30, width: 100, height: 100)
        var image = NSImage(named: "1.jpeg")
//        image = image?.resizeImage(NSSize(width: 100, height: 100))
        imageView.image = image
        imageView.action = #selector(pasteImage(_:))
        imageView.isEditable = true
        imageView.allowsCutCopyPaste = true
        imageView.imageFrameStyle = .grayBezel
        imageView.imageScaling = .scaleAxesIndependently
        return imageView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    

    private func setupSubviews() {
        view.addSubview(imageView)
    }
    
    
    @objc private func pasteImage(_ tager: NSImageView) {
        let pasteboard = NSPasteboard.general
        
        if let data = pasteboard.data(forType: NSPasteboard.PasteboardType.fileURL),
            let str =  String(data: data, encoding: .utf8),
            let url = URL(string: str),
            let image = NSImage(contentsOf: url)
        {
            tager.image = image
        }
    }

}

extension NSImage {
    
    public func resizeImage(_ size: NSSize) -> NSImage {
        let targetFrame = NSRect(origin: CGPoint(x: 0, y: 0), size: size);
        let targetImage = NSImage(size: size)
        let selfSize = self.size
        let ratioHeight = size.height / selfSize.height
        let ratioWidth = size.width / selfSize.width
        var cropRect = NSZeroRect
        if ratioHeight >= ratioWidth {
            cropRect.size.width = floor (size.width / ratioHeight)
            cropRect.size.height = selfSize.height
        } else {
            cropRect.size.width = selfSize.width
            cropRect.size.height = floor(size.height / ratioWidth)
        }

        cropRect.origin.x = floor((selfSize.width - cropRect.size.width) / 2)
        cropRect.origin.y = floor((selfSize.height - cropRect.size.height) / 2)

        targetImage.lockFocus()
        self.draw(in: targetFrame,
                  from: cropRect,
                  operation: .copy,
                  fraction: 1.0,
                  respectFlipped: true,
                  hints: [
                            NSImageRep.HintKey.interpolation : NSImageInterpolation.low.rawValue
                          ])

        targetImage.unlockFocus()
        return targetImage
    }
    
}
