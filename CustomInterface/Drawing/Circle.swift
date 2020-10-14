//
//  Circle.swift
//  CustomInterface
//
//  Created by Aaron Cleveland on 10/14/20.
//

import Foundation
import UIKit

class Circle: UIView {
    
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
        // Get the graphics context
        if let context = UIGraphicsGetCurrentContext() {
            
            // Set the circle outerline-width
            context.setLineWidth(5.0)
            
            // Set the circle outerline=color
            UIColor.systemPink.set()
            
            // Create circle
            let center = CGPoint(x: frame.size.width / 2,
                                 y: frame.size.height / 2)
            let radius = (frame.size.width - 200) / 2
            context.addArc(center: center, radius: radius, startAngle: 0.0, endAngle: .pi * 2.0, clockwise: true)
            
            // Draw
            context.fillPath()
//            context.strokePath()
        }
    }

}
