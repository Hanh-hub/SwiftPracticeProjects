//
//  ViewController.swift
//  MemoryLeakDemo
//
//  Created by Hanh Vo on 1/29/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        let button = UIButton()
        button.setTitle("Tap me", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 20
        button.center = view.center
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        
        view.addSubview(button)
        
        // Do any additional setup after loading the view.
    }
    @objc func didTapButton(){
        let vc = SecondVC()
        present(vc, animated: true)
        
    }


}

class MyView: UIView {
    
    weak var vc: UIViewController?
    
    init(vc: UIViewController){
        self.vc = vc
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class SecondVC: UIViewController {
    var myView: MyView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        myView = MyView(vc: self)
    }
}

// reference to MyView: SecondVC
//reference to secondVC: MyView

//SecondVC referenced to MyView  thru myView
// MyView reference to SecondVC thru vc
