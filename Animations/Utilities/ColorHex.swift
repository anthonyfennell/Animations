//
//  ColorHex.swift
//  Animations
//
//  Created by Anthony Fennell on 12/21/19.
//  Copyright © 2019 Anthony Fennell. All rights reserved.
//

import UIKit

enum ColorHex: Int, CaseIterable {
    case white1=0xFFFFFF, gray1=0xD1D1D1, gray2=0xABAAAA, gray3 = 0x848484
    case black1=0x535353, black2=0x272626
    
    public var color: UIColor {
        return UIColor(hex: self.rawValue)
    }
    
    public var string: String {
        return "\(self.rawValue)"
    }
}
