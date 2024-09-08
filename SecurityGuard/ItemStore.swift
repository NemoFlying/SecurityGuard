//
//  ItemStore.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/8.
//

import Foundation
// 创建一个遵守 ObservableObject 和 Codable 的类

// 假设你有一个简单的可编码/可解码的模型
struct Item: Codable {
    var name: String
    var value: Int
}

class ItemStore: ObservableObject, Codable {
    @Published var item: Item?
  
    // 因为 ItemStore 是一个类，并且包含 Codable 类型的属性，
    // 你需要手动实现 Codable 协议的 encode 和 decode 方法
    // 或者使用编码和解码容器来编码和解码其属性
  
    // 编码方法
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(item, forKey: .item)
    }
  
    // 解码方法
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try? container.decode(Item.self, forKey: .item)
        //super.init() // 如果你的类继承自另一个类，确保调用 super.init()
    }
  
    // 编码键
    private enum CodingKeys: String, CodingKey {
        case item
    }
}
