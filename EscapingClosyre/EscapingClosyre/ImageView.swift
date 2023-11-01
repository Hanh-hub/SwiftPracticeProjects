//
//  ImageView.swift
//  ScrollView
//
//  Created by Hanh Vo on 3/10/23.
//

import SwiftUI
import UIKit

struct ImageView: View {
    @State private var image: UIImage? = nil
        
        var body: some View {
            VStack {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
                
                Button("Get Image") {
                    // Call downloadImageFromServer to download an image
                    downloadImageFromServer { image in
                        
                        DispatchQueue.main.async {
                            print("DispatchQueue Update the image state with the downloaded image")
                            self.image = image
                        }
                    }
                }
            }
        }
    func startDownloadOperation(completion: @escaping (UIImage) -> Void) {
        print(" 1) Inside the startDownloadOperation")
        // Create a URL for the image to download
        guard let url = URL(string: "https://picsum.photos/200/300") else {
            // Handle invalid URL
            return
        }
        
        // Create a URLSession task to download the image
        print("2) Create URL session and invoke the closure inside url session ")
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Check for errors
            guard let data = data, error == nil else {
                // Handle errors
                return
            }
            
            // Create an UIImage from the downloaded data
            guard let image = UIImage(data: data) else {
                // Handle invalid image data
                return
            }
            
            print("6) : Capture the image return from url")
            completion(image)
        }
        
        
        task.resume()
        print(" 3 urlSession is resumed")
    }

    func downloadImageFromServer(completion: @escaping (UIImage) -> Void) {
        print("0) Start the download Image from server function calling the startDownload operation and invoke the closure that take in a UIImage and return void inside the start download operation ")
        startDownloadOperation { downloadedImage in
            print("7) Inside downloadFrom server invoking the closure from the url")
            completion(downloadedImage)
        }
        print(" 5) Download Image function returns here, but the closure of the downloadImage from server isn't called until the download operation is completed")
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}

class viewModel{
    
}
