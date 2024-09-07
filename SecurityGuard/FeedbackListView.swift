//
//  FebackListView.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/5.
//

import SwiftUI
import CoreLocation
struct FeedbackListView: View {
    var models:[FeedbackViewModel]
    @State private var selection = 0
//    @State private var isImageFullScreen = false
//    @State private var selectImage:Image = Image(systemName: "bus")
//    @State private var isMapFullScreen = false
//    
//    @State  var showMarker: Bool = true
//    @State  var showSaftyArea:Bool = false
//    @State  var enableCustomLocation:Bool = false
//    @State var newCoordinate2D :CLLocationCoordinate2D?
    
    private var backgoundColor:Color = Color(red: 0.0, green: 0.25, blue: 0.1)
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                VStack{
                    Text("全部")
                        .underline(color: (selection == 0 ? .white:backgoundColor), height: 5,offset: -9)
                        .onTapGesture {
                            selection = 0
                        }
                }
                Spacer()
                VStack{
                    Text("待处理")
                        .underline(color: (selection == 1 ? .white:backgoundColor), height: 5,offset: -9)
                        .onTapGesture {
                            selection = 1
                        }
                }
                Spacer()
                VStack{
                    Text("处理中").underline(color: (selection == 2 ? .white:backgoundColor), height: 5,offset: -9)
                        .onTapGesture {
                            selection = 2
                        }
                }
                Spacer()
                VStack{
                    Text("已处理").underline(color: (selection == 3 ? .white:backgoundColor), height: 5,offset: -9)
                        .onTapGesture {
                            selection = 3
                        }
                }
            }
            .foregroundColor(.white)
            .font(.title2)
            .padding()
            .background(backgoundColor)
            ScrollView(.vertical,showsIndicators: false){
                
                
                if selection == 0{
                    
                    ForEach(models,id: \.self){model in
                        //                if model.feebackHandleStatus = 0{
                        //
                        //                }
                        FeedbackCardView(model: model)
                            .padding([.leading,.trailing])
                    }
                }
                if selection == 1{
                    ForEach(models,id: \.self){model in
                        if model.feebackHandleStatus == 0{
                            FeedbackCardView(model: model)
                                .padding([.leading,.trailing])
                        }
                        
                    }
                }
                
                if selection == 2{
                    ForEach(models,id: \.self){model in
                        if model.feebackHandleStatus == 1{
                            FeedbackCardView(model: model)
                                .padding([.leading,.trailing])
                        }
                        
                    }
                }
                
                if selection == 3{
                    ForEach(models,id: \.self){model in
                        if model.feebackHandleStatus == 2{
                            FeedbackCardView(model: model)
                                .padding([.leading,.trailing])
                        }
                        
                    }
                }
            }
            
            Spacer()
            
        }
   
        
    }
    
    init(models: [FeedbackViewModel]) {
        self.models = models
    }
}

#Preview {
    var models = TestData().FeedbackTestData()
    
    return FeedbackListView(models: models)
}
