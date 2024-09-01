//
//  LocationModel.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/1.
//

import Foundation
import CoreLocation
class LocationModel: NSObject,Codable
{
    
    var location_Label:String?
    var latitude:Double?
    var lonitude:Double?
    var range:[LocationModel]?
    var safetyLevel:String?
    var locationCoordinate2D:CLLocationCoordinate2D{
        get{
            return .init(latitude: latitude ?? 0, longitude: lonitude ?? 0)
        }
    }
    var rangeLocationCoordinate2D:[CLLocationCoordinate2D]{
        get{
            var ranges:[CLLocationCoordinate2D]=[]
//            ForEach(range ?? []){ran in
//                ranges.append(.init(latitude: ran.latitude ?? 0, longitude: ran.lonitude ?? 0))
//            }
            for ran in range ?? [] {
                ranges.append(.init(latitude: ran.latitude ?? 0, longitude: ran.lonitude ?? 0))
            }
            return ranges
        }
    }
}
