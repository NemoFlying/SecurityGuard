//
//  UserViewModel.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/12.
//

import Foundation

class UserViewModel: CommonViewModel{
    @Published var model = UserModel()
    
    let httpRequestService:HttpRequestService = HttpRequestService()
    
    
    func Login(){
        let dic=["userName": userName,"password": password]
        self.httpRequestStatus = 1
        httpRequestService.Post(
            url:baseUrl + "/User/login2",
            parameters: dic,
            completion: {
                (result:Result<ApiResultModel<UserModel>,Error>) in
                switch result {
                case .success(let data):
                    if data.isSucess{
                        self.httpRequestStatus = 2 //成功
                        self.token = data.data?.token ?? ""
                        self.userRole = data.data?.userRole ?? "普通用户"
                        self.model = data.data ?? UserModel()
                        self.needLogin = false
                    }
                    else{
                        self.showAlter = true
                        self.alterMsg = data.msg ?? ""
                        self.httpRequestStatus = 3
                        self.needLogin = true
                        self.password = ""
                    }
                case .failure(let error):
                    self.httpRequestStatus = 3
                    self.showAlter = true
                    self.alterMsg = "系统错误"
                    self.needLogin = true
                    self.password = ""
                }
            }
        )
    }
    
    
}
