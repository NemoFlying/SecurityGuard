//
//  InspectViewModel.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/8.
//

import Foundation
class InspectViewModel: CommonViewModel
{
    
    @Published var model:InspectModel = InspectModel()
    
    
    func GetList(status:Int,completion: @escaping ([InspectViewModel]) -> Void){
        do{
            //commitStatus = 1  //提交中
            let urlString = "https://bf23851vm360.vicp.fun/api/InspectModel/Get"
            let par = ["aaa":"aaa"]
            let httpHelper = HttpRequestService()
            httpHelper.Post(
                url: urlString,
                parameters: par,
                completion: {
                    (result:Result<ApiResultModel<[InspectModel]>,Error>) in
                    //self.showAlter = true
                    switch result {
                    case .success(let data):
                        if data.isSucess{
                            //self.commitStatus = 2
                            var viewModels:[InspectViewModel] = []
                            if let reDatas = data.data{
                                for item in reDatas{
                                    let viewModel = InspectViewModel()
                                    viewModel.model = item
                                    viewModels.append(viewModel)
                                }
                                completion(viewModels)
                            }
                        }
                        else{
                            //self.commitStatus = 3  //提交失败
                            //self.alterMsg = data.msg ?? ""
                        }
                    case .failure(let error):
                        print("Error encoding error:\(error)")
                       // self.commitStatus = 3  //提交失败
                       // self.alterMsg = "系统错误"
                    }
                }
            )
            
            
        }catch{
            print("Error encoding error:\(error)")
        }
    }
    
    
    func Update(){
        let urlString = "/InspectModel/Finished"
        let par = model.toDictionary()
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
    
    
    
}


