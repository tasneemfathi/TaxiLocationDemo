//
//  Decodable.swift
//  BaseSwiftUI2022
//
//  Created by i mac on 19/12/2022.
//

import Foundation


extension Decodable {
    static var decodingStrategy: JSONDecoder.KeyDecodingStrategy {
        return .useDefaultKeys
    }

    static func decode(_ data: Data) -> Self? {
        do {
            return try JSONDecoder(keyDecodingStrategy: decodingStrategy).decode(self, from: data)
        } catch {
            print("Failed To Parse Model: \(error)")
            return nil
        }
    }
}

extension JSONDecoder {
    convenience init(keyDecodingStrategy: KeyDecodingStrategy) {
        self.init()
        self.keyDecodingStrategy = keyDecodingStrategy
    }
    
   
}
