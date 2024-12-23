//
//  URL.swift
//  BaseSwiftUI2022
//
//  Created by i mac on 19/12/2022.
//

import Foundation

extension URL {
    var fileSize: Int {
        return (try? resourceValues(forKeys: [.fileSizeKey]).fileSize) ?? 0
    }
    
    var fileSizeString: String {
        return ByteCountFormatter.string(fromByteCount: Int64(fileSize), countStyle: .file)
    }
    
    var creationDate: Date? {
        return try? resourceValues(forKeys: [.creationDateKey]).creationDate
    }

    func valueOf(_ queryParameterName: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParameterName })?.value
    }
}
