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
                
                DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
                Label(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/, systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)

                Button("Get Image") {
                    // Call downloadImageFromServer to download an image
                    downloadImageFromServer { image in
                        // Update the image state with the downloaded image
                        DispatchQueue.main.async {
                            self.image = image
                        }
                    }
                }
            }
        }
    func startDownloadOperation(completion: @escaping (UIImage) -> Void) {
        print("startDownloadOperation continue to run in background")
        // Create a URL for the image to download
        guard let url = URL(string: "https://picsum.photos/200/300") else {
            // Handle invalid URL
            return
        }
        
        // Create a URLSession task to download the image
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
            
            print("Call the completion closure with the downloaded image")
            completion(image)
        }
        
        // Start the download task
        task.resume()
    }

    func downloadImageFromServer(completion: @escaping (UIImage) -> Void) {
        // Start the download operation
        startDownloadOperation { downloadedImage in
            // Call the completion closure with the downloaded image
            completion(downloadedImage)
        }
        print("1) The function returns here, but the closure isn't called until the download operation is completed")
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}

class viewModel{
    
}
