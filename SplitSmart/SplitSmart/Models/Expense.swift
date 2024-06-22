//
//  Expense.swift
//  SplitSmart
//
//  Created by Sunghee Bang on 2024-06-22.
//

import Foundation
import SwiftData

@Model
class Expense {
    var creationDate: Date
    var paymentDate: Date
    var lastUpdatedDate: Date
    var payerId: String
    var amount: Double
    var currency: String
    var expenseAllocation: [ExpenseAllocation]
    
    init(payerId: String, amount: Double, currency: String, expenseAllocation: [ExpenseAllocation]) {
        self.creationDate = Date()
        self.paymentDate = Date()
        self.lastUpdatedDate = Date()
        self.payerId = payerId
        self.amount = amount
        self.currency = currency
        self.expenseAllocation = expenseAllocation
    }
}

@Model
class ExpenseAllocation {
    var userId: String
    var type: Constants.expenseType
    var value: Double
    
    init(userId: String, type: Constants.expenseType, value: Double) {
        self.userId = userId
        self.type = type
        self.value = value
    }
}
