//
//  Dictionary.swift
//  Vegetables
//
//  Created by tasneem .. on 10/07/2023.
//
import Foundation

extension Dictionary where Key == AnyHashable {
    func asInt(_ key:String)->Int{
        self[String(key)] as? Int ?? 0
    }
    func asDouble(_ key:String)->Double{
        self[String(key)] as? Double ?? 0.0
    }
    func asString(_ key:String)->String{
        self[String(key)] as? String ?? ""
    }
}
