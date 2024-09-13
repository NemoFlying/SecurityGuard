//
//  HomeView.swift
//  SecurityGuard
//
//  Created by mac on 2024/8/25.
//

import SwiftUI
import CoreLocation
struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    var tab:Int = 1
    @State var newCoordinate2D :CLLocationCoordinate2D?
    @State  var showMarker: Bool = true
    @State  var showSaftyArea:Bool = true
    @State  var enableCustomLocation:Bool = true
    var body: some View {
        TabView(){
            NavigationView()
                .tabItem {
                    Image(systemName: "house")
                }
            
            FeedbackView()
                .tabItem {
                    Image(systemName: "contextualmenu.and.cursorarrow")
                }
           
            MapView(
                showMarker: $showMarker,
                showSaftyArea: $showSaftyArea,
                enableCustomLocation: $enableCustomLocation,
                newCoordinate2D: $newCoordinate2D
            )
                .tabItem {
                    Image(systemName: "map")
                }
            PersonalView()
                .tabItem {
                    Image(systemName: "person")
                }
        }.onAppear{
            //let login = UserViewModel();
            //login.Login()
        }
//        .fullScreenCover(isPresented: $viewModel.needLogin,
//                          content: {
//             LoginView()
//         })
        
    }
}

#Preview {
    HomeView()
}
