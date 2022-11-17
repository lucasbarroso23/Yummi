//
//  DishDetailViewController.swift
//  Yummie
//
//  Created by Lucas Barroso IZ on 17/11/2022.
//

import UIKit

class DishDetailViewController: UIViewController {
    
    // outlets connectors to the ui elements
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nameField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // connector to the button action, in this case we dont need an outlet
    //because we dont need to change the button
    @IBAction func placeOrderBtnClicked(_ sender: UIButton) {
    }
}
