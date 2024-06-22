//
//  AddExpenseView.swift
//  SplitSmart
//
//  Created by Sunghee Bang on 2024-06-22.
//

import SwiftUI

struct AddExpenseView: View {
    @Binding var selectedTab: Constants.Tab
    @State private var detail = ""
    @State private var amount: Double?
    
    private let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        return numberFormatter
    }()
    
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
                Spacer()
                Button(action: {
                    //TODO: disable this button until all data required has been entered
                    //TODO: actual save the data to db
                }, label: {
                    Text("Save")
                })
            }
            TextField("Enter detail", text: $detail)
            TextField("0.00", value: $amount, formatter: numberFormatter)
                .keyboardType(.decimalPad)
        }.padding()
    }
}

#Preview {
    AddExpenseView(selectedTab: Binding.constant(Constants.Tab.addExpense))
}
