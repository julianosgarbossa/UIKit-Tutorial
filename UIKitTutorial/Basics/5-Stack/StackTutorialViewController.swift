//
//  StackTutorialViewController.swift
//  UIKitTutorial
//
//  Created by Juliano Sgarbossa on 04/02/25.
//

import UIKit

class StackTutorialViewController: UIViewController {

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemCyan
        self.setVisualElements()
        
        let rect1 = createRectangle()
        rect1.backgroundColor = .systemRed
        
        let rect2 = createRectangle()
        rect2.backgroundColor = .systemPurple
        
        let rect3 = createRectangle()
        rect3.backgroundColor = .systemBrown
        
        stackView.addArrangedSubview(rect1)
        stackView.addArrangedSubview(rect2)
        stackView.addArrangedSubview(rect3)
    }
    
    private func createRectangle() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        view.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return view
    }
    
    private func setVisualElements() {
        self.view.addSubview(stackView)
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
}

#Preview {
    StackTutorialViewController()
}
