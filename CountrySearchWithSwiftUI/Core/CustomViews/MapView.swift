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
    var coordinate: CLLocationCoordinate2D
    @State private var coordinateRegion = MKCoordinateRegion()

    var body: some View {
        Map(coordinateRegion: $coordinateRegion, annotationItems: [AnnotationItem(coordinate: CLLocationCoordinate2D(latitude: self.coordinateRegion.center.latitude, longitude: self.coordinateRegion.center.longitude))]) { (item) in
            MapPin(coordinate: item.coordinate)
        }
        .onAppear {
            setRegion(coordinate)
        }
    }

    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        coordinateRegion = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 20.0, longitudeDelta: 20.0)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 10.0, longitude: 40.0))
    }
}
