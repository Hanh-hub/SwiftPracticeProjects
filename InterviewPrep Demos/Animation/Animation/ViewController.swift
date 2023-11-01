//
//  ViewController.swift
//  Animation
//
//  Created by Hanh Vo on 4/12/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let gifURL = Bundle.main.url(forResource: "gif1", withExtension: "gif"),
           let imageData = try? Data(contentsOf: gifURL),
           let image = UIImage.gifImageWithData(imageData) {
            imageView.image = image
        }
    }
}


extension UIImage {
    static func gifImageWithData(_ data: Data) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else { return nil }
        
        var images = [UIImage]()
        for i in 0..<CGImageSourceGetCount(source) {
            if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                let uiImage = UIImage(cgImage: cgImage)
                images.append(uiImage)
            }
        }
        
        return UIImage.animatedImage(with: images, duration: 4)
    }
}

//CF = core foundation
// CG = core Graphic
