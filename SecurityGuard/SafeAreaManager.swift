//
//  SafeAreaManager.swift
//  SecurityGuard
//
//  Created by mac on 2024/8/22.
//

import Foundation
import MapKit

@Observable
class SafeAreaManager: NSObject{
    
    var safeArea:[CLLocationCoordinate2D]=[]
    
    override init() {
        super.init()
        getSafeArea()
    }
    
    func getSafeArea(){
        safeArea=[]
        safeArea.append(.init(latitude: 30.582488, longitude: 103.719731))
        safeArea.append(.init(latitude: 30.582111, longitude: 103.719317))
        safeArea.append(.init(latitude: 30.581539, longitude: 103.720001))
        safeArea.append(.init(latitude: 30.581890, longitude: 103.720424))
    }
    
}
