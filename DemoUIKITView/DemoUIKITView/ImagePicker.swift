//
//  ImagePicker.swift
//  DemoUIKITView
//
//  Created by Hanh Vo on 2/15/23.
//

import SwiftUI
import MapKit
import UIKit
import Firebase




struct ImageView: View {
    @State private var selectedImage = UIImage()
    @State private var showSheet = false

    var body: some View {
        
            VStack {
                    Image(uiImage: self.selectedImage)
                  .resizable()
                  .frame(width: 300, height: 300)
                  .background(Color.black.opacity(0.2))
                  .aspectRatio(contentMode: .fit)
                  .padding(.horizontal, 20)
                     
             Text("Change photo")
                 .font(.headline)
                 .frame(maxWidth: .infinity)
                 .frame(height: 50)
                 .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)), Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                 .cornerRadius(16)
                 .foregroundColor(.white)
                     .padding(.horizontal, 20)
                     .onTapGesture {
                       showSheet = true
                     }
                
//            Button(action: {
//                showSheet = true
//            }) {
//                Text("Select Image")
//                    .font(.headline)
//                    .frame(maxWidth: .infinity)
//                    .frame(height: 50)
//                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)), Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))]), startPoint: .top, endPoint: .bottom))
//                    .cornerRadius(16)
//                    .foregroundColor(.white)
//                        .padding(.horizontal, 20)
//            }
                
            }
        .padding(.horizontal, 20)
        .sheet(isPresented: $showSheet) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$selectedImage)
            }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}



struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) private var presentationMode
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var selectedImage: UIImage
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        
    }
    
}
