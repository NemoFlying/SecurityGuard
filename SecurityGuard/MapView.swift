//
//  MapView.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/1.
//

import SwiftUI
import MapKit

struct MapView: View {
    //@State private var cameraPosition:MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var cameraPosition:MapCameraPosition = .automatic
    @State private var locationManager = LocationManager()
    @State var showMarker: Bool=true
    @State var mapViewModel : MapViewModel
    init(showMarker: Bool
    ) {
        self.showMarker = showMarker
        self.mapViewModel = MapViewModel(showMarker: showMarker)
        //cameraPosition.region?.span = .init(latitudeDelta: 0.1, longitudeDelta: 0.1)
    }
    var body: some View {
        Map(position: $cameraPosition){
            UserAnnotation()
            Marker("xxx",coordinate: .init(latitude: 0.0, longitude: 0.1))

            //Mark
            if(showMarker==true){
                ForEach(mapViewModel.reMarkLocation ?? [], id: \.self){ marker in
                    Annotation(
                        marker.location_Label ?? "",
                        coordinate: marker.locationCoordinate2D
                    ){
//                        Text(marker.location_Label ?? "")
//                            .font(.caption)
                        
                    }//.annotationTitles(.hidden)
                    MapPolygon(coordinates: marker.rangeLocationCoordinate2D)
                        .annotationTitles(.hidden)
                        .annotationTitles(.hidden)
                        .foregroundStyle(.pink.opacity(0.5))
//                    ForEach(marker.range ?? [], id: \.self){ ran in
//                        MapPolygon(coordinates: safeAreaManager.safeArea)
//                            .annotationTitles(.hidden)
//                            .annotationTitles(.hidden)
//                            .foregroundStyle(.pink.opacity(0.5))
//                    }
                    
                }
            }
//            if(showMarker == true){
//                let marker = mapViewModel.reMarkLocation ?? []
//                
//                ForEach(marker.range ?? [],id: \.self){ ran in
//                    MapPolyline(coordinates: [
//                                CLLocationCoordinate2D(latitude: 30.582488, longitude: 103.719731),
//                                CLLocationCoordinate2D(latitude: 30.582111, longitude: 103.719317)],
//                                          contourStyle: MapPolyline.ContourStyle.geodesic)
//                    .stroke(.red, style: .init(lineWidth: 1))
//                    
//                }
//            }
            
        }
        .onAppear{
            cameraPosition = .region(
                .init(
                    center: .init(
                        latitude: 30.581991,
                        longitude: 103.720088
                    ),
                    span: .init(
                        latitudeDelta: 0.008,
                        longitudeDelta: 0.008
                    )
                )
            )
        }
    }
}

#Preview {
    MapView(showMarker: true)
}
