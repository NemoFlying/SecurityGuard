//
//  CommonViewModel.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/12.
//

import SwiftUI

class CommonViewModel:  ObservableObject{
   
    @Published var httpRequestStatus:Int = 0  //Http请求状态，0表示为提交，1，表示请求中，2表示请求完成，3表示请求报错
    @Published var alterMsg:String = ""       //弹窗信息内容
    @Published var showAlter:Bool = false     //是否要显示弹窗信息
    
    var functionViewMode:[FunctionViewModel] {
        get{
            FunctionViewModel().getRoleFunction(roleName: self.userRole)
        }
    }
    
    
    @AppStorage("baseUrl") var baseUrl:String = "https://bf23851vm360.vicp.fun/api"
    @AppStorage("token") var token:String = ""
    @AppStorage("userName") var userName:String = ""
    @AppStorage("password") var password:String = ""
    @AppStorage("needLogin") var needLogin:Bool = true
    @AppStorage("userRole") var userRole:String = "admin"
    //@AppStorage("userRole1") var userRole1:[String] = ["admin","ss"]
    //@AppStorage("functionViewMode") var functionViewMode:[FunctionViewModel] = []
    
    
    func Post<T:Codable>(urlString:String,parameters:[String:Any] ,completion:@escaping (T)->Void){
        httpRequestStatus = 1  //提交中
        let httpHelper = HttpRequestService()
        httpHelper.Post(
            url: baseUrl + urlString,
            parameters: parameters,
            completion: {
                (result:Result<T,Error>) in
                switch result {
                case .success(let data):
                    completion(data)
                case .failure(let error):
                    self.showAlter = true
                    self.httpRequestStatus = 3  //提交失败
                    self.alterMsg = "系统错误"
                }
            }
        )
    }
    
    
    
}
