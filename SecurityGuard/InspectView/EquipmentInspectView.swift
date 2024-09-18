//
//  EquipmentInspectView.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/8.
//

import SwiftUI
import CoreLocation
import MapKit

struct EquipmentInspectView: View {
    @State private var locationManager = LocationManager()
    @ObservedObject var vmodel:InspectViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var selectedSafeLevels = ["高","中","低"]
    @State var selectedSafeLevel:Int = 0
    @State var curentLocation:CLLocationCoordinate2D?
    @State var cameraPosition:MapCameraPosition?
    let baseColor = Color(red: 76/255, green: 134/255, blue: 110/255)
    var body: some View {
        VStack{
            ZStack(alignment:.topLeading){
                Text("\(vmodel.model.inspectTitle)")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: .infinity)
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                    }
            }
            HStack{
                Text("巡检单号:\(vmodel.model.inspectId)")
                Spacer()
                Text("\(vmodel.model.inspectDeadLineDate)")
            }
        }
        .padding()
        .background(baseColor)
        .foregroundColor(.white)
        .bold()
        VStack{
            
            HStack{
                Text("巡检内容")
                Spacer()
                Text("结果")
            }.font(.title2)
                .bold()
                .padding([.bottom])
                .underline(color: Color(.systemGray2),height:3)
            
            ScrollView(.vertical,showsIndicators: false){
                ForEach(0..<vmodel.model.items.count,id:\.self){ index in
                    let item = vmodel.model.items[index]
                    if(item.inspectItemType)==0{
                        HStack{
                            Text("\(item.inspectItemName)")
                            Spacer()
                            TextField("", text: $vmodel.model.items[index].inspectItemStringValue)
                                .frame(width: 80)
                                .border(Color.black)
                        }
                        .font(.title2)
                        .onTapGesture {
                            hideKeybord()
                        }
                    }
                    else if(item.inspectItemType == 1){
                        SelectedView(
                            showTitle: "\(item.inspectItemName)",
                            selectedItems: $vmodel.model.items[index].inspectItemSelectValues,
                            selectedValue: $vmodel.model.items[index].inspectItemIntValue
                        )
                    }
                }
                
                VStack(alignment: .leading)
                {
                    Text("其它问题记录").font(.title2)
                    ZStack(alignment: .leading){
                        TextEditor(text: $vmodel.model.inspectOtherQuestions)
                            .padding()
                        if vmodel.model.inspectOtherQuestions.isEmpty{
                            Text("请输入内容")
                                .foregroundColor(Color(UIColor.placeholderText))
                                .padding(25)
                        }
                    }.overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(UIColor.placeholderText),lineWidth: 1)
                    }.padding(1)
                        .frame(height: 150)
                }.padding([.top],1)
                .onTapGesture {
                    hideKeybord()
                }
                
                if let cameraPosition = cameraPosition{
                    MapView(cameraPosition: cameraPosition, newCoordinate2D: $locationManager.lastLocation)
                        .frame(height: 200)
                }
                
                HStack{
                    Button(action: {
                        locationManager.getCurrentLocation()
                        vmodel.model.inspectClockLocations=[]
                        vmodel.model.inspectClockLocations.append(locationManager.clatitude)
                        vmodel.model.inspectClockLocations.append(locationManager.clongitude)
                        cameraPosition = .region(
                            .init(
                                center: .init(
                                    latitude: locationManager.clatitude,
                                    longitude: locationManager.clongitude
                                ),
                                span: .init(
                                    latitudeDelta: 0.008,
                                    longitudeDelta: 0.008
                                )
                            )
                        )
                    },
                           label: {
                        Text("获取当前定位")
                            .font(.title2)
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                            .background(.red)
                            .cornerRadius(18)
                        
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        vmodel.Update()
                        //presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text(vmodel.httpRequestStatus == 1 ? "保存中":(vmodel.httpRequestStatus == 2 ? "已保存":"保存"))
                            .font(.title2)
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                            .background(baseColor)
                            .cornerRadius(18)
                        
                    })
                }.padding()
            }
            .padding()
            
            // Spacer()
            
        }
        .alert(isPresented: $vmodel.showAlter){
            if vmodel.httpRequestStatus == 2{
                Alert(title: Text("保存成功"),message: Text(""))
            }else{
                Alert(title: Text("保存失败"),message: Text("\(vmodel.alterMsg)"))
            }
        }
    }
}
#Preview {
    let model = TestData().InspectTestData()[2]
    return EquipmentInspectView(vmodel: model)
}
