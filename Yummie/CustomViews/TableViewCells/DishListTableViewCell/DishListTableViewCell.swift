//
//  DishListTableViewCell.swift
//  Yummie
//
//  Created by Lucas Barroso IZ on 17/11/2022.
//

import UIKit
import Kingfisher

class DishListTableViewCell: UITableViewCell {
    // identifier that will be use to reference the class
    static let identifier = String(describing: DishListTableViewCell.self)

    // registering the outlets of the ui components
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    // setup func that works as a init func populating the class values
    func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
    }
    
    func setup(order: Order) {
        dishImageView.kf.setImage(with: order.dish?.image?.asUrl)
        titleLbl.text = order.dish?.name
        descriptionLbl.text = order.name
    }
}
