//
//  ExpenseModel.swift
//  SplitSmart
//
//  Created by Sunghee Bang on 2024-06-22.
//

import Foundation

@Observable
class ExpenseModel {
    var allExpenseList: [Expense] = [] // will be used for activities
    
    
    let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        return numberFormatter
    }()
}
