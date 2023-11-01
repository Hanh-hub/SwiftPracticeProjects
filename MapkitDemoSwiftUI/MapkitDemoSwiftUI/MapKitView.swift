////
////  MapKitView.swift
////  MapkitDemoSwiftUI
////
////  Created by Hanh Vo on 3/3/23.
////
//
//import SwiftUI
//import MapKit
//import Foundation
//import UIKit
//
//
//struct MapView: UIViewRepresentable {
//    typealias UIViewType = UIView
//    
//    func makeUIView(context: Context) -> UIView {
//        let view = UIView()
//        //30.525296821413395, -97.6634235
//        let long = 30.525296821413395
//        let lat = -97.6634235
//        
//        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
//        let coordinateSpan = MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)
//        let coordinateRegion = MKCoordinateRegion(center: coordinate, span: coordinateSpan)
//        let mapView = MKMapView(frame: .zero)
//        
//        mapView.setRegion(coordinateRegion, animated: true)
//        view.addSubview(mapView)
//        
//        mapView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//        mapView.widthAnchor.constraint (equalTo: view.widthAnchor),
//        mapView.heightAnchor.constraint (equalTo: view.heightAnchor),
//        mapView.centerXAnchor.constraint (equalTo: view.centerXAnchor),
//        mapView.centerYAnchor.constraint (equalTo: view.centerYAnchor)
//        ])
//        
//        return view
//    }
//    
//    func updateUIView(_ uiView: UIView, context: Context) {
//        // do nothing
//        
//        
//    }
//    
//    
//     
//    
//    
//     
//}
