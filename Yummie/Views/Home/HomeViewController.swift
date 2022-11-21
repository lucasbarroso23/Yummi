//
//  HomeViewController.swift
//  Yummie
//
//  Created by Lucas Barroso IZ on 14/11/2022.
//

import UIKit

class HomeViewController: UIViewController {

    // connecting the categoryCollectionView and popularCollectionView to the controller
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    // our list of categories, using the init func to instanciante the itens
    var categories: [DishCategory] = [
        .init(id: "id1", name: "Africa Dish 1", image: "https://picsum.photos/100/200"),
        .init(id: "id2", name: "Africa Dish 2", image: "https://picsum.photos/100/200"),
        .init(id: "id3", name: "Africa Dish 3", image: "https://picsum.photos/100/200"),
        .init(id: "id4", name: "Africa Dish 4", image: "https://picsum.photos/100/200"),
        .init(id: "id5", name: "Africa Dish 5", image: "https://picsum.photos/100/200")
    ]
    
    var populars: [Dish] = [
        .init(id: "id1", name: "Garri", description: "this is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 348),
        .init(id: "id2", name: "Pizza", description: "this is the best i have ever tasted, this is the best i have ever tasted, this is the best i have ever tasted, this is the best i have ever tasted, this is the best i have ever tasted, this is the best i have ever tasted, this is the best i have ever tasted, this is the best i have ever tasted, this is the best i have ever tasted, this is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 342),
        .init(id: "id3", name: "Carbonara", description: "this is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 534)
    ]
    
    var specials: [Dish] = [
        .init(id: "id2", name: "Fried Plantain", description: "this is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 342),
        .init(id: "id3", name: "Ribeye", description: "this is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 534)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        NetworkService.shared.myFirstRequest {(result) in
            switch result{
            case .success(let data):
                for dish in data {
                    print(dish.name  ?? "")
                }
            case .failure(let error):
                print("The error is: \(error.localizedDescription)")
            }
        }
        
       registerCells()
            
    // setting the title for the view
    title = "Yummie"
    }
    
    // since the cells were created outside the controller we neeed to mannually register
    // the cells in the controller
    private func registerCells() {
        categoryCollectionView
            .register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        popularCollectionView
            .register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        
        specialsCollectionView
            .register(UINib(nibName: DishLandscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier)
    }
}

// using the extension to complied to the delegate and dataSource protocols
extension HomeViewController:
    UICollectionViewDelegate,
    UICollectionViewDataSource {
    
    // in here we comply to the delegate protocol by passing the number of itens that
    // that we have on the categories, meaning this will be the number of itens in the view
    // we use a switch statement to diff the views
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case specialsCollectionView:
            return specials.count
        default: return 0
        }
    }
    
    // in here we comply to the dataSource protocol by binding the categoryCollectionviewCell
    // to the collectionView deque...
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            
            // setup the cells to populate using the categories array
            cell.setup(category: categories[indexPath.row])
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            
            // setup the cells to populate using the categories array
            cell.setup(dish: populars[indexPath.row])
            return cell
            
        case specialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifier, for: indexPath) as! DishLandscapeCollectionViewCell
            
            // setup the cells to populate using the categories array
            cell.setup(dish: specials[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            // controller represents our target view controller
            let controller = ListDishesViewController.instantiate()
            
            // category will be used to change the navigation bar title
            controller.category = categories[indexPath.row]
            
            // pushView will navigate to the target view controller
            navigationController?.pushViewController(controller, animated: true)
        } else {
            // controller represents our target view controller
            let controller = DishDetailViewController.instantiate()
            
            // checking wich collectionView is clicked to differentiate the data source
            // then we populate the dish variable from the controller
            controller.dish = collectionView == popularCollectionView ?
            populars[indexPath.row] : specials[indexPath.row]
            
            // pushView will navigate to the target view controller
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
