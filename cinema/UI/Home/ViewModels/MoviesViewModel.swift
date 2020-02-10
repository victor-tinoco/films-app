//
//  UserViewModel.swift
//  cinema
//
//  Created by Victor Martins Tinoco - VTN on 04/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation

protocol MoviesViewModelContract {
    var movies: [Movie] { get }
    func fetchMovies()
    func set(delegate: MoviesViewModelViewDelegate?)
    func showMovieDetails(_ index: IndexPath)
}

protocol MoviesViewModelViewDelegate: class {
    func didFinishRegister()
    func didUpdateUsersList()
    func didCompleteWithError(_ message: String)
}

protocol MoviesViewModelDelegate: class {
    func didSelectItem(_ viewModel: MoviesViewModel, movie: Movie)
}

class MoviesViewModel: MoviesViewModelContract {
    private var moviesList: [Movie] = []
    
    var movies: [Movie] {
        return moviesList
    }

//  MARK: - Variables
    var service: MovieService?
    
//  MARK: - Delegates
    weak var delegateView: MoviesViewModelViewDelegate?
    weak var delegate: MoviesViewModelDelegate?
    
//  MARK: - Methods
    init(delegateView: MoviesViewModelViewDelegate?, service: MovieService?) {
        self.delegateView = delegateView
        self.service = service ?? MovieService()
    }
    
    func set(delegate: MoviesViewModelViewDelegate?) {
        self.delegateView = delegate
    }
    
    func fetchMovies() {
        service?.list(completionHandler: { (result) in
            guard let list = try? result.get() else {
                self.delegateView?.didCompleteWithError("Ocorreu um erro ao recuperar a lista de usuários")
                return
            }
            
            self.moviesList.removeAll()
            self.moviesList.append(contentsOf: list)
            self.delegateView?.didUpdateUsersList()
        })
    }
    
    func showMovieDetails(_ index: IndexPath) {
        let movie: Movie = movies[index.row]
        delegate?.didSelectItem(self, movie: movie)
    }
}
