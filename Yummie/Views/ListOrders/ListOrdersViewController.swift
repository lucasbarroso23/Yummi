//
//  ListOrdersViewController.swift
//  Yummie
//
//  Created by Lucas Barroso IZ on 21/11/2022.
//

import UIKit

class ListOrdersViewController: UIViewController {

    // outlet to connect the table view to the controller
    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = [
        .init(id: "id1", name: "Lucas", dish: .init(id: "id1", name: "Garri", description: "this is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 348)),
        .init(id: "id2", name: "Mauricio", dish: .init(id: "id1", name: "Chicken filet", description: "this is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 348)),
        .init(id: "id3", name: "Moza", dish: .init(id: "id1", name: "Carbonara", description: "this is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 348)),
        .init(id: "id4", name: "Geovaldo", dish: .init(id: "id1", name: "Mac & cheese", description: "this is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 348))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Orders"
        registerCells()
    }

    // func used to register the cells, in this case we are using the
    // dish list cells, the same we used for the dish category
    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}

// extension used to comply to the delegate and data source protocols
extension ListOrdersViewController:
    UITableViewDelegate, UITableViewDataSource {
    // this func will inform to the table view how many rows we`ll have
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    // this func will bind the data to the specific table row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        
        cell.setup(order: orders[indexPath.row])
        
        return cell
    }
    
    // in this func we`ll use the navigation controller to push to the detail page
    // when a cell is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
}
