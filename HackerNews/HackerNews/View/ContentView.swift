//
//  ContentView.swift
//  HackerNews
//
//  Created by Hanh Vo on 1/24/23.
//

import SwiftUI

struct ContentView: View {
    @State private var news = [News]()

    var body: some View {
        List(news, id: \.title) { news in
            CustomCell(news: news)
            NavigationLink(destination: DetailedNews(title: news.title!)){


            }
        }.onAppear {
            self.fetchData()
        }
    }
    
    
//    var body: some View {
//           NavigationView {
//               List(items, rowContent: { item in
//                   NavigationLink(destination: DetailedNews(title: item.title!)) {
//                       HStack {
//                           Text(item.title!)
//                           Spacer()
//                           if let items = items, let points = items.points {
//                               Text("\(points) points")
//                           } else {
//                               Text("News object not found or points not found")
//                           }
//
//                       }
//                   }
//               })
//           }
//       }

    func fetchData() {
        let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page")!

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let news = try! JSONDecoder().decode(NewsModel.self, from: data)
                let parsingNews = news.hits
                DispatchQueue.main.async {
                    self.news = parsingNews!
                }
            }
        }.resume()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //MyView()
    }
}
