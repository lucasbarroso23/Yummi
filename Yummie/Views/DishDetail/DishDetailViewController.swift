//
//  DishDetailViewController.swift
//  Yummie
//
//  Created by Lucas Barroso IZ on 17/11/2022.
//

import UIKit
import Kingfisher

class DishDetailViewController: UIViewController {
    
    // outlets connectors to the ui elements
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    var dish: Dish!

    override func viewDidLoad() {
        super.viewDidLoad()

        populateView()
    }
    
    // populateView will pass the dish values to the components in the ui
    private func populateView() {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
    }
    
    // connector to the button action, in this case we dont need an outlet
    //because we dont need to change the button
    @IBAction func placeOrderBtnClicked(_ sender: UIButton) {
    }
}
