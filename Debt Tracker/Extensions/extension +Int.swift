//
//  extension +Int.swift
//  Debt Tracker
//
//  Created by Daniil Davidovich on 14.10.23.
//

import Foundation

extension Int? {
    func toString() -> String {
        return String(self ?? 0)
    }
}
