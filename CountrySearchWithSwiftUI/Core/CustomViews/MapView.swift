//
//  MapView.swift
//  CountrySearchWithSwiftUI
//
//  Created by Anoop M on 2021-01-15.
//

import SwiftUI
import MapKit

struct AnnotationItem: Identifiable {
    var coordinate: CLLocationCoordinate2D
    let id = UUID()
}
struct MapView: View {
    @State var coordinateRegion: MKCoordinateRegion
    
    var body: some View {
        Map(coordinateRegion: $coordinateRegion, annotationItems: [AnnotationItem(coordinate: CLLocationCoordinate2D(latitude: self.coordinateRegion.center.latitude, longitude: self.coordinateRegion.center.longitude))]) {item in
            MapPin(coordinate: item.coordinate)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinateRegion: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 10.0, longitude: 40.0), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)))
    }
}
