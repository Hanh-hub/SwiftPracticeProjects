//
//  ViewController.swift
//  ButtonDemo
//
//  Created by Hanh Vo on 1/25/23.
//



import UIKit

class MyViewController: UIViewController {
    
    
    //@IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        let textField = UITextField()
      
        
        button.setTitle("Click me", for: .normal)
        button.backgroundColor = UIColor.green
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        textField.placeholder = "Enter some text"
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        
        view.addSubview(button)
        view.addSubview(textField)
        
        // Add constraints to position the button and text field in the view
        let centerXConstraint = NSLayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        let centerYConstraint = NSLayoutConstraint(item: button, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)

        view.addConstraints([centerXConstraint, centerYConstraint])
        
    }
    
    @objc private func buttonTapped() {
        print("Button tapped")
    }
}


