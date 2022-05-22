//
//  AddView.swift
//  iExpense
//
//  Created by Mark Perryman on 5/21/22.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0

    let types = ["Business", "Personal"]

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)

                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }

                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add New Expense")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { dismiss() }, label: {
                        Text("Close")
                    })
                }

                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        let item = ExpenseItem(id: UUID(), name: name, type: type, amount: amount)
                        expenses.items.append(item)
                        
                        dismiss()
                    }, label: {
                        Text("Add")
                    })
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
