//
//  Array.swift
//  ClothesStore
//
//  Created by tasneem .. on 25/04/2023.
//

import Foundation

extension Array where Element: Hashable {
    func distinct() -> Array<Element> {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
