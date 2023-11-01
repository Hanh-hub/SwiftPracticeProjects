//
//  ViewController.swift
//  SDWebImageDemo
//
//  Created by Hanh Vo on 4/7/23.
//

import UIKit
import SDWebImage
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let url = URL(string: "https://vignette3.wikia.nocookie.net/zelda/images/b/b1/Link_%28SSB_3DS_%26_Wii_U%29.png") {
            imageView.sd_setImage(with: url, placeholderImage: UIImage())
        }
        setupRx()
    }
    private func setupRx() {
          // Handling text changes in UITextField
          textField.rx.text
              .orEmpty
              .bind(to: label.rx.text)
              .disposed(by: disposeBag)

          // Handling button taps
          button.rx.tap
              .subscribe(onNext: { [weak self] in
                  self?.handleButtonTap()
              })
              .disposed(by: disposeBag)
      }
    
    private func handleButtonTap() {
           print("Button tapped")
           // Perform your desired action when the button is tapped
       }

}

