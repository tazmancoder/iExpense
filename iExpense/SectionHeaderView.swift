//
//  SectionHeaderView.swift
//  iExpense
//
//  Created by Mark Perryman on 5/21/22.
//

import SwiftUI

struct SectionHeaderView: View {
    let headerName: String
    var body: some View {
        HStack(alignment: .center) {
            Text(verbatim: headerName)
                .font(.subheadline)
                .fontWeight(.regular)
                .foregroundColor(Color.secondary)
            Spacer()
        }
        // MDK03-01-22: This modifier honor the original text case,
        // keeps it lowercase with first letter capitalized
        .textCase(nil)
    }
}

