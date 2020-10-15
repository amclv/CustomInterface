//
//  ViewController.swift
//  CustomInterface
//
//  Created by Aaron Cleveland on 10/14/20.
//

import UIKit

class ViewController: UIViewController {
    
    let singleLine = SingleLine()
    let curveLine = CurveLine()
    let circlePath = Circle()
    let rectanglePath = Rectangle()
    let gradients = Gradients()
    
    let buttonHStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        return stack
    }()
    
    let bounceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Bounce", for: .normal)
        button.addTarget(self, action: #selector(bounceButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let rotateButton: UIButton = {
        let button = UIButton(type: .system)
        
        return button
    }()
    
    let sprintButton: UIButton = {
        let button = UIButton(type: .system)
        
        return button
    }()
    
    let keyButton: UIButton = {
        let button = UIButton(type: .system)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()
    }
    
    func configureUI() {
//        showSingleLine()
//        showCurveLine()
//        showCirclePath()
        showRectanglePath()
//        showGradients()
        
        buttonHStack.addArrangedSubview(bounceButton)
        view.addSubview(buttonHStack)
        buttonHStack.anchor(left: view.leftAnchor,
                            bottom: view.safeAreaLayoutGuide.bottomAnchor,
                            right: view.rightAnchor)
    }
    
    private func showSingleLine() {
        view.addSubview(singleLine)
        singleLine.addConstraintsToFillView(view)
    }
    
    private func showCurveLine() {
        view.addSubview(curveLine)
        curveLine.addConstraintsToFillView(view)
    }
    
    private func showCirclePath() {
        view.addSubview(circlePath)
        circlePath.addConstraintsToFillView(view)
    }
    
    private func showRectanglePath() {
        view.addSubview(rectanglePath)
        rectanglePath.addConstraintsToFillView(view)
    }
    
    private func showGradients() {
        view.addSubview(gradients)
        gradients.addConstraintsToFillView(view)
    }
    
    // MARK: - Actions
    @objc func bounceButtonTapped() {
        rectanglePath.transform = CGAffineTransform(scaleX: 0.00005, y: 0.00005)
        UIView.animate(withDuration: 3.0,
                       delay: 0,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {
                        self.rectanglePath.transform = .identity
                       }, completion: nil)
    }

}

