//
//  Encodable.swift
//  SelselaStore
//
//  Created by Mohamed Zakout on 11/03/2021.
//

import Foundation

extension Encodable {
 
    func encode() -> Data? {
        return try? JSONEncoder().with(encodingStrategy: .convertToSnakeCase).encode(self)
    }
    
    func toDictionary() -> [String : CustomStringConvertible] {
        if let data = encode(), let json = try? JSONSerialization.jsonObject(with: data, options: []) {
            return json as! [String : CustomStringConvertible]
        }
        return [:]
    }
 
}

extension JSONEncoder {
    func with(encodingStrategy: KeyEncodingStrategy) -> JSONEncoder {
        keyEncodingStrategy = encodingStrategy
        return self
    }
}

