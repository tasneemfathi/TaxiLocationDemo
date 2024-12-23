//
//  NSSet.swift
//  sunset
//
//  Created by tasneem .. on 16/03/2023.
//

import Foundation

extension NSSet {
    func toArray<S>(_ of: S.Type) -> [S] {
        let array = self.map({$0 as! S})
        return array
    }

}
