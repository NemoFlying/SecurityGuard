//
//  MapView1.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/15.
//

import SwiftUI

import SwiftUI
import MapKit

struct MapView1: View {
    //@State private var cameraPosition:MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var cameraPosition:MapCameraPosition = .automatic
    @State private var locationManager = LocationManager()
    @Binding  var showMarker: Bool
    @Binding  var showSaftyArea:Bool
    @Binding  var enableCustomLocation:Bool
    @State var mapViewModel : MapViewModel?
    @Binding var newCoordinate2D :CLLocationCoordinate2D?
    var body: some View {
        ZStack(alignment: .bottomLeading){
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
                Text("低风险")
                    .foregroundStyle(.white)
                    .padding([.leading,.trailing],8)
                    .padding([.top,.bottom],3)
                    .background(.green)
                Text("中风险")
                    .foregroundStyle(.white)
                    .padding([.leading,.trailing],8)
                    .padding([.top,.bottom],3)
                    .background(.yellow)
                Text("高风险")
                    .foregroundStyle(.white)
                    .padding([.leading,.trailing],8)
                    .padding([.top,.bottom],3)
                    .background(.pink)
            }.padding()
        }
    }
}
