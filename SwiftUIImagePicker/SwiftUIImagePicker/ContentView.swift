//
//  ContentView.swift
//  SwiftUIImagePicker
//
//  Created by Hanh Vo on 2/15/23.
//

import SwiftUI
import MapKit
import UIKit


//struct ContentView: View {
//
//    @State private var showingImagePicker = false
//    @State private var selectedImage: Image?
//
//    var body: some View {
//        VStack {
//            if selectedImage != nil {
//                selectedImage!
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//            } else {
//                Text("Select an image")
//            }
//
//            Button("Select Image") {
//                showingImagePicker = true
//            }
//            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
//                ImagePicker { image in
//                    selectedImage = Image(uiImage: image)
//                }
//            }
//        }
//    }
//
//    func loadImage() {
//        // Load an image if needed
//    }
//}

struct ContentView: View {
    @State private var selectedImage: Image?
    @State private var isShowingImagePicker = false
    
    var body: some View {
        VStack {
            
            
            Button(action: {
                isShowingImagePicker = true
            }) {
                Text("Select Image")
            }
            .sheet(isPresented: $isShowingImagePicker) {
                ImagePicker(didFinishPicking: { image in
                    selectedImage = Image(uiImage: image)
                })
            }
            
            if let image = selectedImage {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
