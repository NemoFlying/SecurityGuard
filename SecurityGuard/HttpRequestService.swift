//
//  HttpRequestService.swift
//  SecurityGuard
//
//  Created by mac on 2024/8/30.
//

import Foundation
import Alamofire
  
// 定义一个类型别名，用于闭包签名，便于管理泛型类型
typealias DataCompletion<T> = (Result<T, Error>) -> Void
  
struct HttpRequestService {
    // 发送 POST 请求并处理响应以解码为泛型类型 T
    func Post<T: Codable>(url: URLConvertible, parameters: [String: Any], completion: @escaping DataCompletion<T>) {
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseData { response in
                print(String(bytes: response.data!, encoding: .utf8)!)
                guard let data = response.data else {
                    completion(.failure(AFError.responseSerializationFailed(reason: .inputDataNilOrZeroLength)))
                    return
                }
                  
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
  
//// 使用示例
//let url = URL(string: "https://api.example.com/data")!
//DataService().data(url: url, parameters: ["key": "value"]) { result in
//    switch result {
//    case .success(let data):
//        print(data)
//    case .failure(let error):
//        print(error)
//    }
//}
