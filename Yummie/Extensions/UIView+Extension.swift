//
//  UIView+Extension.swift
//  Yummie
//
//  Created by Lucas Barroso IZ on 11/11/2022.
//

import UIKit

// extension created to have access to the corner radius of the button from
// the attributes inspection panel
extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
