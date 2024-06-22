//
//  AddExpenseView.swift
//  SplitSmart
//
//  Created by Sunghee Bang on 2024-06-22.
//

import SwiftUI

struct AddExpenseView: View {
    @Binding var selectedTab: Constants.Tab
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    selectedTab = .activities
                }, label: {
                    Text("X")
                })
                Spacer()
                Text("add an expense")
            }
        }
    }
}

#Preview {
    AddExpenseView(selectedTab: Binding.constant(Constants.Tab.addExpense))
}
