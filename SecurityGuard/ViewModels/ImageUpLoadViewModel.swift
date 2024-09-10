//
//  ImageUpLoadViewModel.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/9.
//

import Foundation
import UIKit
class ImageUpLoadViewModel:ObservableObject{
    var image:UIImage = UIImage()
    var imageUrl:String = ""
    @Published var loadingStatus:Int = 0
}
