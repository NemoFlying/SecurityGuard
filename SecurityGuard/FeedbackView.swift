//
//  FeedbackView.swift
//  SecurityGuard
//
//  Created by mac on 2024/8/25.
//

import SwiftUI
import CoreLocation
struct FeedbackView: View {
    @State private var isImagePickerPresented = false
    @State private var selectedImage: UIImage?
    
    @State var newCoordinate2D :CLLocationCoordinate2D?
    @State  var showMarker: Bool = true
    @State  var showSaftyArea:Bool = false
    @State  var enableCustomLocation:Bool = true
    @State  var showMap:Bool = false
    var body: some View {
        Form{
            Section(header: Text("问题反馈").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold())
            {
                Text("反馈标题").font(.title2)
                Text(String(newCoordinate2D?.latitude ?? 0))
                Text(String(newCoordinate2D?.longitude ?? 0))
                Button(action:{
                    self.showMap.toggle()
                }){
                    Image(systemName: "mappin")
                }
                
            }
        }.sheet(isPresented: $showMap){
            MapView(
                showMarker: $showMarker,
                showSaftyArea: $showSaftyArea,
                enableCustomLocation: $enableCustomLocation,
                newCoordinate2D: $newCoordinate2D
            ).ignoresSafeArea()
        }
        
//            VStack {
//            
//                
//                
//                
//                
//                
//                
//                
//                if let selectedImage = selectedImage {
//                    Image(uiImage: selectedImage)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 300, height: 300)
//                } else {
//                    Text("No Image Selected")
//                        .frame(width: 300, height: 300)
//                        .background(Color.gray)
//                }
//                
//                Button(action: {
//                    isImagePickerPresented = true
//                }) {
//                    Text("Take Photo")
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//                .padding()
//            }
//            .sheet(isPresented: $isImagePickerPresented) {
//                ImagePicker(selectedImage: $selectedImage)
//                    .ignoresSafeArea()
//            }

    }
}

#Preview {
    FeedbackView()
}
