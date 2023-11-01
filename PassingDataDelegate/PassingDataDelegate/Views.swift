//
//  Views.swift
//  PassingDataDelegate
//
//  Created by Hanh Vo on 3/13/23.
//

import Foundation
import UIKit



class ViewB: UIView {
    let textView = UITextView()
    let sendButton = UIButton()
    var delegate: ViewBDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Set up text view
        textView.frame = CGRect(x: 20, y: 50, width: frame.width - 40, height: 100)
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor.black.cgColor
        addSubview(textView)
        
        // Set up send button
        sendButton.frame = CGRect(x: 20, y: textView.frame.maxY + 20, width: frame.width - 40, height: 50)
        sendButton.setTitle("Send", for: .normal)
        sendButton.backgroundColor = .blue
        sendButton.addTarget(self, action: #selector(sendButtonPressed), for: .touchUpInside)
        addSubview(sendButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func sendButtonPressed() {
        delegate?.didTapSendButton(text: textView.text)
        
        
    }
}

protocol ViewBDelegate {
    func didTapSendButton(text: String)
    func didTapCancelButton()
}



class ViewA: UIView {
    let label = UILabel()
    let moveToBButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Set up label
        label.frame = CGRect(x: 20, y: 50, width: frame.width - 40, height: 100)
        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.black.cgColor
        addSubview(label)
        
        // Set up button to move to View B
        moveToBButton.frame = CGRect(x: 20, y: label.frame.maxY + 20, width: frame.width - 40, height: 50)
        moveToBButton.setTitle("Go to View B", for: .normal)
        moveToBButton.backgroundColor = .blue
        moveToBButton.addTarget(self, action: #selector(moveToBButtonPressed), for: .touchUpInside)
        addSubview(moveToBButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func moveToBButtonPressed() {
        let viewB = ViewB(frame: frame)
        viewB.delegate = self
        superview?.addSubview(viewB)
        removeFromSuperview()
    }
}

extension ViewA: ViewBDelegate {
    func didTapCancelButton() {
        let viewB = ViewB(frame: frame)
        viewB.removeFromSuperview()
    
    }
    
    func didTapSendButton(text: String) {
        label.text = text
    }
}
