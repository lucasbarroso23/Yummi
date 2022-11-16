//
//  DishPortraitCollectionViewCell.swift
//  Yummie
//
//  Created by Lucas Barroso IZ on 16/11/2022.
//

import UIKit
import Kingfisher

class DishPortraitCollectionViewCell: UICollectionViewCell {
    // identifier is used to avoid string-programming, we can use identifier as a helper
    // to pass in the controller
    static let identifier = String(describing: DishPortraitCollectionViewCell.self)

    // outlets to connect the ui elements do the class
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    // setup func to pass the values and bind the Dish struct
    func setup(dish: Dish) {
        titleLbl.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        caloriesLbl.text = dish.formattedCalories
        descriptionLbl.text = dish.description
    }
}
