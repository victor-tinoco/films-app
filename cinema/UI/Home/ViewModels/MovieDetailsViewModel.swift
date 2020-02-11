//
//  UserDetailsViewModel.swift
//  cinema
//
//  Created by Victor Martins Tinoco - VTN on 07/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import UIKit

protocol MovieDetailsViewModelContract {
    var movie: Movie { get }
    var properties: [(String,String)] { get }
}

class MovieDetailsViewModel: MovieDetailsViewModelContract {
    private var selectedMovie: Movie!
    
    var properties: [(String,String)] {
        return selectedMovie?.asTuple() ?? []
    }
    
    var movie: Movie {
        return selectedMovie
    }
    
    init(movie: Movie) {
        self.selectedMovie = movie
    }
}
