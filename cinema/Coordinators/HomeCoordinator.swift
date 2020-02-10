//
//  HomeCoordinator.swift
//  cinema
//
//  Created by Victor Martins Tinoco - VTN on 05/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

class HomeCoordinator: BaseCoordinator {
    
    var window: UIWindow
    var root: UITabBarController
    
    let userViewModel: UsersViewModel
    var userView: UIViewController?
    var navigationUser: UINavigationController?
    
    let moviesViewModel: MoviesViewModel
    var navigationMovies: UINavigationController?
    var movieView: UIViewController?
    
    init(window: UIWindow) {
        self.window = window
        self.root = UITabBarController()
        
        self.moviesViewModel = MoviesViewModel(delegateView: nil, service: MovieService())
        self.userViewModel = UsersViewModel(delegateView: nil, service: UserService())
        
        self.moviesViewModel.delegate = self
        self.userViewModel.delegate = self
    }
    
    func start() {
        self.userView = UsersViewController(viewModel: userViewModel)
        navigationUser = UINavigationController(rootViewController: userView!)
        
        self.movieView = MoviesViewController(viewModel: moviesViewModel)
        navigationMovies = UINavigationController(rootViewController: movieView!)
        if #available(iOS 13.0, *) {
            navigationUser?.tabBarItem = UITabBarItem(title: "Usuários", image: UIImage(systemName: "person.circle"), selectedImage: UIImage(systemName: "person.circle.fill"))
            navigationMovies?.tabBarItem = UITabBarItem(title: "Filmes", image: UIImage(systemName: "film"), selectedImage: UIImage(systemName: "film.fill"))
            // Fallback on earlier versions
        }
        
        
        navigationUser?.navigationBar.prefersLargeTitles = true
        navigationMovies?.navigationBar.prefersLargeTitles = true
        
        root.setViewControllers([navigationUser!, navigationMovies!], animated: false)
        window.rootViewController = root    
    }
    
    func finish() {
        userView = nil
        navigationUser = nil
    }
}

extension HomeCoordinator: UsersViewModelDelegate {
    func didSelectItem(_ viewModel: UsersViewModel, user: User) {
        print("selected user => \(user)")
        let vm = UserDetailsViewModel(user: user)
        let viewController = UserDetailsViewController(viewModel: vm)
        navigationUser?.pushViewController(viewController, animated: true)
    }
}

extension HomeCoordinator: MoviesViewModelDelegate {
    func didSelectItem(_ viewModel: MoviesViewModel, movie: Movie) {
        print("selected movie => \(movie)")
    }
}
