//
//  PlistParser.swift
//  PoppinDemo
//
//  Created by Alexis Diaz on 10/4/22.
//

import Foundation

struct PlistParser {
    static func getStringValue(forkey key: String) -> String {
        guard let value = Bundle.main.infoDictionary?[key] as? String else {
            fatalError("Could not find value for key: \(key) in the .plist file")
        }
        return value
    }
}
