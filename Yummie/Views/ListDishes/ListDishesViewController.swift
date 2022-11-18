//
//  ListDishesViewController.swift
//  Yummie
//
//  Created by Lucas Barroso IZ on 18/11/2022.
//

import UIKit

class ListDishesViewController: UIViewController {
    // connecting the table view created in the main storyboard
    @IBOutlet weak var tableView: UITableView!
    
    var category: DishCategory!
    
    var dishes: [Dish] = [
        .init(id: "id1", name: "Garri", description: "this is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 348),
        .init(id: "id2", name: "Pizza", description: "this is the best i have ever tasted, this is the best i have ever tasted, this is the best i have ever tasted, this is the best i have ever tasted, this is the best i have ever tasted, this is the best i have ever tasted, this is the best i have ever tasted, this is the best i have ever tasted, this is the best i have ever tasted, this is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 342),
        .init(id: "id3", name: "Carbonara", description: "this is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 534)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = category.name
        registerCells()
    }
  
    // registering the table view cells because they`re outside
    // the table view, outside the storyboard since we`re using
    // nibs to design the cells
    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle:nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}

// using extension to add the protocols delegate and datasource
extension ListDishesViewController:
    UITableViewDelegate, UITableViewDataSource {
    // with this we comply to the delegate protocol
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
        
    // with this we comply to the datasource protocol
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        // table view setup func used to populate the cells
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }

    // with didSelectRow we`re able to perform a action when the a row is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        
        navigationController?.pushViewController(controller, animated: true)
    }
}
