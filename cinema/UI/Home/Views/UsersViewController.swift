//
//  UsersViewController.swift
//  cinema
//
//  Created by Victor Martins Tinoco - VTN on 04/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {

    //  MARK: - IBOutlets
    @IBOutlet weak var usersTableView: UITableView!
    
    //  MARK: - Variables
    var viewModel: UsersViewModel?
    var users: [User] = []
    
    //  MARK: - View Controller Life Cycle
    init(viewModel: UsersViewModel, nibName: String? = nil){
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
        
        viewModel?.fetchUsers()
    }

    //  MARK: - Methods
    func setup() {
        usersTableView.delegate = self
        usersTableView.dataSource = self
                    
        self.title = "Usuários"
        let rightButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(navigationToRegister))
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func navigationToRegister() {
//            viewModel?.callRegisterCar()
    }
}

extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.users.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        if let user = viewModel?.users[indexPath.row] {
            cell.textLabel?.text = "\(user.name)"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension UsersViewController: UsersViewModelViewDelegate {
    func didUpdateUsersList() {
        self.usersTableView.reloadData()
    }
    
    func didCompleteWithError(_ message: String) {
        
    }
    
    func didFinishRegister() {
        usersTableView.reloadData()
    }
}
