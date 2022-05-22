//
//  ContentView.swift
//  iExpense
//
//  Created by Mark Perryman on 5/21/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var expenses: Expenses
    @State private var showAddView = false

    var sectionedData: [[ExpenseItem]] {
        let dictionaryByType = Dictionary(grouping: expenses.items, by: { $0.type })
        return [dictionaryByType["Personal"], dictionaryByType["Business"]].compactMap({ $0 })
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(sectionedData, id: \.self) { section in
                    Section(header: SectionHeaderView(headerName: section[0].type)) {
                        ForEach(section) { expense in
                            ExpenseItemRow(expenseItem: expense)
                        }
                        .onDelete(perform: { offsets in removeItems(at: offsets, in: section) })
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button(action: { showAddView.toggle() }, label: {
                            Image(systemName: "plus")
                        })

                        EditButton()
                    }
                }
            }
            .sheet(isPresented: $showAddView) {
                AddView(expenses: expenses)
            }
        }
    }

    private func removeItems(at offsets: IndexSet, in expanseItems: [ExpenseItem]) {
        let expensesToDelete = offsets.map({ expanseItems[$0] })
        for _ in expensesToDelete {
            expenses.items.remove(atOffsets: offsets)
        }
    }
}

