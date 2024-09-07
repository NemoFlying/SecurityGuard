//
//  FeedbackMapView.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/7.
//

import SwiftUI
import CoreLocation

struct FeedbackMapView: View {
    @State  var showMarker: Bool = true
    @State  var showSaftyArea:Bool = false
    @State  var enableCustomLocation:Bool = false
    @State  var newCoordinate2D :CLLocationCoordinate2D?
    @State  var isShowLocationOnMap:Bool = false
    var mapLocation:CLLocationCoordinate2D
    var body: some View {
        Image(systemName: "mappin.circle")
            .font(.title2)
            .onTapGesture {
                self.isShowLocationOnMap.toggle()
                
            }
            .fullScreenCover(isPresented: $isShowLocationOnMap, content: {
                MapView(
                    showMarker: $showMarker,
                    showSaftyArea: $showSaftyArea,
                    enableCustomLocation: $enableCustomLocation,
                    newCoordinate2D: $newCoordinate2D
                )
                .overlay(
                    Button("关闭"){
                        self.isShowLocationOnMap.toggle()
                    }
                        .background(.blue)
                        .foregroundColor(.white)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 50)
                        .bold()
                        .font(.title2)
                    ,alignment: .topTrailing
                )
            })
            .onAppear{
                newCoordinate2D = mapLocation
            }
    }
}

//#Preview {
//    FeedbackMapView()
//}
