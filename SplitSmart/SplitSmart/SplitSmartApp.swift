//
//  SplitSmartApp.swift
//  SplitSmart
//
//  Created by Sunghee Bang on 2024-06-22.
//

import SwiftUI

@main
struct SplitSmartApp: App {
        
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: [Group.self, Expense.self, ExpenseAllocation.self])
    }
}
