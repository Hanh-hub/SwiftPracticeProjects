//
//  ContentView.swift
//  Demo2
//
//  Created by Hanh Vo on 2/14/23.
//

import SwiftUI



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PinterestView()
    }
}

struct Pin: Codable, Identifiable {
    let id: String
    let image: ImageData
    
    private enum CodingKeys: String, CodingKey {
        case id
        case image = "images"
    }
    
    struct ImageData: Codable {
        let original: ImageURL
        let small: ImageURL
        
        struct ImageURL: Codable {
            let url: String
            let width: Int
            let height: Int
            
            var aspectRatio: CGFloat {
                CGFloat(width) / CGFloat(height)
            }
        }
        
        var bestImageURL: ImageURL {
            if let bestImage = [original, small].sorted(by: { $0.width > $1.width }).first {
                return bestImage
            } else {
                return original
            }
        }
    }
}

struct PinterestView: View {
    @State private var pins: [Pin] = []
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 200), spacing: 16)], spacing: 16) {
                ForEach(pins) { pin in
                    AsyncImage(url: URL(string: pin.image.bestImageURL.url)) { image in
                        image
                            .resizable()
                            .aspectRatio(pin.image.bestImageURL.aspectRatio, contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(maxWidth: .infinity)
                    .aspectRatio(pin.image.bestImageURL.aspectRatio, contentMode: .fit)
                }
            }
            .padding()
        }
        .task {
            do {
                pins = try await fetchPins()
            } catch {
                print(error)
            }
        }
    }
    
    func fetchPins() async throws -> [Pin] {
        let url = URL(string: "https://api.pinterest.com/v3/pidgets/boards/ilyavedenin1/Apple/pins/")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let response = try decoder.decode(PinterestResponse.self, from: data)
        return response.data.pins
    }
}

struct PinterestResponse: Codable {
    let data: PinterestData
}

struct PinterestData: Codable {
    let pins: [Pin]
}
