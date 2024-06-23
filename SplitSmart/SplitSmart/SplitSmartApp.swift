//
//  SplitSmartApp.swift
//  SplitSmart
//
//  Created by Sunghee Bang on 2024-06-22.
//

import SwiftUI
import SwiftData

@main
struct SplitSmartApp: App {
    let container: ModelContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView(modelContext: container.mainContext)
        }
        .modelContainer(container)
    }
    
    init() {
        do {
            container = try ModelContainer(for: Group.self, Expense.self, ExpenseAllocation.self)
        } catch {
            fatalError("Failed to create model container.")
        }
    }
}
