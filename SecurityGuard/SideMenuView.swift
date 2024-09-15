//
//  SideMenuView.swift
//  SecurityStyle
//
//  Created by 熊何凡 on 2024/9/14.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing :Bool
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.green1, Color.splash]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.keyboard,edges: .bottom).ignoresSafeArea()
            
            VStack{
                SideMenuPerson(isShowing: $isShowing)
                    .frame(height: 240)
                    .padding(.bottom,20)
                ForEach(SideMenuModel.allCases, id: \.self) { option in NavigationLink(destination: Text(option.titlee), label:{ SideMenuListView(viewModel: option)})}
                
                Spacer()
            }
            
        }.navigationBarHidden(true)
    }
}


#Preview {
    SideMenuView(isShowing: .constant(true))
}
