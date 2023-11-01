//
//  DetailedNewsView.swift
//  HackerNews
//
//  Created by Hanh Vo on 1/25/23.
//

import UIKit
import SwiftUI

struct DetailedNews: View {
    
    let newsTitle: String
    
    init(title: String = "default title"){
        self.newsTitle = title
    }
    
    var body: some View {
        VStack{
            Text(newsTitle)
                .padding(.all, 30.0)
            Spacer()
            
            Image("Doraemon")
                .frame(width: 100, height: 200)
                .scaledToFit()
        }
    }
}

struct DetailedNews_Previews: PreviewProvider {
    static var previews: some View {
        DetailedNews()
    }
}
