//
//  Rectangle.swift
//  CustomInterface
//
//  Created by Aaron Cleveland on 10/14/20.
//

import Foundation
import UIKit

class Rectangle: UIView {
    
    let path = UIBezierPath()

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
     */
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        UIColor.red.set()
        path.lineWidth = 5
        
        path.move(to: CGPoint(x: 100, y: bounds.height / 2))
        path.addLine(to: .init(x: 300, y: bounds.height / 2))
        path.addLine(to: .init(x: 300, y: 100))
        path.addLine(to: .init(x: 100, y: 100))
        path.close()
        
        // allows you to fill the object
        path.fill()
        
        // just allows you to do an outline
        path.stroke()
    }

}
