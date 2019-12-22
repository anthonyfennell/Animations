//
//  ViewControllerFactory.swift
//  Animations
//
//  Created by Anthony Fennell on 5/7/18.
//  Copyright © 2018 Anthony Fennell. All rights reserved.
//

import Foundation
import UIKit

struct ViewControllerFactory {
    
    static let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    static func makeBlobAnimationVC() -> BlobAnimationViewController {
        return BlobAnimationViewController()
    }
    
    static func makeSquareAnimationVC() -> SquareAnimationViewController {
        return SquareAnimationViewController()
    }
    
    static func makePizzaAnimationVC() -> PizzaAnimationViewController {
        return PizzaAnimationViewController()
    }
    
    static func makeFanAnimationVC() -> FanAnimationViewController {
        return FanAnimationViewController()
    }
    
    static func makeLinearLoadingVC() -> LinearLoadingViewController {
        return LinearLoadingViewController()
    }
    
    static func makeAnimationTableVC() -> AnimationTableViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "AnimationTableVC") as! AnimationTableViewController
        return viewController
    }

}
