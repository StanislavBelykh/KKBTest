//
//  LogStack.swift
//  KubanKreditBankTest
//
//  Created by Полина on 28.12.2019.
//  Copyright © 2019 Станислав Белых. All rights reserved.
//

import Foundation

class  LogStack {

    static var logStack = [LogModel]()
    
    static public func addLog(log: LogModel){
        self.logStack.append(log)
        
    }
}
