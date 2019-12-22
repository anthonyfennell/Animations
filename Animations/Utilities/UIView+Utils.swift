//
//  UIView+Utils.swift
//  Animations
//
//  Created by Anthony Fennell on 5/7/18.
//  Copyright © 2018 Anthony Fennell. All rights reserved.
//

import UIKit

extension UIView {
    
    // MARK: - Width
    func frameWidth() -> CGFloat {
        return self.frame.width
    }
    
    func setFrameWidth(_ width: CGFloat) {
        self.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: width, height: frame.height)
    }
    
    // MARK: - Height
    func frameHeight() -> CGFloat {
        return self.frame.height
    }
    
    func setFrameHeight(_ height: CGFloat) {
        self.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: height)
    }
    
    // MARK: - X
    func frameX() -> CGFloat {
        return self.frame.origin.x
    }
    
    func setFrameX(_ value: CGFloat) {
        self.frame = CGRect(x: value, y: frame.origin.y, width: frame.width, height: frame.height)
    }
    
    // MARK: - Y
    func frameY() -> CGFloat {
        return self.frame.origin.y
    }
    
    func setFrameY(_ value: CGFloat) {
        self.frame = CGRect(x: frame.origin.x, y: value, width: frame.width, height: frame.height)
    }
    
}
