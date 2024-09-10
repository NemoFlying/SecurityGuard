//
//  feebackViewModel.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/5.
//

import Foundation
import SwiftUI


class FeedbackViewModel:  ObservableObject{
    @Published var feedBackModel = FeedbackModel()
    @Published var takePhotos:[ImageUpLoadViewModel] = []
    @Published var commitStatus:Int = 0  //提交状态，0表示为提交，1，表示提交中，2表示提交成功，3表示提交失败
    @Published var commitMsg:String = ""
    @Published var showMsg:Bool = false
//    var commitLabel:String{
//        get{
//            
//               return commitStatus==1 ? "提交中":(commitStatus == 2 ? "已经提交":"提交")
//        }
//    }
    func Verify() -> (Bool,String){
        if feedBackModel.feedbackTitle.isEmpty{
            return (false,"请输入反馈标题")
        }
        if feedBackModel.feedbackCategory.isEmpty{
            return (false,"请输入反馈类别")
        }
        if feedBackModel.feedbackLocations.isEmpty || feedBackModel.feedbackLocations[0] == 0{
            return (false,"请选择反馈位置")
        }
        //图片校验
        if takePhotos.count>0{
            if takePhotos.first(where: { item in
                return item.loadingStatus == 0 || item.loadingStatus == 1
            }) != nil{
                return(false,"有未完成上传的图片")
            }
        }
        

        return(true,"")
    }
    func Add(){
        do{
            commitStatus = 1  //提交中
            let urlString = "https://bf23851vm360.vicp.fun/api/Feedback/Insert"
            let par = feedBackModel.toDictionary()
            let httpHelper = HttpRequestService()
            httpHelper.Post(
                url: urlString,
                parameters: par,
                completion: {
                    (result:Result<ApiResultModel<String>,Error>) in
                    self.showMsg = true
                    switch result {
                    case .success(let data):
                        if data.isSucess{
                            self.commitStatus = 2  //提交成功
                        }
                        else{
                            self.commitStatus = 3  //提交失败
                            self.commitMsg = data.msg ?? ""
                        }
                    case .failure(let error):
                        self.commitStatus = 3  //提交失败
                        self.commitMsg = "系统错误"
                    }
                }
            )
            
            
        }catch{
            print("Error encoding error:\(error)")
        }
    }
    
    func GetList(status:Int,completion: @escaping ([FeedbackViewModel]) -> Void){
        do{
            commitStatus = 1  //提交中
            let urlString = "https://bf23851vm360.vicp.fun/api/Feedback/Get"
            let par = feedBackModel.toDictionary()
            let httpHelper = HttpRequestService()
            httpHelper.Post(
                url: urlString,
                parameters: par,
                completion: {
                    (result:Result<ApiResultModel<[FeedbackModel]>,Error>) in
                    self.showMsg = true
                    switch result {
                    case .success(let data):
                        if data.isSucess{
                            self.commitStatus = 2
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
                            self.commitStatus = 3  //提交失败
                            self.commitMsg = data.msg ?? ""
                        }
                    case .failure(let error):
                        self.commitStatus = 3  //提交失败
                        self.commitMsg = "系统错误"
                    }
                }
            )
            
            
        }catch{
            print("Error encoding error:\(error)")
        }
    }

    
    
}
