//
//  ButtonTutorialViewController.swift
//  UIKitTutorial
//
//  Created by Juliano Sgarbossa on 31/01/25.
//

import UIKit

class ButtonTutorialViewController: UIViewController {

    private var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Texto texto texto text texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto"
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        label.textColor = .white
        return label
    }()
    
    private lazy var showTextButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Mostrar Texto", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.tintColor = .white
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 12
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(tappedShowText), for: .touchUpInside)
        return button
    }()

    @objc
    private func tappedShowText() {
        self.textLabel.isHidden.toggle()
        let title = textLabel.isHidden ? "Mostrar Texto" : "Ocultar Texto"
        self.showTextButton.setTitle(title, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .red
        
        self.setVisualElements()
    }
    
    private func setVisualElements() {
        self.view.addSubview(textLabel)
        self.view.addSubview(showTextButton)
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            textLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            textLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24),
            
            showTextButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 24),
            showTextButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 74),
            showTextButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -74),
            showTextButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
}

#Preview {
    ButtonTutorialViewController()
}
