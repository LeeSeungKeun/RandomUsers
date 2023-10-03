//
//  Extension+String.swift
//  MrPick
//
//  Created by 이성근 on 2023/10/03.
//

import Foundation


extension String {
    func dateToString() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "YYYY-MM-dd"
            let formattedDate = dateFormatter.string(from: date)
            return formattedDate
        } else {
            return nil
        }
    }
}
