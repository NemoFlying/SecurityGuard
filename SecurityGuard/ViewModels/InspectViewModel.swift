//
//  InspectViewModel.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/8.
//

import Foundation
class InspectViewModel: ObservableObject
{
    
//    var inspectId:Int = 0
//    var inspectTitle:String = ""
//    var inspectDesc:String = ""
//    var inspectDeadLineDate:String = ""
//    var isExpired:Bool = false //是否过期
//    var inspectType:Int = 0   // 0表示设备巡检 ，1表示巡场
//    var inspectStatus:Int = 0 //0:未开始，1表示结束
//    var items:[InspectDetailModel] = [] //巡检项目
    @Published var model:InspectModel = InspectModel()
//    init(model: InspectModel) {
//        self.model = model
//    }
    
    
    
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
    
    
}


