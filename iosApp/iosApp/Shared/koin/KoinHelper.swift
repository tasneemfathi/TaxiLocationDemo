//
//  KoinHelper.swift
//  iosApp
//
//  Created by tasneem .. on 22/12/2024.
//  Copyright © 2024 orgName. All rights reserved.
//

import Foundation
import shared


func get<A: AnyObject>() -> A {
    return KoinInitializer.companion.koin.get(objCClass: A.self) as! A
}

func get<A: AnyObject>(_ type: A.Type) -> A {
    return KoinInitializer.companion.koin.get(objCClass: A.self) as! A
}

func get<A: AnyObject>(_ type: A.Type, qualifier: (any Koin_coreQualifier)? = nil, parameter: Any) -> A {
    return KoinInitializer.companion.koin.get(objCClass: A.self, qualifier: qualifier, parameter: parameter) as! A
}
