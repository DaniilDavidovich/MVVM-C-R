//
//  FirstTabViewModel.swift
//  Debt Tracker
//
//  Created by Daniil Davidovich on 27.09.23.
//

import Foundation

struct FirstTabModel {
    var name: String
    var ears: Int?
}

class FirstTabViewModel {
    var model = FirstTabModel(name: "", ears: nil)
}
