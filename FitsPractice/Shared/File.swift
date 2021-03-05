//
//  File.swift/Users/anthonylim/Documents/real.fits
//  FitsPractice
//
//  Created by Anthony Lim on 2/23/21.
//

import Foundation

guard let path = UserDefaults.standard.string(forKey: "path") else {
    throw Error.noPathGiven
}

let url = URL(fileURLWithPath: path)

do {
    let data = try Data(contentsOf: url)
    ...
} catch {
    throw Error.failedToLoadData
}

