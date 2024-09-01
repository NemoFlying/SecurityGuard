//
//  HttpRequestView.swift
//  SecurityGuard
//
//  Created by mac on 2024/8/31.
//

import SwiftUI

struct HttpRequestView: View {
    private var httpRequest = HttpRequestService()
    @State var status:Bool=false;
    var body: some View {
        Button(action: {
            getTestData()
        }, label: {
            Text("Hello, World!\(String(status))")
        })
        
    }
    func getTestData(){
        let url="https://bf23851vm360.vicp.fun/home/test3"
        //let par = nil;
        httpRequest.Post(url: url, parameters: ["key": "value"]){ 
            (result:Result<ApiResultModel<[TestModel]>,Error>) in
            switch result {
            case .success(let data):
                print(data)
                status = data.isSucess
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

#Preview {
    HttpRequestView()
}
