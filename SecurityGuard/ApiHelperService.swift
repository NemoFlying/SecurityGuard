//
//  ApiHelperService.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/12.
//

import SwiftUI
import Alamofire
import UIKit

class ApiHelperService {
//    @AppStorage("token") private var token:String = ""
//    @AppStorage("userName") private var userName:String = "admin"
//    @AppStorage("password") private var password:String = "123456"
    let apiBaseUrl:String = "https://bf23851vm360.vicp.fun/api"
    
    func Login(){
        let dic=["userName": userName,"password": password]
        Post(
            url: "/User/login",
            parameters: dic,
            completion: {
                (result:Result<ApiResultModel<String>,Error>) in
                switch result {
                case .success(let data):
                    if data.isSucess{
                        //self.commitStatus = 2  //提交成功
                    }
                    else{
                        //self.commitStatus = 3  //提交失败
                        //self.alterMsg = data.msg ?? ""
                    }
                case .failure(let error):
                    //print("Error encoding error:\(error)")
                    //self.commitStatus = 3  //提交失败
                    //self.alterMsg = "系统错误"
                }
            }
        )
    }
    // 发送 POST 请求并处理响应以解码为泛型类型 T
    func Post<T: Codable>(url: String, parameters: [String: Any], completion: @escaping DataCompletion<T>) {
        let fullUrl = apiBaseUrl + url
        let headers: HTTPHeaders = ["Content-Type" : "application/json" , "Authorization":"Bearer \(token)"]
        AF.request(fullUrl, method: .post, parameters: parameters, encoding: JSONEncoding.default,headers: headers)
            .responseData { response in
                guard let data = response.data else {
                    completion(.failure(AFError.responseSerializationFailed(reason: .inputDataNilOrZeroLength)))
                    return
                }
                //print(String(data: data, encoding: .utf8))
                // 尝试将数据解码为泛型类型 T
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: data)
                    completion(.success(result))
                } catch let error {
                    completion(.failure(error))
                }
        }
    }
}
