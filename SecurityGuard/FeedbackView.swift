//
//  FeedbackView.swift
//  SecurityGuard
//
//  Created by mac on 2024/8/25.
//

import SwiftUI
import CoreLocation
struct FeedbackView: View {
    
    private var viewModel:FeedbackViewModel = FeedbackViewModel()
    
    @State private var isImagePickerPresented = false
    @State private var selectedImage: UIImage?
    
    @State var newCoordinate2D :CLLocationCoordinate2D?
    @State  var showMarker: Bool = true
    @State  var showSaftyArea:Bool = false
    @State  var enableCustomLocation:Bool = true
    @State  var showMap:Bool = false
    
    @State var showErrorMsg = false
    @State var errorMsg = ""
    
    //form
    @State var feebackTitle:String=""
    private var selectedCategorys = ["AAAAAA","BBBBB","CCCCCC","DDDDDD"]
    @State var selectedCategory:Int = 0
    @State var feebackDetail = ""
    var body: some View {
        Form{
            Section(header: Text("问题反馈").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold())
            {
                VStack(alignment: .leading){
                    HStack{
                        Text("反馈标题").font(.title2)
                        Image(systemName: "star.fill")
                            .foregroundColor(.red)
                            .font(.system(size:10))
                    }
                    TextField("控制在15个字内",text: $feebackTitle)
                }.onTapGesture {
                    hideKeybord()
                }
                
                Picker("反馈类别", selection: $selectedCategory){
                    ForEach(0 ..< selectedCategorys.count, id:\.self){
                        Text(self.selectedCategorys[$0])
                    }
                }.pickerStyle(.menu)
                    .font(.title2)
                    .onTapGesture {
                        hideKeybord()
                    }
                
                HStack{
                    Text("问题位置").font(.title2)
                    Spacer()
                    Button(action:{
                        self.showMap.toggle()
                    }){
                        Image(systemName: "mappin")
                    }
                }
                .sheet(isPresented: $showMap){
                    MapView(
                        showMarker: $showMarker,
                        showSaftyArea: $showSaftyArea,
                        enableCustomLocation: $enableCustomLocation,
                        newCoordinate2D: $newCoordinate2D
                    )
                    .overlay(
                        Button("关闭"){
                            self.showMap.toggle()
                        },alignment: .topTrailing
                    )
                    .ignoresSafeArea()
                }
                
                
                VStack(alignment: .leading)
                {
                    Text("详细说明").font(.title2)
                    ZStack(alignment: .leading){
                        TextEditor(text: $feebackDetail)
                            .padding()
                        if feebackDetail.isEmpty{
                            Text("请输入内容")
                                .foregroundColor(Color(UIColor.placeholderText))
                                .padding(25)
                        }
                    }.overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(UIColor.placeholderText),lineWidth: 1)
                    }.padding(1)
                        .frame(height: 150)
                }.onTapGesture {
                    hideKeybord()
                }
                
                Text("上传图片").font(.title2)
                
                
                
                                Text(String(newCoordinate2D?.latitude ?? 0))
                                Text(String(newCoordinate2D?.longitude ?? 0))
                

                
                
//                ZStack(alignment: .topTrailing)
//                {
//
//                        Image(systemName: "trash")
//                            .font(.title3)
//                            .foregroundColor(.red)
//                            .bold()
//                            .zIndex(1000)
//                            .onTapGesture {
//                                selectedImage = nil
//                            }
//                    
//                    
//                    Image(systemName: "bus")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 100, height: 100)
//                        .zIndex(-1)
//                }
                

                VStack{
                    if let selectedImage1 = selectedImage {
                        ZStack(alignment: .topTrailing)
                        {
                            
                            Image(systemName: "trash")
                                .font(.title3)
                                .foregroundColor(.red)
                                .bold()
                                .zIndex(1000)
                                .onTapGesture {
                                    selectedImage = nil
                                }
                            
                            Image(uiImage: selectedImage1)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .zIndex(-1)
                        }
                        
                    } else {
                        Button(action: {
                            isImagePickerPresented = true
                        })
                        {
                            Image(systemName: "camera")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .overlay{
                                }
                                .frame(width: 100,height: 100)
                                .background(.gray)
                            
                        }
                    }
                }
                .sheet(isPresented: $isImagePickerPresented) {
                    ImagePicker(selectedImage: $selectedImage)
                        .ignoresSafeArea()
                }
                
               // Spacer().symbolVariant(.none)
                
                Button(action: {
                    viewModel.feebackTitle = self.feebackTitle
                    viewModel.feebackCategory = selectedCategorys[selectedCategory]
                    viewModel.feebackLocation = [newCoordinate2D?.latitude ?? 0,newCoordinate2D?.longitude ?? 0]
                    
                    let re = viewModel.Verify();
                    if(!re.0){
                        errorMsg = re.1
                        showErrorMsg.toggle()
                    }
                    
                    
                }, label:{
                    Text("提交")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 50)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        .bold()
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        
                })
                .alert(isPresented: $showErrorMsg){
                    Alert(title: Text("校验失败"),message: Text("\(errorMsg)"))
                }
                
            }
           
            
        }
       
    }
}

#Preview {
    FeedbackView()
}
