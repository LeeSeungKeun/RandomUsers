//
//  Extension+Encodable.swift
//  MrPick
//
//  Created by 이성근 on 2023/10/03.
//

import Foundation


extension Encodable {
    func toDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self),
              let jsonData = try? JSONSerialization.jsonObject(with: data),
              let dictionaryData = jsonData as? [String: Any] else { return [:] }
        return dictionaryData
    }
}
