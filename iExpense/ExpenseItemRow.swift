//
//  ExpenseItemRow.swift
//  iExpense
//
//  Created by Mark Perryman on 5/21/22.
//

import SwiftUI

struct ExpenseItemRow: View {
    var expenseItem: ExpenseItem

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(expenseItem.name)
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(.black)

                Text(expenseItem.type)
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Text(expenseItem.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                .modifier(ItemExpenseModifier(item: expenseItem))

        }
    }
}

struct ItemExpenseModifier: ViewModifier {
    let item: ExpenseItem

    func body(content: Content) -> some View {
        content
            .font(.body.weight(.semibold))
            .foregroundColor(item.amount < 10 ? .blue : item.amount > 100 ? .red : .orange)
    }
}

