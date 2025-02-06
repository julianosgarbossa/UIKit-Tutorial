//
//  TextFieldTutorialViewController.swift
//  UIKitTutorial
//
//  Created by Juliano Sgarbossa on 05/02/25.
//

import UIKit

class TextFieldTutorialViewController: UIViewController {

    private let nameTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.placeholder = "Informe seu nome"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.keyboardType = .default
        textField.returnKeyType = .next
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.systemGray2.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 16
        return textField
    }()
    
    private lazy var searchTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.placeholder = "Pesquisar..."
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.keyboardType = .default
        textField.returnKeyType = .search
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.systemGray2.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 16
        textField.addTarget(self, action: #selector(onEditingChange), for: .editingChanged)
        return textField
    }()
    
    @objc
    private func onEditingChange(_ sender: UITextField) {
        print("DEBUG: o texto atual do campo de texto é: \(sender.text ?? "vazio")")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.setVisualElements()
        
        // Usando forEach para setar os delagates de todos os textFields
        // self.searchTextField.delegate = self
        [searchTextField, nameTextField].forEach { $0.delegate = self }
    }
    
    private func setVisualElements() {
        self.view.addSubview(nameTextField)
        self.view.addSubview(searchTextField)
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 25),
            nameTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            nameTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24),
            nameTextField.heightAnchor.constraint(equalToConstant: 48),
            
            searchTextField.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 25),
            searchTextField.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
            searchTextField.heightAnchor.constraint(equalTo: self.nameTextField.heightAnchor),
        ])
    }
}

extension TextFieldTutorialViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("DEBUG: o botão de return foi pressionado")
        if textField == nameTextField {
            searchTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("DEBUG: a edição do campo de texto iniciou")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("DEBUG: a edição do campo de texto terminou")
    }
}

#Preview {
    TextFieldTutorialViewController()
}
