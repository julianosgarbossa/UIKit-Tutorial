//
//  AnimationTutorialViewController.swift
//  UIKitTutorial
//
//  Created by Juliano Sgarbossa on 08/02/25.
//

import UIKit

class AnimationTutorialViewController: UIViewController {
    
    private var greenView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()
    
    private var labelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setVisualElements()
        self.viewAnimation()
    }
    
    private func setVisualElements() {
        view.addSubview(greenView)
        greenView.addSubview(labelView)
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            greenView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            greenView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            labelView.topAnchor.constraint(equalTo: greenView.topAnchor, constant: 32),
            labelView.leadingAnchor.constraint(equalTo: greenView.leadingAnchor, constant: 32),
            labelView.trailingAnchor.constraint(equalTo: greenView.trailingAnchor, constant: -32),
            labelView.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    // MARK: Posição e Tamanho
    // Bounds: controla o tamanho da área visível de uma view (sem alterar a posição).
    // self.greenView.bounds = CGRect(x: 0, y: 0, width: 200, height: 200)
    
    // Frame: controla a posição e o tamanho da view. Alterar o frame altera bounds e center juntos.
    // self.greenView.frame = CGRect(x: 100, y: 0, width: 200, height: 200)
    
    // Center: anima a posição central da view.
    // self.greenView.center = CGPoint(x: 100, y: 100)
    
    // MARK: Transformação
    // Rotation: rota a view em torno do seu ponto central.
    // self.greenView.transform = CGAffineTransform(rotationAngle: .pi / 4) // Rotação de 45 graus
    
    // Scale: altera o tamanho da view proporcionalmente.
    // self.greenView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5) // 1.5x maior
    
    // Translation: move a view para uma nova posição relativa.
    // self.greenView.transform = CGAffineTransform(translationX: 50, y: 100)
    
    // MARK: Combinação de Transformações
    // Você pode combinar várias transformações.
    // let transform = CGAffineTransform(rotationAngle: .pi / 4).scaledBy(x: 1.2, y: 1.2).translatedBy(x: 50, y: 50)
    // self.greenView.transform = transform
    
    // MARK: Aparência
    // BackgroundColor: altera a cor de fundo da view.
    // self.greenView.backgroundColor = .red
    
    // Alpha: controla a opacidade da view.
    // self.greenView.alpha = 0.5 // 50% transparente
    private func viewAnimation() {
        self.view.layoutIfNeeded()
        self.greenView.transform = CGAffineTransform(translationX: 0, y: greenView.frame.height)
        self.labelView.transform = CGAffineTransform(translationX: -(labelView.frame.width + 32), y: 0)
        UIView.animate(withDuration: 0.5) {
            self.greenView.transform = .identity
            self.view.layoutIfNeeded()
            UIView.animate(withDuration: 0.5, delay: 0.6) {
                self.labelView.transform = .identity
                self.view.layoutIfNeeded()
            }
        }
    }
}

#Preview {
    AnimationTutorialViewController()
}
