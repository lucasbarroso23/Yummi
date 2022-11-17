//
//  DishLandscapeCollectionViewCell.swift
//  Yummie
//
//  Created by Lucas Barroso IZ on 17/11/2022.
//

import UIKit
import Kingfisher

class DishLandscapeCollectionViewCell: UICollectionViewCell {
    // identifier to be used as the reference of the class
    static let identifier = String(describing:  DishLandscapeCollectionViewCell.self)

    // outlets to connect the ui elements
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    
    func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
    }
}
