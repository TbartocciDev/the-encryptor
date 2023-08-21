//
//  String.swift
//  Encryption
//
//  Created by Tommy Bartocci on 2/19/22.
//

import Foundation

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
    var isBlank: Bool {
        return allSatisfy({ $0.isWhitespace })
    }
}
