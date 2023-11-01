//
//  ViewController.swift
//  PassingDataWithClosure
//
//  Created by Hanh Vo on 3/13/23.
//

import UIKit

class BViewController: UIViewController {
    var dataClosure: ((String) -> Void)?
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func sendData(_ sender: UIButton) {
        // Get the data from the text field
        let data = textField.text ?? ""
        
        // Call the closure with the data
        dataClosure?(data)
        
        // Dismiss the view controller
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}




class AViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func presentViewControllerB(_ sender: UIButton) {
//        let viewControllerB = BViewController()
//        viewControllerB.dataClosure = { data in
//            // Do something with the data in ViewControllerA
//            print("Received data: \(data)")
//            self.label.text = data
//        }
//        navigationController?.pushViewController(viewControllerB, animated: true)
        //present(viewControllerB, animated: true, completion: nil)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "other") as! BViewController
        vc.dataClosure = {fieldText in
            self.label.text = fieldText
        }
        navigationController?.pushViewController(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
