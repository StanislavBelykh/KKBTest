//
//  LogStack.swift
//  KubanKreditBankTest
//
//  Created by Полина on 24.12.2019.
//  Copyright © 2019 Станислав Белых. All rights reserved.
//

import Foundation

class  LogStack200 {
    
    static var logStack200 = [LogModel200]()
    
    static public func addLog(log: LogModel200){
        self.logStack200.append(log)
        
    }
}

