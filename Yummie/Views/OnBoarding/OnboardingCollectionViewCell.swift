//
//  OnboardingCollectionViewCell.swift
//  Yummie
//
//  Created by Lucas Barroso IZ on 14/11/2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    // identifier is used to avoid string-programming, we can use identifier as a helper
    // to pass in the controller
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    // outlets that connects the slideImageView, slideTitleLbl and the
    // slideDescriptionLbl from the CollectionViewCell
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLbl: UILabel!
    @IBOutlet weak var slideDescriptionLbl: UILabel!
    
    // setup is used to set the values, works as a init func
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLbl.text = slide.title
        slideDescriptionLbl.text = slide.description
    }
}
