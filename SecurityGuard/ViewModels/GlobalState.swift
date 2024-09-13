//
//  GlobalState.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/12.
//

import Foundation

class GlobalState: ObservableObject{
    @Published var apiBaseUrl:String = "https://bf23851vm360.vicp.fun/api"
    @Published var apiToken:String = ""
}
