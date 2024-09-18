//
//  LocationManager.swift
//  SecurityGuard
//
//  Created by mac on 2024/8/19.
//

import SwiftUI
import CoreLocation

@Observable
class LocationManager: NSObject, CLLocationManagerDelegate{
    @ObservationIgnored let manager = CLLocationManager()
    var userLocation:CLLocation?
    var lastLocation:CLLocationCoordinate2D?
    var userLocationTrack:[CLLocationCoordinate2D]=[]
    var clatitude : CLLocationDegrees{
        userLocation?.coordinate.latitude ?? 30.581991
    }
    var clongitude : CLLocationDegrees {
        userLocation?.coordinate.longitude ?? 103.720088
    }
    var IsRecordLocation:Bool = false{
        didSet{
            startLocationServices()
        }
    } /**开启或者停用位置追踪*/
    var getLocaitonOnce:Bool = false
    
    override init() {
        super.init()
        manager.delegate = self
        startLocationServices()
    }
    
    func startLocationServices(){
        if manager.authorizationStatus == .authorizedAlways ||
            manager.authorizationStatus == .authorizedWhenInUse{
            if(IsRecordLocation)
            {
                manager.startUpdatingLocation()
                manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
                manager.distanceFilter = 1
            }else
            {
                manager.stopUpdatingLocation()
            }
            
        }else{
            manager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userLocation = locations.last
        let newLocation = LocationTransform.wgs2gcj(
            wgsLat: userLocation!.coordinate.latitude,
            wgsLng: userLocation!.coordinate.longitude
        )
        if(userLocation != nil){
            lastLocation = CLLocationCoordinate2D(latitude: newLocation.gcjLat, longitude: newLocation.gcjLng)
            userLocationTrack.append(
                .init(
                    latitude: newLocation.gcjLat,
                    longitude: newLocation.gcjLng
                )
            )
            if(getLocaitonOnce){
                manager.stopUpdatingLocation()
            }
        }
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    }
    
    func getCurrentLocation(){
        /**开启定位*/
        //清空已经记录的轨迹
        userLocationTrack = []
        IsRecordLocation = true
        getLocaitonOnce = true
    }
 
    
    
    
    
}
