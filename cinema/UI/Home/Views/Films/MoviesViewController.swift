//
//  UsersViewController.swift
//  cinema
//
//  Created by Victor Martins Tinoco - VTN on 04/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {

    //  MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //  MARK: - Variables
    var viewModel: MoviesViewModel?
    var movies: [Movie] = []
    
    //  MARK: - View Controller Life Cycle
    init(viewModel: MoviesViewModel, nibName: String? = nil){
        super.init(nibName: nibName, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel?.set(delegate: self)
        setup()
        
        viewModel?.fetchMovies()
    }

    //  MARK: - Methods
    func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        self.title = "Filmes"
    }
}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.movies.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        if let movie = viewModel?.movies[indexPath.row] {
            cell.textLabel?.text = movie.titulo
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      viewModel?.showMovieDetails(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension MoviesViewController: MoviesViewModelViewDelegate {
    func didUpdateUsersList() {
        self.tableView.reloadData()
    }
    
    func didCompleteWithError(_ message: String) {
        
    }
    
    func didFinishRegister() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
