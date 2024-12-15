//
//  File1.swift
//  Raqeeb
//
//  Created by Fay Turad Madani on 14/06/1446 AH.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class UserData {
    var userName: String
    var userStatus: String
    var contactName: String
    var seizureDetails: [String]

    init(
        userName: String = "محمد",
        userStatus: String = "كيف حال صحتك اليوم؟",
        contactName: String = "أمي",
        seizureDetails: [String] = [
            "نوع النوبة: نوبة جزئية",
            "مدة النوبة: ٢:٣٣",
            "تاريخ النوبة: ٦/٦/١٤٤٦"
        ]
    ) {
        self.userName = userName
        self.userStatus = userStatus
        self.contactName = contactName
        self.seizureDetails = seizureDetails
    }
}
