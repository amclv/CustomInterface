//
//  Gradient.swift
//  CustomInterface
//
//  Created by Aaron Cleveland on 10/14/20.
//

import Foundation
import UIKit

class Gradients: UIView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     */
    override func draw(_ rect: CGRect) {
        // 1
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        // 2
        context.saveGState()
        
        // 3
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        // 4
        let startColor = UIColor.red
        guard let startColorComponents = startColor.cgColor.components else { return }
        
        let endColor = UIColor.blue
        guard let endColorComponents = endColor.cgColor.components else { return }
        
        // 5
        let colorComponents: [CGFloat] = [startColorComponents[0],
                                          startColorComponents[1],
                                          startColorComponents[2],
                                          startColorComponents[3],
                                          endColorComponents[0],
                                          endColorComponents[1],
                                          endColorComponents[2],
                                          endColorComponents[3]]
        
        // 6
        let locations:[CGFloat] = [0.0, 1.0]
        
        // 7
        guard let gradient = CGGradient(colorSpace: colorSpace,colorComponents: colorComponents,locations: locations,count: 2) else { return }
        
        let startPoint = CGPoint(x: 0, y: self.bounds.height)
        let endPoint = CGPoint(x: self.bounds.width,y: self.bounds.height)
        
        // 8
        context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: UInt32(0)))
        
        // 9
        context.restoreGState()
        
    }
    
}
