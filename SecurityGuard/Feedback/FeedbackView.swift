//
//  FeedbackView.swift
//  SecurityGuard
//
//  Created by mac on 2024/8/25.
//

import SwiftUI
import CoreLocation
struct FeedbackView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel:FeedbackViewModel = FeedbackViewModel()
    @State private var selectArea:String = ""
    private var httpRequest = HttpRequestService()
    @State private var isImagePickerPresented = false
    @State private var selectedImage: UIImage?
    
    @State var newCoordinate2D :CLLocationCoordinate2D?
    @State  var showMap:Bool = false
    
    @State var showErrorMsg = false
    @State var errorMsg = ""

    private var selectedCategorys = ["AAAAAA","BBBBB","CCCCCC","DDDDDD"]
    @State var selectedCategory:Int = 0
    //@State var feebackDetail = ""
    var body: some View {
        ZStack{
            NavigationStack{
                Form{
                    Section()
                    {
                        VStack(alignment: .leading){
                            HStack{
                                Text("反馈标题").font(.title2)
                                Image(systemName: "star.fill")
                                    .foregroundColor(.red)
                                    .font(.system(size:10))
                            }
                            TextField("控制在15个字内",text: $viewModel.feedBackModel.feedbackTitle)
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
                        
                        //根据选取地图位置带出区域
                        HStack{
                            HStack{
                                Text("问题位置 ").font(.title2)
                                Text("[\(viewModel.feedBackModel.feedbackArea)]")
                                    .font(.title2).bold()
                            }
                            
                            Spacer()
                            Button(action:{
                                self.showMap.toggle()
                            }){
                                Image(systemName: "mappin")
                            }
                        }
                        .fullScreenCover(isPresented: $showMap){
                            MapView(
                                showMarker: true,
                                showSaftyArea: false,
                                enableCustomLocation: true,
                                newCoordinate2D: $newCoordinate2D
                            )
                            .overlay(
                                Button("关闭"){
                                    self.showMap.toggle()
                                    viewModel.feedBackModel.feedbackLocations = [newCoordinate2D?.latitude ?? 0.0,newCoordinate2D?.longitude ?? 0.0]
                                    viewModel.GetArea()
                                }
                                    .background(.blue)
                                    .foregroundColor(.white)
                                    .padding()
                                    .font(.title)
                                ,alignment: .topTrailing
                            )
                        }
                        
                        VStack(alignment: .leading){
                            HStack{
                                Text("详细地址").font(.title2)
                            }
                            TextField("精确到楼层",text: $viewModel.feedBackModel.feedbackAreaDetail)
                        }.onTapGesture {
                            hideKeybord()
                        }
                        
                        VStack(alignment: .leading)
                        {
                            Text("详细说明").font(.title2)
                            ZStack(alignment: .leading){
                                TextEditor(text: $viewModel.feedBackModel.feedbackDetail)
                                    .padding()
                                if viewModel.feedBackModel.feedbackDetail.isEmpty{
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
                        
                        
                        
                        //                                Text(String(newCoordinate2D?.latitude ?? 0))
                        //                                Text(String(newCoordinate2D?.longitude ?? 0))
                        //
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                                
                                ForEach(0..<viewModel.takePhotos.count,id:\.self){ index in
                                    let cIndex = index;
                                    ZStack(alignment: .topTrailing)
                                    {
                                        //if let upImage = takePhotos[index]{
                                        let upImage = viewModel.takePhotos[index]
                                        let scallImage = upImage.image.scaledToSize(newSize: CGSize(width: 200, height: 200))
                                        VStack{
                                            Image(systemName: "trash")
                                                .font(.title3)
                                                .foregroundColor(.red)
                                                .bold()
                                                .onTapGesture {
                                                    viewModel.takePhotos.remove(at: cIndex)
                                                }
                                            Spacer()
                                            if upImage.loadingStatus < 2 {
                                                Image(systemName: upImage.loadingStatus == 0 ? "icloud.and.arrow.up":"rays")
                                                    .font(.title3)
                                                    .foregroundColor(.blue)
                                                    .bold()
                                                    .onTapGesture {
                                                        if upImage.loadingStatus == 0{
                                                            upImage.loadingStatus = 1
                                                            RefreshTakePhotos()
                                                            httpRequest.UpLoadImage(
                                                                image: scallImage ?? upImage.image
                                                            ){
                                                                (result:Result<ApiResultModel<String>,Error>) in
                                                                switch result {
                                                                case .success(let data):
                                                                    if data.isSucess{
                                                                        upImage.imageUrl = data.data ?? ""
                                                                        upImage.loadingStatus = 2
                                                                        RefreshTakePhotos()
                                                                    }
                                                                    else{
                                                                        print(data.msg ?? "")
                                                                        upImage.loadingStatus = 0
                                                                        RefreshTakePhotos()
                                                                    }
                                                                case .failure(let error):
                                                                    print(error)
                                                                    upImage.loadingStatus = 0
                                                                    RefreshTakePhotos()
                                                                }
                                                            }
                                                        }
                                                        
                                                    }
                                            }
                                        }
                                        Image(uiImage: upImage.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                            .zIndex(-1)
                                        //}
                                    }
                                }
                                
                                Image(systemName: "camera")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .overlay{
                                    }
                                    .frame(width: 100,height: 100)
                                    .background(.gray)
                                    .onTapGesture {
                                        isImagePickerPresented.toggle()
                                    }
                                
                            }
                            .fullScreenCover(isPresented: $isImagePickerPresented) {
                                ImagePicker(){ newImage in
                                    let imageUpload = ImageUpLoadViewModel()
                                    imageUpload.image = newImage
                                    viewModel.takePhotos.append(imageUpload)
                                    
                                }.ignoresSafeArea()
                                
                            }
                        }
                        
                        Button(action: {
                            if(viewModel.httpRequestStatus == 1 || viewModel.httpRequestStatus == 2){
                                return
                            }
                            viewModel.feedBackModel.feedbackCategory = selectedCategorys[selectedCategory]
                            viewModel.feedBackModel.feedbackLocations = [newCoordinate2D?.latitude ?? 0,newCoordinate2D?.longitude ?? 0]
                            
                            let re = viewModel.Verify();
                            if(!re){
                                return
                            }else
                            {
                                viewModel.feedBackModel.feedbackImages = []
                                //                        ForEach(viewModel.takePhotos,id:\.self){ item in
                                //                            viewModel.feedBackModel.feedbackImages.append(item.imageUrl)
                                //                        }
                                for item in viewModel.takePhotos{
                                    viewModel.feedBackModel.feedbackImages.append(item.imageUrl)
                                }
                                viewModel.Add()
                            }
                            
                        }, label:{
                            Text(viewModel.httpRequestStatus == 1 ? "提交中":(viewModel.httpRequestStatus == 2 ? "已经提交":"提交"))
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 50)
                                .background((viewModel.httpRequestStatus == 1 || viewModel.httpRequestStatus == 2 ) ? Color.gray : Color.blue)
                                .cornerRadius(8)
                                .foregroundColor(.white)
                                .bold()
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            
                        })
                        .alert(isPresented: $viewModel.showAlter){
                            if viewModel.httpRequestStatus == 2{
                                Alert(title: Text(""),message: Text("\(viewModel.alterMsg)"))
                            }else{
                                Alert(title: Text("Error"),message: Text("\(viewModel.alterMsg)"))
                            }
                        }
                        
                    }
                    
                    
                }.onAppear{
                    //takePhotos2.images = takePhotos
                }
                .navigationTitle(Text("问题反馈").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold())
                .navigationBarTitleDisplayMode(.inline)
                .background(.white)
            }
        }
    }
    
    
    
    func RefreshTakePhotos(){
        let tmp:[ImageUpLoadViewModel] = viewModel.takePhotos
        viewModel.takePhotos.removeAll()
        viewModel.takePhotos = tmp
    }
}

#Preview {
    FeedbackView()
}
