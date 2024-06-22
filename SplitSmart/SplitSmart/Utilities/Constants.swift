//
//  Constants.swift
//  SplitSmart
//
//  Created by Sunghee Bang on 2024-06-22.
//

import Foundation

struct Constants {
    enum expenseType: Codable {
        case share, percentage, exactValue
    }
    
    enum Tab {
        case groups, addExpense, settings, activities
    }
}
