//
//  UIView+Extension.swift
//  Yummie
//
//  Created by Lucas Barroso IZ on 11/11/2022.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
