//
//  ContentView.swift
//  SecurityGuard
//
//  Created by mac on 2024/8/19.
//

import SwiftUI
import MapKit
struct ContentView: View {
    @State private var locationManager = LocationManager()
    @State private var safeAreaManager = SafeAreaManager()
    @State private var cameraPosition:MapCameraPosition = .userLocation(fallback: .automatic)
    
    
    var body: some View {
        ZStack(alignment: .bottom)
        {
            Map(position:$cameraPosition){
                UserAnnotation()
                MapPolygon(coordinates: safeAreaManager.safeArea)
                    .annotationTitles(.hidden)
                    .annotationTitles(.hidden)
                    .foregroundStyle(.pink.opacity(0.5))
                Marker("A1",coordinate: .init(latitude: 30.582089, longitude: 103.719735))
                
                if(locationManager.IsRecordLocation)
                {
                    MapPolyline(
                        coordinates:locationManager.userLocationTrack
                    ).stroke(.yellow, style: .init(lineWidth: 8))
                }
                MapPolyline(
                    coordinates: .init(
                        arrayLiteral:.init(
                            latitude: 30.789043,
                            longitude: 103.891457
                        ),
                        .init(
                            latitude: 30.789745,
                            longitude: 103.892009
                        )
                    ),contourStyle: .straight
                )
                .stroke(.red, lineWidth: 5)
                
                MapPolyline(coordinates: [
                            CLLocationCoordinate2D(latitude: 30.582488, longitude: 103.719731),
                            CLLocationCoordinate2D(latitude: 30.582111, longitude: 103.719317)],
                                      contourStyle: MapPolyline.ContourStyle.geodesic)
                .stroke(.red, style: .init(lineWidth: 1))
                
                    
            }
            .mapControls{
                HStack{
                    MapUserLocationButton()
                    MapCompass()
                    MapScaleView()
                }
                
            }
            .onAppear(){
                updateCameraPostion()
            }
            
            VStack(alignment:.leading,spacing: 20)
            {
                HStack
                {
                    
                    Button{
                        locationManager.IsRecordLocation.toggle()
                    }label: {
                        if(!locationManager.IsRecordLocation){
                            Image(systemName: "play.circle")
                                .font(.largeTitle)
                                .padding(5)
                        }else{
                            Image(systemName: "pause.circle")
                                .font(.largeTitle)
                                .padding(5)
                        }
                        
                    }
                }
                Text("latitude:\(locationManager.clatitude)")
                Text("longitude:\(locationManager.clongitude)")
            }.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
            
        }
        
        
    }
    func updateCameraPostion(){
        if let userLocation = locationManager.userLocation{
            let userRegion = MKCoordinateRegion(
                center: userLocation.coordinate,
                latitudinalMeters: 0.15,
                longitudinalMeters: 0.15
            )
            withAnimation()
            {
                cameraPosition = .region(userRegion)
            }
        }
    }
}

#Preview {
    ContentView()
}
