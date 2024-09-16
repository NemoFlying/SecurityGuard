//
//  UIImageExtension.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/16.
//

import Foundation
import UIKit
extension UIImage{
    
    func scaledToSize(newSize: CGSize) -> UIImage? {
           UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
           defer { UIGraphicsEndImageContext() }
           guard let cgImage = self.cgImage, let context = UIGraphicsGetCurrentContext() else { return nil }
           context.interpolationQuality = .default
           let rect = CGRect(origin: .zero, size: newSize)
           context.scaleBy(x: 1.0, y: -1.0)
           context.translateBy(x: 0, y: -rect.height)
           context.draw(cgImage, in: rect)
           return UIGraphicsGetImageFromCurrentImageContext()
       }
}
