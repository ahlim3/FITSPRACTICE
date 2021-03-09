//
//  File.swift
//  FitsPractice
//
//  Created by Anthony Lim on 3/4/21.
//

import Foundation
extension String {
    func myComponents(withMaxLength length: Int) -> [String] {
        return stride(from: 0, to: self.count, by: length).map {
            let start = self.index(self.startIndex, offsetBy: $0)
            let end = self.index(start, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            return String(self[start..<end])
        }
    }
}
