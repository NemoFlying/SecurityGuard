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
    @Binding  var showMarker: Bool
    @Binding  var showSaftyArea:Bool
    @Binding  var enableCustomLocation:Bool
    @State var mapViewModel : MapViewModel?
    @Binding var newCoordinate2D :CLLocationCoordinate2D?
    
//    init(showMarker: Bool, showSaftyArea:Bool,enableCustomLocation:Bool
//    ) {
//        self.showMarker = showMarker
//        self.showSaftyArea = showSaftyArea
//        self.enableCustomLocation = enableCustomLocation
//        self.mapViewModel = MapViewModel(showMarker: showMarker)
//        //cameraPosition.region?.span = .init(latitudeDelta: 0.1, longitudeDelta: 0.1)
//    }
    var body: some View {
        MapReader{ proxy in
            Map(position: $cameraPosition){
                UserAnnotation()
                Marker("xxx",coordinate: .init(latitude: 0.0, longitude: 0.1))
                
                //Mark
                if(showMarker==true){
                    ForEach(mapViewModel?.reMarkLocation ?? [], id: \.self){ marker in
                        Annotation(
                            marker.location_Label ?? "",
                            coordinate: marker.locationCoordinate2D
                        ){
                        }//.annotationTitles(.hidden)
                        
                        //安全区域设定
                        if(showSaftyArea)
                        {
                            MapPolygon(coordinates: marker.rangeLocationCoordinate2D)
                                .annotationTitles(.hidden)
                                .annotationTitles(.hidden)
                                .foregroundStyle(.pink.opacity(0.5))
                        }
                        
                    }
                }
                
                //customer Mark
                if let newMark = newCoordinate2D{
                    Marker("xxxx",coordinate: newMark)
                }
                
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
                mapViewModel = MapViewModel(showMarker: showMarker)
            }
            .onTapGesture { postion in
                if(enableCustomLocation){
                    newCoordinate2D = proxy.convert(postion,from:.local)
                }
            }
        }
    }
}

//#Preview {
//    @State var newCoordinate2D1 :CLLocationCoordinate2D?
//    @State  var showMarker1: Bool = true
//    @State  var showSaftyArea1:Bool = true
//    @State  var enableCustomLocation1:Bool = true
//    var mapView = MapView(
//        showMarker: $showMarker1,
//        showSaftyArea: $showSaftyArea1,
//        enableCustomLocation: $enableCustomLocation1,
//        newCoordinate2D: $newCoordinate2D1
//    )
//}
