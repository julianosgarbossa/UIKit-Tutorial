//
//  ActionButtonView.swift
//  UIKitTutorial
//
//  Created by Juliano Sgarbossa on 06/02/25.
//

import UIKit

protocol CustomViewDelegate: AnyObject {
    func onPrimaryTap()
    func onSecundaryTap()
}

class CustomView: UIView {
    
    public weak var delegate: CustomViewDelegate?

    private lazy var primaryActionButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Primary Action", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(hundlePrimaryTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var secundaryActionButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Secundary Action", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(hundleSecundaryTap), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func hundlePrimaryTap(_ sender: UIButton) {
        print("Primary Action Tapped")
        self.delegate?.onPrimaryTap()
    }
   
    @objc
    private func hundleSecundaryTap(_ sender: UIButton) {
        print("Secundary Action Tapped")
        self.delegate?.onSecundaryTap()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setVisualElements() {
        self.addSubview(primaryActionButton)
        self.addSubview(secundaryActionButton)
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            primaryActionButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            primaryActionButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            primaryActionButton.widthAnchor.constraint(equalToConstant: 200),
            primaryActionButton.heightAnchor.constraint(equalToConstant: 48),
            
            secundaryActionButton.topAnchor.constraint(equalTo: primaryActionButton.bottomAnchor, constant: 25),
            secundaryActionButton.centerXAnchor.constraint(equalTo: primaryActionButton.centerXAnchor),
            secundaryActionButton.widthAnchor.constraint(equalTo: primaryActionButton.widthAnchor),
            secundaryActionButton.heightAnchor.constraint(equalTo: primaryActionButton.heightAnchor)
            
        ])
    }
}

#Preview {
    CustomView()
}
