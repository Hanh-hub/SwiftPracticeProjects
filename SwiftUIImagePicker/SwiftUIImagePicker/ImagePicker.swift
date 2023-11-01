//
//  ImagePicker.swift
//  SwiftUIImagePicker
//
//  Created by Hanh Vo on 2/15/23.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    var didFinishPicking: (UIImage) -> Void
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(didFinishPicking: didFinishPicking)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var didFinishPicking: (UIImage) -> Void
        
        init(didFinishPicking: @escaping (UIImage) -> Void) {
            self.didFinishPicking = didFinishPicking
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.originalImage] as? UIImage else { return }
            didFinishPicking(image)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            // Handle cancel action if needed
        }
    }
}




