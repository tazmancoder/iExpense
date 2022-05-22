//
//  Expenses.swift
//  iExpense
//
//  Created by Mark Perryman on 5/21/22.
//

import Foundation

class Expenses: ObservableObject, Identifiable {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()

            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }

    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()

            if let decodedItems = try? decoder.decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }

        items = []
    }
}
