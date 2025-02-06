//
//  DelegateDesignPatternTutorialViewController.swift
//  UIKitTutorial
//
//  Created by Juliano Sgarbossa on 06/02/25.
//

import UIKit

class DelegateDesignPatternTutorialViewController: UIViewController {

    private lazy var customView: CustomView = {
        let customView = CustomView()
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.backgroundColor = .white
        customView.layer.cornerRadius = 16
        customView.delegate = self
        return customView
    }()
        
    private var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Primary Text Button Tapped"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGreen
        self.setVisualElements()
    }
    
    private func setVisualElements() {
        self.view.addSubview(customView)
        self.view.addSubview(textLabel)
        
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            customView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            customView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            customView.widthAnchor.constraint(equalToConstant: 300),
            customView.heightAnchor.constraint(equalToConstant: 300),
            
            
            textLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            textLabel.topAnchor.constraint(equalTo: customView.bottomAnchor, constant: 20),
        ])
    }
}

extension DelegateDesignPatternTutorialViewController: CustomViewDelegate {
    func onPrimaryTap() {
        print("DEBUG: primary tap event view controller")
        self.textLabel.isHidden = false
    }
    
    func onSecundaryTap() {
        print("DEBUG: secundary tap event view controller")
        self.textLabel.isHidden = true
    }
    
    
}

#Preview {
    DelegateDesignPatternTutorialViewController()
}
