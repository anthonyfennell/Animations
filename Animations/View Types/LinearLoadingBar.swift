//
//  LinearLoadingBar.swift
//

import UIKit

class LinearLoadingBar: UIView {
    
    var animationColor: UIColor = UIColor.purple {
        didSet {
            self.redraw()
        }
    }
    
    private let duration: TimeInterval = 2.25
    private let firstAnimationDuration: TimeInterval = 1.5
    private let startFromValue: CGFloat = -0.4
    private let startToValue: CGFloat = 1.0
    private let endFromValue: CGFloat = 0.0
    private let endToValue: CGFloat = 1.4
    private var lastRect: CGRect = .zero
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupBackgroundColor()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupBackgroundColor()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func redraw() {
        self.lastRect = .zero
        self.setupBackgroundColor()
        self.setNeedsLayout()
    }
    
    private func setupBackgroundColor() {
        self.backgroundColor = self.animationColor.withAlphaComponent(0.3)
    }
    
    override func draw(_ rect: CGRect) {
        if rect != self.lastRect {
            self.lastRect = rect
            self.layer.removeAllAnimations()
            let layer = self.addLayer(with: rect)
            self.animate(layer: layer)
        }
    }
    
    private func addLayer(with rect: CGRect) -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.path = self.makePath(with: rect)
        layer.lineWidth = rect.height
        layer.strokeColor = self.animationColor.cgColor
        layer.fillColor = nil
        self.layer.addSublayer(layer)
        return layer
    }
    
    private func makePath(with rect: CGRect) -> CGPath {
        let path = UIBezierPath()
        let origin = CGPoint(x: rect.minX, y: rect.midY)
        let end = CGPoint(x: rect.maxX, y: rect.midY)
        path.move(to: origin)
        path.addLine(to: end)
        return path.cgPath
    }
    
    private func animate(layer: CAShapeLayer, fillMode: CAMediaTimingFillMode = .forwards) {
        // 1st animation
        let start1 = CABasicAnimation(keyPath: AnimationConstant.KeyPath.strokeStart)
        start1.duration = self.firstAnimationDuration
        start1.fromValue = self.startFromValue
        start1.toValue = self.startToValue
        start1.fillMode = fillMode
        start1.timingFunction = CAMediaTimingFunction(name: .easeIn)
        let end1 = CABasicAnimation(keyPath: AnimationConstant.KeyPath.strokeEnd)
        end1.duration = self.firstAnimationDuration
        end1.fromValue = self.endFromValue
        end1.toValue = self.endToValue
        end1.fillMode = fillMode
        
        // 2nd animation
        let start2 = CABasicAnimation(keyPath: AnimationConstant.KeyPath.strokeStart)
        start2.beginTime = self.firstAnimationDuration
        start2.fromValue = self.startFromValue
        start2.toValue = self.startToValue
        start2.duration = self.duration - self.firstAnimationDuration
        start2.fillMode = fillMode
        let end2 = CABasicAnimation(keyPath: AnimationConstant.KeyPath.strokeEnd)
        end2.beginTime = self.firstAnimationDuration
        end2.fromValue = self.endFromValue
        end2.toValue = self.endToValue
        end2.duration = self.duration - self.firstAnimationDuration
        end2.fillMode = fillMode
        
        let group = CAAnimationGroup()
        group.duration = self.duration
        group.repeatDuration = .infinity
        group.animations = [start1, end1, start2, end2]
        layer.add(group, forKey: nil)
    }
    
}
