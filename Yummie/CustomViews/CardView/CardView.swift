//
//  CardView.swift
//  Yummie
//
//  Created by Lucas Barroso IZ on 16/11/2022.
//

import UIKit

// this class is used to add a shadow to our cards
class CardView: UIView {
    // didnt get it, but its required
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    // didnt get it, but its required
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }    
    // customization of the cards
    private func initialSetup() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.1
        cornerRadius = 10
    }
}
