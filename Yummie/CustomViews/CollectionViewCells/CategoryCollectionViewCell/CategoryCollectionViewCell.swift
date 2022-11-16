//
//  CategoryCollectionViewCell.swift
//  Yummie
//
//  Created by Lucas Barroso IZ on 16/11/2022.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    
    // identifier is used to avoid string-programming, we can use identifier as a helper
    // to pass in the controller
    static let identifier = String(describing: CategoryCollectionViewCell.self)

    // outlets that connects the ImageView and the Title from the Nib
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLbl: UILabel!
    
    // setup is used to set the values, works as a init func
    func setup(category: DishCategory) {
        categoryTitleLbl.text = category.name
        categoryImageView.kf.setImage(with: category.image?.asUrl)
    }
}
