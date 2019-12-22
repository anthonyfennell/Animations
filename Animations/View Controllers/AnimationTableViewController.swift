//
//  AnimationTableViewController.swift
//  Animations
//
//  Created by Anthony Fennell on 6/8/18.
//  Copyright © 2018 Anthony Fennell. All rights reserved.
//

import UIKit

enum AnimationCellType: String {
    case shakeHorizontal = "Shake Horizontal"
    case shakeVertical = "Shake Vertical"
    case shakeBounce = "Shake Bounce"
    case rotateXAxis = "Rotate X-Axis"
    case rotateYAxis = "Rotate Y-Axis"
    case rotateZAxis = "Rotate Z-Axis"
    case rotateXYAxis = "Rotate XY-Axis"
    case dropToBottom = "Drop To Bottom"
    case riseToTop = "Rise To Top"
    case hopUp = "Hop Up"
    case hopDown = "Hop Down"
    case hopAround = "Hop Around"
}

class AnimationTableViewController: UITableViewController {

    let cells: [AnimationCellType] = [.dropToBottom, .hopDown, .shakeHorizontal, .shakeVertical,
                                      .shakeBounce, .rotateXAxis, .rotateYAxis,
                                      .rotateZAxis, .hopAround, .rotateXYAxis, .dropToBottom,
                                      .riseToTop, .riseToTop, .riseToTop, .riseToTop,
                                      .hopUp, .riseToTop, .rotateZAxis, .hopAround,
                                      .shakeBounce, .shakeVertical, .dropToBottom]

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimationTableViewCell", for: indexPath) as! AnimationTableViewCell
        cell.textLabel?.text = cells[indexPath.row].rawValue
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = cells[indexPath.row]
        let cell = tableView.cellForRow(at: indexPath)!
        
        switch type {
        case .shakeHorizontal:
            shakeHorizontal(cell: cell)
        case .shakeVertical:
            shakeVertical(cell: cell)
        case .shakeBounce:
            shakeBounce(cell: cell)
        case .rotateXAxis:
            rotateCell(cell: cell, xAxis: 1, yAxis: 0, zAxis: 0)
        case .rotateYAxis:
            rotateCell(cell: cell, xAxis: 0, yAxis: 1, zAxis: 0)
        case .rotateZAxis:
            rotateZAxis(cell: cell, xAxis: 0, yAxis: 0, zAxis: 1)
        case .rotateXYAxis:
            rotateCell(cell: cell, xAxis: 1, yAxis: 1, zAxis: 0)
        case .dropToBottom:
            dropToBottom(cell: cell)
        case .riseToTop:
            riseToTop(cell: cell)
        case .hopUp:
            hopUp(cell: cell)
        case .hopDown:
            hopDown(cell: cell)
        case .hopAround:
            hopAround(cell: cell)
        }
    }
    
    func shakeHorizontal(cell: UITableViewCell) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.autoreverses = true
        animation.repeatCount = 3
        animation.fromValue = CGPoint(x: cell.center.x - 5, y: cell.center.y)
        animation.toValue = CGPoint(x: cell.center.x + 5, y: cell.center.y)
        cell.layer.add(animation, forKey: "position")
    }
    
    func shakeVertical(cell: UITableViewCell) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.autoreverses = true
        animation.repeatCount = 3
        animation.fromValue = CGPoint(x: cell.center.x, y: cell.center.y - 5)
        animation.toValue = CGPoint(x: cell.center.x, y: cell.center.y + 5)
        cell.layer.add(animation, forKey: "position")
    }
    
    func shakeBounce(cell: UITableViewCell) {
        let startAngle: CGFloat = 0
        let endAngle: CGFloat = CGFloat.pi
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: cell.center.x, y: cell.center.y), radius: 5, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.duration = 0.3
        animation.autoreverses = true
        animation.repeatCount = 3
        animation.path = circlePath.cgPath
        cell.layer.add(animation, forKey: nil)
    }
    
    func rotateCell(cell: UITableViewCell, xAxis: CGFloat, yAxis: CGFloat, zAxis: CGFloat) {
        let fromValue: CGFloat = 0
        let transform = CATransform3DRotate(cell.layer.transform, fromValue, xAxis, yAxis, zAxis)
        let values: [CATransform3D] = [
            CATransform3DRotate(transform, fromValue, xAxis, yAxis, zAxis),
            CATransform3DRotate(transform, fromValue + .pi / 8, xAxis, yAxis, zAxis),
            CATransform3DRotate(transform, fromValue + .pi / 4, xAxis, yAxis, zAxis),
            CATransform3DRotate(transform, fromValue + .pi / 2, xAxis, yAxis, zAxis),
        ]
        let animation = CAKeyframeAnimation(keyPath: "transform")
        animation.duration = 0.5
        animation.autoreverses = true
        animation.repeatCount = 3
        animation.values = values
        cell.layer.add(animation, forKey: "tranformME")
    }
    
    func rotateZAxis(cell: UITableViewCell, xAxis: CGFloat, yAxis: CGFloat, zAxis: CGFloat) {
        let fromValue: CGFloat = 0
        let transform = CATransform3DRotate(cell.layer.transform, fromValue, xAxis, yAxis, zAxis)
        let values: [CATransform3D] = [
            CATransform3DRotate(transform, fromValue, xAxis, yAxis, zAxis),
            CATransform3DRotate(transform, fromValue + .pi / 12, xAxis, yAxis, zAxis),
            CATransform3DRotate(transform, fromValue, xAxis, yAxis, zAxis),
            CATransform3DRotate(transform, fromValue - .pi / 12, xAxis, yAxis, zAxis),
            ]
        let animation = CAKeyframeAnimation(keyPath: "transform")
        animation.duration = 0.1
        animation.autoreverses = true
        animation.repeatCount = 3
        animation.values = values
        cell.layer.add(animation, forKey: "tranformME")
    }
    
    func dropToBottom(cell: UITableViewCell) {
        UIView.animate(withDuration: 0.3, animations: {
            cell.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height - cell.frame.origin.y - cell.frame.size.height)
        }, completion: { success in
            UIView.animate(withDuration: 0.7, delay: 0.05, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
        })
    }
    
    func riseToTop(cell: UITableViewCell) {
        let frame = tableView.convert(cell.frame, to: view) //view.convert(cell.frame.origin, from: cell)
        UIView.animate(withDuration: 0.3, animations: {
            cell.transform = CGAffineTransform(translationX: 0, y: -frame.origin.y)
        }, completion: { success in
            UIView.animate(withDuration: 0.7, delay: 0.05, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
        })
    }
    
    func hopUp(cell: UITableViewCell) {
        let cellHeight = cell.frame.height
        Animations.hopUp(view: cell, distance: cellHeight) { (success) in
            Animations.hopUp(view: cell, distance: cellHeight * 3, completion: { (success) in
                Animations.hopUp(view: cell, distance: cellHeight * 10, completion: { (success) in
                    cell.transform = CGAffineTransform.identity
                })
            })
        }
    }
    
    func hopDown(cell: UITableViewCell) {
        let cellHeight = cell.frame.height
        Animations.hopDown(view: cell, distance: cellHeight) { (success) in
            Animations.hopDown(view: cell, distance: cellHeight * 3, completion: { (success) in
                Animations.hopDown(view: cell, distance: cellHeight * 10, completion: { (success) in
                    cell.transform = CGAffineTransform.identity
                })
            })
        }
    }
    
    func hopAround(cell: UITableViewCell) {
        let cellHeight = cell.frame.height
        Animations.hopUp(view: cell, distance: cellHeight * 2) { (success) in
            Animations.hopDown(view: cell, distance: cellHeight, completion: { (success) in
                Animations.hopUp(view: cell, distance: cellHeight * 4, completion: { (success) in
                    Animations.hopDown(view: cell, distance: cellHeight * 2, completion: { (success) in
                        Animations.hopUp(view: cell, distance: cellHeight, completion: { (success) in
                            cell.transform = CGAffineTransform.identity
                        })
                    })
                })
            })
        }
    }

}
