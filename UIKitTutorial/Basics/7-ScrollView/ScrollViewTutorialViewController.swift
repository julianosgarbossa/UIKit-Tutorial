//
//  ScrollViewTutorialViewController.swift
//  UIKitTutorial
//
//  Created by Juliano Sgarbossa on 05/02/25.
//

import UIKit

class ScrollViewTutorialViewController: UIViewController {

    private let rectHeight: CGFloat = 200
    private let numberOfRects: Int = 20
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemCyan
        self.setVisualElements()
        
        for _ in 1..<numberOfRects {
            let rect = createRectangle()
            stackView.addArrangedSubview(rect)
        }
        
        scrollView.contentSize.height = (rectHeight * CGFloat(numberOfRects)) + 64
        
        scrollView.delegate = self
    }
    
    private func createRectangle() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: rectHeight).isActive = true
        view.widthAnchor.constraint(equalToConstant: rectHeight).isActive = true
        view.backgroundColor = .red
        return view
    }
    
    private func setVisualElements() {
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(stackView)
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            stackView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
        ])
    }
}

extension ScrollViewTutorialViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("DEBUG: scroll offset \(scrollView.contentOffset)")
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("DEBUG: quando a rolagem está desacelerando")
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("DEBUG: quando o movimento de arrastar o dedo termina")
    }
}

#Preview {
    ScrollViewTutorialViewController()
}
