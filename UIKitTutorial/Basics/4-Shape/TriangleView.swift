//
//  TriangleView.swift
//  UIKitTutorial
//
//  Created by Juliano Sgarbossa on 04/02/25.
//

import UIKit

class TriangleView: UIView {
    
    var fillColor: UIColor = .white {
        didSet { setNeedsDisplay() }
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        // Definição dos três pontos do triângulo
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.width / 2, y: 0)) // Topo do triângulo
        path.addLine(to: CGPoint(x: 0, y: rect.height)) // Canto inferior esquerdo
        path.addLine(to: CGPoint(x: rect.width, y: rect.height)) // Canto inferior direito
        path.close()
        
        // Configuração da cor de preenchimento
        context.setFillColor(fillColor.cgColor)
        context.addPath(path.cgPath)
        context.fillPath()
    }
}

#Preview {
    TriangleView()
}
