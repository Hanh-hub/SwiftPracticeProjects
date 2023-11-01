//
//  ContentView.swift
//  mapkitdemo2
//
//  Created by Hanh Vo on 2/17/23.
//



import SwiftUI
import MapKit

struct ContentView: View {
    
    var body: some View {
        MapView(point1: CLLocationCoordinate2D(latitude: 40.711673, longitude: -74.007099), point2: CLLocationCoordinate2D(latitude: 40.713652, longitude: -74.005162))
            .frame(height: 300)
    }
}

    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    
struct MapView: UIViewRepresentable {
    var point1: CLLocationCoordinate2D
    var point2: CLLocationCoordinate2D

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        let sourceLocation = point1
        let destinationLocation = point2

        let sourcePlacemark = MKPlacemark(coordinate: sourceLocation)
        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation)

        let sourceAnnotation = MKPointAnnotation()
        sourceAnnotation.title = "Source"
        
        if let location = sourcePlacemark.location {
            sourceAnnotation.coordinate = location.coordinate
        }

        let destinationAnnotation = MKPointAnnotation()
        destinationAnnotation.title = "Destination"
        if let location = destinationPlacemark.location {
            destinationAnnotation.coordinate = location.coordinate
        }

        view.addAnnotations([sourceAnnotation, destinationAnnotation])

        let directionRequest = MKDirections.Request()
        directionRequest.source = MKMapItem(placemark: sourcePlacemark)
        directionRequest.destination = MKMapItem(placemark: destinationPlacemark)
        directionRequest.transportType = .automobile

        let directions = MKDirections(request: directionRequest)
        directions.calculate { response, error in
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }

            let route = response.routes[0]
            view.addOverlay(route.polyline, level: .aboveRoads)

            let region = MKCoordinateRegion(center: route.polyline.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            view.setRegion(region, animated: true)
        }
    }
}
