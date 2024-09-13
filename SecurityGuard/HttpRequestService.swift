//
//  HttpRequestService.swift
//  SecurityGuard
//
//  Created by mac on 2024/8/30.
//

import Foundation
import Alamofire
import UIKit
import SwiftUI

// 定义一个类型别名，用于闭包签名，便于管理泛型类型
typealias DataCompletion<T> = (Result<T, Error>) -> Void
 
class HttpRequestService {
    
    @AppStorage("token") var token:String = ""
    
    // 发送 POST 请求并处理响应以解码为泛型类型 T
    func Post<T: Codable>(url: URLConvertible, parameters: [String: Any], completion: @escaping DataCompletion<T>) {
        let headers: HTTPHeaders = ["Content-Type" : "application/json" , "Authorization":"Bearer \(token)"]
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default,headers: headers)
            .responseData { response in
                guard let data = response.data else {
                    completion(.failure(AFError.responseSerializationFailed(reason: .inputDataNilOrZeroLength)))
                    return
                }
                 print(String(data: data, encoding: .utf8))
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
    
    func UpLoadImage<T: Codable>(image:UIImage,completion: @escaping DataCompletion<T>){
        let urlString="https://bf23851vm360.vicp.fun/api/Image/upload"
        let httpHeaders = HTTPHeaders([:])
        let imageData :Data = image.jpegData(compressionQuality: 0.5)!
        let imageName:String = getNowTimeTimestamp()
        Alamofire.AF.upload(multipartFormData: { multiPart in
            multiPart.append(imageData, withName: "Image", fileName: "\(imageName).jpg", mimeType: "image/jpg")
        }, to: urlString, method: .post, headers: httpHeaders).uploadProgress(queue: .main) { progress in
        }.responseData { response in
            //print(response.data ?? "ccccccccc")
            guard let data = response.data else {
                completion(.failure(AFError.responseSerializationFailed(reason: .inputDataNilOrZeroLength)))
                return
            }
            //print("xxxxxxxxxxxxxxxxxxxxxx")
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
    
    
    /// 获取当前时间时间戳
       func getNowTimeTimestamp() -> String {
           let timeInterval: TimeInterval = Date.now.timeIntervalSince1970
           let millisecond = CLongLong(round(timeInterval*1000))
           return "\(millisecond)"
       }

}
