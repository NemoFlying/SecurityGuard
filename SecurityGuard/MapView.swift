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
    var showMarker: Bool = false
    var showSaftyArea: Bool = false
    var enableCustomLocation: Bool = false
    @State var mapViewModel : MapViewModel?
    @Binding var newCoordinate2D :CLLocationCoordinate2D?
    var body: some View {
        ZStack(alignment: .topTrailing){
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
                                if(marker.safetyLevel == "red"){
                                    MapPolygon(coordinates: marker.rangeLocationCoordinate2D)
                                        .annotationTitles(.hidden)
                                        .annotationTitles(.hidden)
                                        .foregroundStyle(.pink.opacity(0.5))
                                }
                                else if(marker.safetyLevel == "green"){
                                    MapPolygon(coordinates: marker.rangeLocationCoordinate2D)
                                        .annotationTitles(.hidden)
                                        .annotationTitles(.hidden)
                                        .foregroundStyle(.green.opacity(0.5))
                                }else{
                                    MapPolygon(coordinates: marker.rangeLocationCoordinate2D)
                                        .annotationTitles(.hidden)
                                        .annotationTitles(.hidden)
                                        .foregroundStyle(.yellow.opacity(0.5))
                                }
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
            
            HStack(){
                Text("低")
                    .foregroundStyle(.white)
                    .padding([.leading,.trailing],8)
                    .background(.green)
                Text("中")
                    .foregroundStyle(.white)
                    .padding([.leading,.trailing],8)
                    .background(.yellow)
                Text("高")
                    .foregroundStyle(.white)
                    .padding([.leading,.trailing],8)
                    .background(.pink)
            }.padding([.leading],50)
                .padding([.top,.trailing],10)
        }
    }
}
