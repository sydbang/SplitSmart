//
//  Expense.swift
//  SplitSmart
//
//  Created by Sunghee Bang on 2024-06-22.
//

import Foundation

struct Expense {
    var payerId: String
    var amount: Double
    var currency: String
    var expenseAllocation: ExpenseAllocation
}

struct ExpenseAllocation {
    var userId: String
    var type: Constants.expenseType
    var value: Double
}
