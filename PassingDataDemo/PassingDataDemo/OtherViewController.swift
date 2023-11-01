//
//  OtherViewController.swift
//  PassingDataDemo
//
//  Created by Hanh Vo on 1/28/23.
//

import UIKit

class OtherViewController: UIViewController {
    @IBOutlet weak var  field: UITextField!
    var completionHandler: ((String)->())?
    
    
    @IBAction func didTapSave(){
        dismiss(animated: true, completion: nil)
        completionHandler?(field.text!)
    }
    
    @IBAction func didNotified() {
        NotificationCenter.default.post(name: Notification.Name("text"), object: field.text)
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
