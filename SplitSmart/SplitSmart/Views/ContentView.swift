//
//  ContentView.swift
//  SplitSmart
//
//  Created by Sunghee Bang on 2024-06-22.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var expenseModel = ExpenseModel()
    @State private var groupModel: GroupModel
    @State var personModel = PersonModel()
    
    @State private var selectedTab: Constants.Tab = .groups
    var body: some View {
        TabView(selection: $selectedTab) {
            GroupAndPeopleListView()
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
//        .environment(expenseModel)
        .environment(groupModel)
//        .environment(personModel)
    }
    
    init(modelContext: ModelContext) {
//        let expenseModel = ExpenseModel(modelContext: modelContext)
//        _groupModel = State(initialValue: groupModel)
        let groupModel = GroupModel(modelContext: modelContext)
        _groupModel = State(initialValue: groupModel)
//        let personModel = GroupModel(modelContext: modelContext)
//        _personModel = State(initialValue: groupModel)
    }
}

//#Preview {
//    ContentView()
//        .modelContainer(for: [Group.self, Expense.self, ExpenseAllocation.self])
//}
