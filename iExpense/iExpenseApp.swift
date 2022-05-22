//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Mark Perryman on 5/21/22.
//

import SwiftUI

@main
struct iExpenseApp: App {
    @StateObject var expenses = Expenses()

    var body: some Scene {
        WindowGroup {
            ContentView(expenses: expenses)
        }
    }
}
