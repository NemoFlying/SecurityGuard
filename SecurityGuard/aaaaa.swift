//
//  aaaaa.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/10.
//

import Alamofire
import SwiftUI
 
struct MyPostRequest: Identifiable,Encodable {
    let id: Int
    let title: String
    // 其他需要的属性...
}
 
// 假设你有一个要发送的JSON对象
let postRequest = MyPostRequest(id: 1, title: "SwiftUI Alamofire POST Example")
 
// 将对象转换为JSON
if let json = try? JSONEncoder().encode(postRequest) {
    // 创建JSON对象
    let jsonObject = try? JSONSerialization.jsonObject(with: json, options: [])
 
    // 发送请求
    AF.request("https://your-api-endpoint.com/posts", method: .post, parameters: jsonObject, encoding: JSONEncoding.default, headers: ["Content-Type": "application/json"])
        .responseJSON { response in
            switch response.result {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error)
            }
        }
}
