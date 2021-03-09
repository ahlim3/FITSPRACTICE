//
//  InitialNumber.swift
//  FitsPractice
//
//  Created by Anthony Lim on 3/9/21.
//

import Foundation
extension String {
    var westernArabicNumeralsOnly: String {
        let pattern = UnicodeScalar("0")..."9"
        return String(unicodeScalars
                        .compactMap { pattern ~= $0 ? Character($0) : nil })
    }
}
