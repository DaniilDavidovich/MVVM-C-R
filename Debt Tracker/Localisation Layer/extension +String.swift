//
//  extension +String.swift
//  Debt Tracker
//
//  Created by Daniil Davidovich on 14.10.23.
//

import Foundation

extension String {
    func localised() -> String {
        NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
