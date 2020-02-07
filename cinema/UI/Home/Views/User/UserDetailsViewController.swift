//
//  UserDetailsViewController.swift
//  cinema
//
//  Created by Victor Martins Tinoco - VTN on 07/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {
    @IBOutlet weak var userTableView: UITableView!
    
    var viewModel: UserDetailsViewModel?
    var propTitleList: [String] = []
    var propList: [String] = []
    
    //  MARK: - View Controller Life Cycle
    init(viewModel: UserDetailsViewModel, nibName: String? = nil){
        super.init(nibName: nibName, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTableView.delegate = self
        userTableView.dataSource = self
        
        setup()
    }

    //  MARK: - Methods
    func setup() {
//      let rightButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(navigationToRegister))
        let rightButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = rightButton
        
        
    }
}

extension UserDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.properties.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .value1, reuseIdentifier: "cell")
        
        if let item = self.viewModel?.properties[indexPath.row] {
            cell.textLabel?.text = "\(item.0)"
            cell.detailTextLabel?.text = "\(item.1)"
        } else {
            cell.textLabel?.text = nil
            cell.detailTextLabel?.text = nil
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
