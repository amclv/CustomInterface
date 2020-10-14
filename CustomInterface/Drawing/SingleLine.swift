//
//  SingleLine.swift
//  CustomInterface
//
//  Created by Aaron Cleveland on 10/14/20.
//

import Foundation
import UIKit

class SingleLine: UIView {
    
    let line = UIBezierPath()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        UIColor.red.setStroke()
        line.lineWidth = 5
        
        line.move(to: CGPoint(x: 0, y: bounds.height / 2))
        line.addLine(to: .init(x: bounds.width, y: bounds.height / 2))
        line.stroke()
    }
}
