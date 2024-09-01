//
//  MapViewModel.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/1.
//

import Foundation
import CoreLocation

@Observable
class MapViewModel: NSObject{
    private var httpRequest = HttpRequestService()
    var reMarkLocation:[LocationModel]?
    @ObservationIgnored var showMarker:Bool
    
    
    init(showMarker:Bool) {
        self.showMarker = showMarker
        super.init()
        if(self.showMarker){
            getRemarkLocation()
        }
    }
    
    //获取需要标注的坐标信息
    func getRemarkLocation(){
        let url="https://bf23851vm360.vicp.fun/api/LocationCoord/GetAllLocation"
        //let par = nil;
        httpRequest.Post(url: url, parameters: ["key": "value"]){
            (result:Result<ApiResultModel<[LocationModel]>,Error>) in
            switch result {
            case .success(let data):
                self.reMarkLocation = data.data
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
}
