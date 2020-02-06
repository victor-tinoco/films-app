//
//  LoginViewController.swift
//  cinema
//
//  Created by Victor Martins Tinoco - VTN on 03/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

//  MARK: - IBOutlets
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
//  MARK: - Variables
    var viewModel: LoginViewModel?
    
//  MARK: - View Controller Life Cycle
    init(viewModel: LoginViewModel, nibName: String? = nil){
        super.init(nibName: nibName, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

//  MARK: - Methods
    func setup() {
        viewModel?.delegateView = self
        
        loginButton.layer.cornerRadius = 5
    }
    
//  MARK: - IBActions
    @IBAction func touchLoginButton(_ sender: Any) {
        guard let user = userTextField.text, !user.isEmpty, let pass = passwordTextField.text, !pass.isEmpty else { return }
        viewModel?.makeLogin(user: user, password: pass)
    }
}

extension LoginViewController: LoginViewModelViewDelegate {
    func didErrorLogin() {
        print("Invalid credentials!")
    }
}
