//
//  UserDetailsViewController.swift
//  cinema
//
//  Created by Victor Martins Tinoco - VTN on 07/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var whereWatchButton: UIButton!
    
    var viewModel: MovieDetailsViewModel?
    
    //  MARK: - View Controller Life Cycle
    init(viewModel: MovieDetailsViewModel, nibName: String? = nil){
        super.init(nibName: nibName, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        setup()
    }

    //  MARK: - Methods
    @IBAction func whereWatchTouch(_ sender: Any) {
        UIApplication.shared.openURL(NSURL(string: "https://www.google.com/maps/place/Cinemark+S%C3%A3o+Paulo+Shopping+Metr%C3%B4+Boulevard+Tatuap%C3%A9/@-23.5066761,-46.6187212,11z/data=!3m1!5s0x94ce5ec2e1a7a8e3:0x9c17d57c9b790957!4m8!1m2!2m1!1scinemark!3m4!1s0x94ce5ec325a1282d:0xb752ef7895e83093!8m2!3d-23.5390007!4d-46.5758726")! as URL)
    }
    
    func setup() {
        self.navigationItem.title = viewModel?.movie.titulo
        
        whereWatchButton.layer.cornerRadius = 25
    }
}

extension MovieDetailsViewController: UITableViewDataSource, UITableViewDelegate {
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
