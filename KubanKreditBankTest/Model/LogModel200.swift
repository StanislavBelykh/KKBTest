//
//  LogModel200.swift
//  KubanKreditBankTest
//
//  Created by Полина on 24.12.2019.
//  Copyright © 2019 Станислав Белых. All rights reserved.
//

import Foundation

struct LogModel200 {
    let id = UUID()

    let maxInterval: Int?
    let remainingSessionSeconds: Int?
    
    init?(json: [String: Any]){
        guard
            let maxInterval = json["maxInterval"] as? Int,
            let remainingSessionSeconds = json["remainingSessionSeconds"] as? Int
        else {
            return nil
        }
        
        self.maxInterval = maxInterval
        self.remainingSessionSeconds = remainingSessionSeconds
    }
}
