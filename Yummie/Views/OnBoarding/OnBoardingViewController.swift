//
//  OnBoardingViewController.swift
//  Yummie
//
//  Created by Lucas Barroso IZ on 11/11/2022.
//

import UIKit

class OnBoardingViewController: UIViewController {

    // outlets to connect the colletionView, nextBtn, pageControl components from our UI
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [OnboardingSlide] = []
    
    // current page will control the slide pageControl and the button actions
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Get Started", for: .normal)
            } else {
                nextBtn.setTitle("Next", for: .normal)
            }        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // slides contains the list of onboarding slides
        slides = [
                    OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide2")),
                    OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "slide1")),
                    OnboardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "slide3"))
                ]
        
        // setting the number of elements of our pageControl with the number of slides
        pageControl.numberOfPages = slides.count
    }
    

    // in here we have our button action at the onboarding, we use the index of the
    // slides to select the action that will be performed, we either move to the next
    // slide or at the end will send us to the home view
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        // setup to the homeView action, if the current page is the last of the slides.count
        // instanciate the controller of the homeView as a UINavigationController
        // then we apply our personalization to the style of presentation and transition
        // finally we call present() and pass the controller, this will perform the action
        // else we increment the currentPage and use it to update the current indexPath
        // then the button action will move to the next slide
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

// extending our controller to comply to the delegate,
// dataSource and DelegateFlowLayout protocols
extension OnBoardingViewController:
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout{
    // in here we comply to the delegate protocol by passing the number of itens that
    // that we have on the slides, meaning this will be the number of itens in the view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    // in here we comply to the dataSource protocol by binding the OnboardingCollectionViewCell
    // to the collectionView deque...
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath)
        as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    // in here we modify our slides to have the same height and width from our collectionView
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: collectionView.frame.width, height: collectionView.frame.height
        )
    }
    // in here we set the slide scrolling to the horizontal width
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
