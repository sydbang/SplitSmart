//
//  ExpenseModel.swift
//  SplitSmart
//
//  Created by Sunghee Bang on 2024-06-22.
//

import Foundation
import SwiftData

@Observable
class ExpenseModel {
    var modelContext: ModelContext
    var allExpenseList: [Expense] = [] // will be used for activities
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchData()
    }
    
    func fetchData() {
        do {
            let descriptor = FetchDescriptor<Expense>(sortBy: [SortDescriptor(\.lastUpdatedDate)])
            allExpenseList = try modelContext.fetch(descriptor)
        } catch {
            print("Fetch failed")
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        return numberFormatter
    }()
}
