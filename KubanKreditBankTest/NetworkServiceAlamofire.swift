//
//  NetworkServiceAlamofire.swift
//  KubanKreditBankTest
//
//  Created by Полина on 25.12.2019.
//  Copyright © 2019 Станислав Белых. All rights reserved.
//

import Foundation
import Alamofire
import SwiftUI

class NetworkServiceAlamofire{
    
    
    private var baseURL = "https://portal.kubankredit.ru"
    
    static let session: SessionManager = {
    let config = URLSessionConfiguration.default
    config.timeoutIntervalForRequest = 60
    let session = SessionManager(configuration: config)
    return session
    }()
    
    public func sendRequest(completionHandler: @escaping () -> ()) {
        let path = "/backend/rest/stateful/personal/ping"
        
        NetworkServiceAlamofire.session.request(baseURL + path, method: .get, parameters: nil).responseJSON {
            response in
            let statusCode = response.response?.statusCode ?? 000
            let date = response.response?.value(forHTTPHeaderField: "Date") ?? "Date"
            
            switch response.result {
            case .success(let value):
                //Ответ с данными JSON
                guard let log200 = LogModel200(json: value as! [String : Any]) else { return }
                LogStack200.addLog(log: log200)
                //Записываем в общую модель ответа
                let log = LogModel(statusCode: statusCode, date: date, maxInterval: log200.maxInterval, remainingSessionSeconds: log200.remainingSessionSeconds, errorDescription: nil)
                LogStack.addLog(log: log)
                
                completionHandler()

            case .failure(let error):
                
                let log = LogModel(statusCode: statusCode, date: date, maxInterval: nil, remainingSessionSeconds: nil, errorDescription: error.localizedDescription)
                LogStack.addLog(log: log)
                completionHandler()
                print(statusCode)
                print(error)
            }
        }
        
    }
}
