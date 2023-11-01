//
//  CustomCell.swift
//  HackerNews
//
//  Created by Hanh Vo on 1/24/23.
//

import Foundation
import SwiftUI

struct CustomCell: View {
    let news: News

    var body: some View {
        HStack {
            Text(news.title ?? "No title found")
            Spacer()
            //Text(news.points ?? 0)
            if let news = news, let points = news.points {
                Text("\(points) points")
            } else {
                Text("News object not found or points not found")
            }

        }
    }
}
