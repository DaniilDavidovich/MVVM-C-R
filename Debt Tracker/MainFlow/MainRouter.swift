import UIKit




class MainRouter: MainRouterProtocol {
    
    weak var coordinator: MainCoordinator?
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func setupFirstTab() -> UIViewController {
        
        let firstCoordinator = FirstTabBarCoordinator()
        firstCoordinator.start()
        coordinator?.childCoordinators.append(firstCoordinator)
        
        if let vc = firstCoordinator.navigationController {
            vc.tabBarItem = setupUITabBarItem(title: "First",
                                              image: "heart",
                                              selectedImage: "heart.fill")
            return vc
        }
        return UIViewController()
    }
    
    func setupSecondTab() -> UIViewController {
        let secondTabCoordinator = SecondTabCoordinator()
        secondTabCoordinator.start()
        let vc = secondTabCoordinator.navigationController
        
        vc.tabBarItem = setupUITabBarItem(title: "Second",
                                          image: "paperplane",
                                          selectedImage: "paperplane.fill")
        return vc
    }
    
    func showTabBarController() {
        let vc = setupFirstTab()
        let vc2 = setupSecondTab()
        coordinator?.rootViewController?.setViewControllers([vc, vc2], animated: true)
    }
    
    func setupUITabBarItem(title: String, image: String, selectedImage: String) -> UITabBarItem {
        let tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: image), selectedImage: UIImage(systemName: selectedImage))
        return tabBarItem
    }
}
