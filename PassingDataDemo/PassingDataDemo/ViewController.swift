//
//  ViewController.swift
//  PassingDataDemo
//
//  Created by Hanh Vo on 1/28/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label: UILabel!
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification(notification: )), name: Notification.Name("text"), object: nil)
        // Do any additional setup after loading the view.
    }
    
    @objc func didGetNotification(notification: Notification) {
        //let text = notification.object as! String?
        label.text = notification.object as! String?
    }
    
    @IBAction func didTapButton(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "other") as! OtherViewController
        vc.completionHandler = {fieldText in
            self.label.text = fieldText
        }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }
   
    


}

