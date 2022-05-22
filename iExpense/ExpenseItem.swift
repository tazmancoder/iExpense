//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Mark Perryman on 5/21/22.
//

import Foundation
import SwiftUI

struct ExpenseItem: Identifiable, Codable, Hashable {
    var id: UUID
    let name: String
    let type: String
    let amount: Double

    init(id: UUID, name: String, type: String, amount: Double) {
        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
    }
}
