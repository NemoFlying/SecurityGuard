//
//  HomeView.swift
//  SecurityGuard
//
//  Created by mac on 2024/8/25.
//

import SwiftUI

struct HomeView: View {
    var tab:Int = 1
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
            MapView(showMarker: true)
                .tabItem {
                    Image(systemName: "map")
                }
            PersonalView()
                .tabItem {
                    Image(systemName: "person")
                }
        }
    }
}

#Preview {
    HomeView()
}
