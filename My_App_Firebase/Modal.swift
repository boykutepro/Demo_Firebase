//
//  Modal.swift
//  My_App_Firebase
//
//  Created by Thien Tung on 5/30/20.
//  Copyright © 2020 taoquynh. All rights reserved.
//

import Foundation

struct JSON {
    static let encoder = JSONEncoder()
}

extension Encodable {
    // đoạn này sẽ convert dữ liệu từ object thành dictionary
    var dictionary: [String: Any] {
        return (try? JSONSerialization.jsonObject(with: JSON.encoder.encode(self))) as? [String: Any] ?? [:]
    }
    subscript(key: String) -> Any? {
        return dictionary[key]
    }
    
}

struct Person: Codable { // Codable đại diện cho Decodable và Encodable
    var name: String
    var age: String
    var job: String
}
