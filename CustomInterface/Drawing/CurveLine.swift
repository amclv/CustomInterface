//
//  CurveLine.swift
//  CustomInterface
//
//  Created by Aaron Cleveland on 10/14/20.
//

import Foundation
import UIKit

class CurveLine: UIView {
    
    let path = UIBezierPath()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        UIColor.black.setStroke()
        path.lineWidth = 5
        
        // adding a line
        path.move(to: CGPoint(x: 10, y: bounds.height / 2))
        
        // we are adding a curve to give it a double curve.
        path.addCurve(to: CGPoint(x: bounds.width - 10, y: bounds.height / 2),
                      controlPoint1: CGPoint(x: bounds.width / 2, y: 600),
                      controlPoint2: CGPoint(x: bounds.width / 2, y: 300))
        path.stroke()
    }
}
