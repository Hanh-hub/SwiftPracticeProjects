//
//  ContentView.swift
//  MapkitDemoSwiftUI
//
//  Created by Hanh Vo on 3/3/23.
//
import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var latitude: Double  = 30.525296821413395
    //        let lat = -97.6634235
    var longitude: Double = -97.6634235

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: location, span: span)
        uiView.setRegion(region, animated: true)
    }
}

struct ContentView: View {
    var body: some View {
        MapView(latitude: 30.5093, longitude: -97.6789)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       
            ContentView()
        
        
    }
}
