//
//  ViewController.swift
//  Pagination
//
//  Created by Hanh Vo on 1/29/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
   
    
    var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tableView
    }()
    
    private var data = [String]()
    
    private let apiCaller = APICaller()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        apiCaller.fetchData(completionHandler: {[weak self] result in
            switch result {
            case .success(let data):
                self?.data.append(contentsOf: data)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            case .failure(_):
                break
            }
        })
    }
    
    private func createSpinnerFooter() ->UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        let spinner = UIActivityIndicatorView()
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        return footerView
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
      
        let position = scrollView.contentOffset.y
        if position > (tableView.contentSize.height-100-scrollView.frame.size.height) {
            //fetch more data
            print("fetchMore")
            //only continue if isPaginating = false, already fetched more data
            guard !apiCaller.isPaginating else {
                return
            }
            
            self.tableView.tableFooterView = createSpinnerFooter()
            apiCaller.fetchData(pagination: true){
                result in
                DispatchQueue.main.async {
                    self.tableView.tableFooterView = nil
                }
                
                switch result {
                case .success(let moreData):
                    self.data.append(contentsOf: moreData)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                case .failure(_):
                    break
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = data[indexPath.row]
        return cell!
    }


}

