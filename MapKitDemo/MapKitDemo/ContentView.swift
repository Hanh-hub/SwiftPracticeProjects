//
//  ContentView.swift
//  MapKitDemo
//
//  Created by Hanh Vo on 2/17/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
   // @State private var directions = [String]()
    var body: some View {
        MapkitView()
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MapkitView: UIViewRepresentable {
    
    //typealias UIViewType = MKMapView

    
    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator(self)
    }
    
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let startingPoint = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 40.711673, longitude: -74.007099))
        let endingPoint = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 40.713652, longitude: -74.005162))
        
        let startingPointAnnotation = MKPointAnnotation()
        startingPointAnnotation.title = "A"
        startingPointAnnotation.subtitle = "Hello staring point"
        
        
        if let location = startingPoint.location {
            startingPointAnnotation.coordinate = location.coordinate
        }
        
        let endingPointAnnotation = MKPointAnnotation()
        endingPointAnnotation.title = "B"
        endingPointAnnotation.subtitle = "Good bye"
        
        
        if let location = endingPoint.location {
            endingPointAnnotation.coordinate = location.coordinate
        }
        uiView.addAnnotations([startingPointAnnotation, endingPointAnnotation])
        
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = MKMapItem(placemark: startingPoint)
        directionRequest.destination = MKMapItem(placemark: endingPoint)
        directionRequest.transportType = .automobile
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate{response, error in
            guard let response = response else {
                if let error = error {
                    print("Error", error)
                }
                return}
            let route = response.routes[0]
            let region = MKCoordinateRegion(
                center: route.polyline.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            uiView.setRegion(region, animated: true)
            uiView.addOverlay(route.polyline, level: .aboveRoads)
        }
    }
    
    class MapViewCoordinator: NSObject, MKMapViewDelegate {
        
        var parent: MapkitView
        
        init(_ parent: MapkitView){
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
            for view in views {
                if let annotationView = view as? MKMarkerAnnotationView {
                    annotationView.markerTintColor = .yellow // Set
                }
            }
        }

        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let identifier = "pin"
            
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil{
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                //annotationView?.backgroundColor = .cyan
            }
            
            else {
                annotationView?.annotation = annotation
            }
            return annotationView
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            
            if let polylineOverlay = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(overlay: polylineOverlay)
                renderer.strokeColor = .blue
                renderer.lineWidth = 5
                return renderer
            }

            return MKOverlayRenderer(overlay: overlay)
        }
        
        
    }
}
