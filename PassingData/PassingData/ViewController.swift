import UIKit

class ViewControllerB: UIViewController {
    let textView = UITextView()
    let sendButton = UIButton()
    var delegate: ViewControllerBDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up text view
        textView.frame = CGRect(x: 20, y: 50, width: view.frame.width - 50, height: 100)
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor.black.cgColor
        view.addSubview(textView)
        
        // Set up send button
        sendButton.frame = CGRect(x: 20, y: textView.frame.maxY + 20, width: view.frame.width - 40, height: 50)
        sendButton.setTitle("Send", for: .normal)
        sendButton.backgroundColor = .blue
        sendButton.addTarget(self, action: #selector(sendButtonPressed), for: .touchUpInside)
        view.addSubview(sendButton)
    }
    
    @objc func sendButtonPressed() {
        delegate?.didTapSendButton(text: textView.text)
        navigationController?.popViewController(animated: true)
    }
}

protocol ViewControllerBDelegate {
    func didTapSendButton(text: String)
}


class ViewControllerA: UIViewController {
    let label = UILabel()
    let moveToBButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up label
        label.frame = CGRect(x: 20, y: 50, width: view.frame.width - 40, height: 100)
        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.black.cgColor
        view.addSubview(label)
        
        // Set up button to move to ViewController B
        moveToBButton.frame = CGRect(x: 20, y: label.frame.maxY + 20, width: view.frame.width - 40, height: 50)
        moveToBButton.setTitle("Go to ViewController B", for: .normal)
        moveToBButton.backgroundColor = .blue
        moveToBButton.addTarget(self, action: #selector(moveToBButtonPressed), for: .touchUpInside)
        view.addSubview(moveToBButton)
    }
    
    @objc func moveToBButtonPressed() {
        let viewControllerB = ViewControllerB()
        viewControllerB.delegate = self
        navigationController?.pushViewController(viewControllerB, animated: true)
    }
}

extension ViewControllerA: ViewControllerBDelegate {
    func didTapSendButton(text: String) {
        label.text = text
    }
}

