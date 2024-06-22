//
//  ContentView.swift
//  SplitSmart
//
//  Created by Sunghee Bang on 2024-06-22.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var selectedTab: Constants.Tab = .groups
    var body: some View {
        TabView(selection: $selectedTab) {
            GroupListView()
                .tabItem {
                    Label("Groups", systemImage: "house")
                }
                .tag(Constants.Tab.groups)
            AddExpenseView(selectedTab: $selectedTab)
                .tabItem {
                    Label("+", systemImage: "flag")
                }
                .tag(Constants.Tab.addExpense)
            ActivitiesView()
                .tabItem {
                    Label("Activity", systemImage: "flag")
                }
                .tag(Constants.Tab.activities)
            GroupListView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(Constants.Tab.settings)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Group.self, Expense.self, ExpenseAllocation.self])
}
