//
//  ProductViewController.swift
//  SDWebImageDemo
//
//  Created by Hanh Vo on 4/10/23.
//


import UIKit
import SDWebImage
import RxSwift
import RxCocoa
import Alamofire

class ProductViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let bag = DisposeBag()
    private let viewModel = ViewModel()
    private let destinationVC = BehaviorRelay<UIViewController?>(value: nil)
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rx.setDelegate(self).disposed(by: bag)
        
        bindTableView()
        
        
        
    }
    
    private func bindTableView() {

        viewModel.items.bind(to: tableView.rx.items(cellIdentifier: "ProductTableViewCell", cellType: ProductTableViewCell.self)) { (row,item,cell) in
            cell.product = item
        }.disposed(by: bag)
        viewModel.getData()
        
        tableView.rx.modelSelected(Product.self).subscribe(onNext: {[weak self] product in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
                detailVC.product = product
                self?.navigationController?.pushViewController(detailVC, animated: true)
            } else {
                fatalError("no detail vc found")
            }
        })
        .disposed(by: bag)
    }
}

//        tableView.rx.modelSelected(Product.self).subscribe(onNext: { item in
//            print("SelectedItem: \(String(describing: item.title))")
//
//        }).disposed(by: bag)
extension ProductViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
