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
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 8
        return stack
    }()
    
    let bounceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("| Bounce |", for: .normal)
        button.addTarget(self, action: #selector(bounceButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let rotateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("| Rotate |", for: .normal)
        button.addTarget(self, action: #selector(rotateButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let squashButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("| Squash |", for: .normal)
        button.addTarget(self, action: #selector(squashButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let keyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("| Key |", for: .normal)
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
        
        buttonHStack.addArrangedSubview(keyButton)
        buttonHStack.addArrangedSubview(squashButton)
        buttonHStack.addArrangedSubview(rotateButton)
        buttonHStack.addArrangedSubview(bounceButton)
        view.addSubview(buttonHStack)
        buttonHStack.anchor(left: view.leftAnchor,
                            bottom: view.safeAreaLayoutGuide.bottomAnchor,
                            right: view.safeAreaLayoutGuide.rightAnchor,
                            paddingBottom: 20)
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
    
    @objc func rotateButtonTapped() {
        UIView.animate(withDuration: 1.0) {
            self.rectanglePath.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        } completion: { (_) in
            UIView.animate(withDuration: 1.0) {
                self.rectanglePath.transform = .identity
            }
        }

    }
    
    @objc func squashButtonTapped() {
        let animationBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: 0.4) {
                self.rectanglePath.center = self.view.center
            }
            UIView.addKeyframe(withRelativeStartTime: 0.3,
                               relativeDuration: 0.2) {
                self.rectanglePath.transform = CGAffineTransform(scaleX: 1.7, y: 0.6)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5,
                               relativeDuration: 0.2) {
                self.rectanglePath.transform = CGAffineTransform(scaleX: 0.6, y: 1.7)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.7,
                               relativeDuration: 0.15) {
                self.rectanglePath.transform = CGAffineTransform(scaleX: 1.11, y: 0.9)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.85,
                               relativeDuration: 0.15) {
                self.rectanglePath.transform = .identity
            }
        }
        
        UIView.animateKeyframes(withDuration: 1.5,
                                delay: 0,
                                options: [],
                                animations: animationBlock,
                                completion: nil)
    }

}

