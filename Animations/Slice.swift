//
//  Slice.swift
//  Animations
//
//  Created by Anthony Fennell on 4/20/18.
//  Copyright © 2018 Anthony Fennell. All rights reserved.
//

import UIKit

class Slice: UIView {

    var quadrant: Quadrant!
    var arcRadius: CGFloat {
        return self.frame.width / 2
    }

    override func draw(_ rect: CGRect) {
        UIColor.purple.set()
        addSlice(quadrant: self.quadrant)
    }
    
    func addSlice(quadrant: Quadrant) {
        let path = UIBezierPath()
        let sPointX = arcRadius * cos(quadrant.startAngle()) + arcRadius
        let sPointY = arcRadius * sin(quadrant.startAngle()) + arcRadius
        let startPoint: CGPoint = CGPoint(x: 125, y: 125)
        path.lineWidth = 3.0
        path.move(to: startPoint)
        let tipPoint = CGPoint.zero
        path.addArc(withCenter: tipPoint, radius: arcRadius, startAngle: quadrant.startAngle(), endAngle: quadrant.endAngle(), clockwise: true)
        path.addLine(to: tipPoint)
        path.fill()
    }
}
