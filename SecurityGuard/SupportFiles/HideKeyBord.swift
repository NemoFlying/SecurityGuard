//
//  HideKeyBord.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/5.
//

import SwiftUI

extension View{
    func hideKeybord(){
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}
