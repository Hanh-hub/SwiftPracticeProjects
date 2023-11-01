//
//  ContentView.swift
//  DemoUIKITView
//
//  Created by Hanh Vo on 2/15/23.
//


import SwiftUI
import MapKit
import UIKit

struct DemoUIKITView: View {
    
    @State private var enterText:String = ""
    
    var body: some View {
        VStack{
            Text("Using MapKit In SwiftUI")
            
            TextEditor(fullText: $enterText)
                .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height / 2)
                .background(Color.mint)
                .border(.blue)
                
            HStack {
                
                Text("Total Character = \(enterText.totalCount)")
                    .frame(maxWidth:.infinity)
                    .background(.orange)
                    .padding()
                
            }.padding()
            
                Spacer()
            
        }
    }
}

extension String {
    
    var totalCount: Int {
        
        var finaltext = self.replacingOccurrences(of: " ", with: "")
        finaltext = self.replacingOccurrences(of: "\n", with: "")
        return finaltext.count
    }
    
}

struct DemoUIKITView_Previews: PreviewProvider {
    static var previews: some View {
        DemoUIKITView()
    }
}

struct TextEditor: UIViewRepresentable {
    
    @Binding var fullText:String
    
    typealias UIViewType = UITextView
    
    func makeUIView(context: Context) -> UIViewType {
        let textEditor = UITextView()
        textEditor.font = UIFont.systemFont(ofSize: 24)
        textEditor.isScrollEnabled = true
        textEditor.showsVerticalScrollIndicator = false
        textEditor.textColor = .black
        textEditor.backgroundColor = UIColor.systemMint
        textEditor.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        textEditor.delegate = context.coordinator as any UITextViewDelegate
        
        return textEditor
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }
    
    func makeCoordinator() -> TextEditor.Coordinator {
        Coordinator(self)
    }
    
   final class Coordinator : NSObject, UITextViewDelegate {

        var textEditor:TextEditor

        init(_ textEditor: TextEditor) {
            self.textEditor = textEditor
        }

       func textViewDidChange(_ textView: UITextView) {
           textEditor.fullText = textView.text
       }

    }
}


/*

struct ActivityLoader: UIViewRepresentable {
    
    typealias UIViewType = UIActivityIndicatorView
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        
        let loader = UIActivityIndicatorView()
        loader.tintColor = UIColor.blue
        loader.startAnimating()
        return loader
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) { }
    
}

*/



