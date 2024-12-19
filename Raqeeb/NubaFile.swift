//
//  NubaFile.swift
//  Raqeeb
//
//  Created by Fay Turad Madani on 17/06/1446 AH.
//

import Foundation
//
//  NubaFile.swift
//  ContentView
//
//  Created by Fay Turad Madani on 17/06/1446 AH.
//


import SwiftData
import Foundation

@Model
class Nuba {
    var type: String
    var duration: String
    var date: String

    init(type: String, duration: String, date: String) {
        self.type = type
        self.duration = duration
        self.date = date
    }
}

