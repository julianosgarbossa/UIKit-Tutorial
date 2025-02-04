//
//  ShapeTutorialViewController.swift
//  UIKitTutorial
//
//  Created by Juliano Sgarbossa on 04/02/25.
//

import UIKit

class ShapeTutorialViewController: UIViewController {

    private let rectangle: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.backgroundColor = .systemRed
        return view
    }()
    
    private let circle: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 125 / 2
        view.backgroundColor = .systemBlue
        return view
    }()
    
    private let triangle: TriangleView = {
        let view = TriangleView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.fillColor = .systemGreen
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setVisualElements()
    }
    
    private func setVisualElements() {
        self.view.addSubview(rectangle)
        self.view.addSubview(circle)
        self.view.addSubview(triangle)
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            rectangle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            rectangle.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -150),
            rectangle.heightAnchor.constraint(equalToConstant: 125),
            rectangle.widthAnchor.constraint(equalToConstant: 125),
            
            circle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            circle.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            circle.heightAnchor.constraint(equalToConstant: 125),
            circle.widthAnchor.constraint(equalToConstant: 125),
            
            triangle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            triangle.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 150),
            triangle.heightAnchor.constraint(equalToConstant: 125),
            triangle.widthAnchor.constraint(equalToConstant: 125),
        ])
    }
}

#Preview {
    ShapeTutorialViewController()
}
