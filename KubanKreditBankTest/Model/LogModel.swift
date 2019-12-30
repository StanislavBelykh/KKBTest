//
//  LogModel.swift
//  KubanKreditBankTest
//
//  Created by Полина on 24.12.2019.
//  Copyright © 2019 Станислав Белых. All rights reserved.
//

import Foundation

struct LogModel {
    
    let id = UUID()
    
    let statusCode: Int
    let date: String
    
    let maxInterval: Int?
    let remainingSessionSeconds: Int?
    let errorDescription: String?
    
    var remainingSessionSecondsValue: String {
        get{
            if remainingSessionSeconds != nil {
                return String(remainingSessionSeconds!)
            }
            return "Нет данных"
        }
    }

}
