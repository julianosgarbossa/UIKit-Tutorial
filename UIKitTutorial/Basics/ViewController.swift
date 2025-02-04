//
//  ViewController.swift
//  UIKitTutorial
//
//  Created by Juliano Sgarbossa on 31/01/25.
//

import UIKit

class ViewController: UIViewController {

    private var isLogado = false
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGreen
    }

    private func alterarLabel(title: String) {
        self.titleLabel.text = title
    }
    
    @IBAction func tappedLoginButton(_ sender: Any) {
        self.isLogado.toggle()
        if self.isLogado {
            self.alterarLabel(title: "Juliano Sgarbossa - Logado")
            self.loginButton.setTitle("Deslogar", for: .normal)
            self.view.backgroundColor = .orange
        } else {
            self.alterarLabel(title: "Juliano Sgarbossa - Deslogado")
            self.loginButton.setTitle("Logar", for: .normal)
            self.view.backgroundColor = .systemGreen
        }
    }
}

