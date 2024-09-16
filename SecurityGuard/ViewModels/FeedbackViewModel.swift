//
//  feebackViewModel.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/5.
//

import Foundation
import SwiftUI


class FeedbackViewModel:  CommonViewModel{
    @Published var feedBackModel = FeedbackModel()
    @Published var takePhotos:[ImageUpLoadViewModel] = []
   // @Published var commitStatus:Int = 0  //提交状态，0表示为提交，1，表示提交中，2表示提交成功，3表示提交失败
    
    //@Published var alterMsg:String = ""
    //@Published var showAlter:Bool = false
//    var commitLabel:String{
//        get{
//            
//               return commitStatus==1 ? "提交中":(commitStatus == 2 ? "已经提交":"提交")
//        }
//    }
    func Verify() -> Bool{
        if feedBackModel.feedbackTitle.isEmpty{
            showAlter = true
            alterMsg = "请输入反馈标题"
            return false
        }
        if feedBackModel.feedbackCategory.isEmpty{
            showAlter = true
            alterMsg = "请输入反馈类别"
            return false
        }
        if feedBackModel.feedbackLocations.isEmpty || feedBackModel.feedbackLocations[0] == 0{
            showAlter = true
            alterMsg = "请选择反馈位置"
            return false
        }
        //图片校验
        if takePhotos.count>0{
            if takePhotos.first(where: { item in
                return item.loadingStatus == 0 || item.loadingStatus == 1
            }) != nil{
                showAlter = true
                alterMsg = "有未完成上传的图片"
                return false
            }
        }
        

        return true
    }
    func UpdateVerify()-> Bool{
        if feedBackModel.feedbackSolution.isEmpty{
            showAlter = true
            alterMsg = "请输入解决方案"
            return false
        }
        return true
    }
    
    
    
    
    func GetList(status:Int,completion: @escaping ([FeedbackViewModel]) -> Void){
        let par = feedBackModel.toDictionary()
        Post(
            urlString: "/Feedback/Get",
            parameters: par,
            completion: {
                (data:ApiResultModel<[FeedbackModel]>) in
                if data.isSucess{
                    self.httpRequestStatus = 0
                    self.showAlter = false
                    var viewModels:[FeedbackViewModel] = []
                    if let reDatas = data.data{
                        for item in reDatas{
                            let viewModel = FeedbackViewModel()
                            viewModel.feedBackModel = item
                            viewModels.append(viewModel)
                        }
                        completion(viewModels)
                    }
                }
                else{
                    self.showAlter = true
                    self.httpRequestStatus = 3  //提交失败
                    self.alterMsg = data.msg ?? ""
                }
            }
        )
    }

    func Add(){
        let urlString = "/Feedback/Insert"
        AddOrUpdate(urlString: urlString)
    }
    func Update(){
        let urlString = "/Feedback/Handle"
        AddOrUpdate(urlString: urlString)
    }
    
    func AddOrUpdate(urlString:String){
        let par = feedBackModel.toDictionary()
        Post(
            urlString: urlString,
            parameters: par,
            completion: {
                (data:ApiResultModel<String>) in
                if data.isSucess{
                    self.httpRequestStatus = 2  //提交成功
                    self.alterMsg = "保存成功"
                    self.showAlter = true
                }
                else{
                    self.httpRequestStatus = 3  //失败
                    self.alterMsg = data.msg ?? ""
                    self.showAlter = true
                }
            }
        )
    }
    
    func GetArea(){
        let par = feedBackModel.toDictionary()
        Post(
            urlString: "/Feedback/GetArea",
            parameters: par,
            completion: {
                (data:ApiResultModel<String>) in
                if data.isSucess{
                    self.httpRequestStatus = 0
                    self.feedBackModel.feedbackArea = data.data ?? ""
                    self.showAlter = false
                }
                else{
                    self.httpRequestStatus = 3  //失败
                    self.alterMsg = data.msg ?? ""
                    self.showAlter = true
                }
            }
        )
    }
    
}
