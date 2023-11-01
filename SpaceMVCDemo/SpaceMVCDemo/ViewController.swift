//
//  ViewController.swift
//  SpaceMVCDemo
//
//  Created by Hanh Vo on 1/21/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? LaunchCell
        let singleData = vm.getDataAtRow(row: indexPath.row)
        
        cell?.rocket.text = singleData.rocket
        cell?.details.text = singleData.details
        
        return cell!
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    let vm = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        vm.getLaunchData()
        // Do any additional setup after loading the view.
    }


}

