//
//  SquareContainer.swift
//  Animations
//
//  Created by Anthony Fennell on 5/7/18.
//  Copyright © 2018 Anthony Fennell. All rights reserved.
//

import UIKit

enum SquarePosition {
    case left, right, top, bottom
    
    func startAngle() -> CGFloat {
        switch self {
        case .top:
            return CGFloat.pi / 2
        case .left:
            return CGFloat.pi
        case .bottom:
            return CGFloat.pi * 3 / 2
        case .right:
            return 0
        }
    }
    
    func endAngle() -> CGFloat {
        switch self {
        case .top:
            return CGFloat.pi * 5 / 2
        case .left:
            return CGFloat.pi * 3
        case .bottom:
            return CGFloat.pi * 7 / 2
        case .right:
            return CGFloat.pi * 2
        }
    }
}

enum Rotation {
    case clockwise, counterClockwise
}

struct SquareView {
    let position: SquarePosition
    let view: UIView
}

struct SquaresContainer {
    let center: CGPoint
    let rotation: Rotation
    let views: [SquareView]
}
