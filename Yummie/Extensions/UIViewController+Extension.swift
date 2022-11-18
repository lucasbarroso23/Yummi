//
//  UIViewController+Extension.swift
//  Yummie
//
//  Created by Lucas Barroso IZ on 17/11/2022.
//

import UIKit

// this extension helps the instatiation of view controllers
extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
    
    // instead of repeating the instantiateViewController
    // we use this method to encapsulate this code and easily
    // call a view controller
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
}
