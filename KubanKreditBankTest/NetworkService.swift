////
////  NetworkService.swift
////  KubanKreditBankTest
////
////  Created by Полина on 24.12.2019.
////  Copyright © 2019 Станислав Белых. All rights reserved.
////
//
//import Foundation
//import SwiftUI
//
//class NetworkService {
//    
//    @EnvironmentObject var logStack: LogStack
//    
//    public func sendRequest(){
//        
//        var urlComponents = URLComponents()
//        urlComponents.scheme = "https"
//        urlComponents.host = "portal.kubankredit.ru"
//        urlComponents.path = "/backend/rest/stateful/personal/ping"
//        //Параметры запроса
//        urlComponents.queryItems = []
//        
//        //Проверка составления ссылки
//        guard let url = urlComponents.url else { fatalError("URL is not correct")}
//        
//        //Настройки запроса
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        
//        //Настройки конфигурации
//        let configuration = URLSessionConfiguration.default
//        configuration.allowsCellularAccess = true
//        
//        
//        let session = URLSession(configuration: configuration)
//        
//        let task = session.dataTask(with: url) { (data, response, error) in
//            //проверяем стутус запроса
//            if let HTTPResponce = response as? HTTPURLResponse {
//                let statusCode = HTTPResponce.statusCode
//                let date = HTTPResponce.value(forHTTPHeaderField: "Date")
//                
//                switch statusCode {
//                
//                case 200:
//                    guard let data = data else { return }
//
//                    let decoder = JSONDecoder()
//                    
//                    do {
//                        let logData = try decoder.decode(LogModel200.self, from: data)
//                        
//                        
//                        let log = LogModel(statusCode: statusCode, date: date ?? "Date", maxInterval: logData.maxInterval, remainingSessionSeconds: logData.remainingSessionSeconds, errorDescription: nil)
//                        
//                        
//                        self.logStack.addLog(log: log)
//                        
//                    } catch {
//                        print(error.localizedDescription)
//                    }
//                    
//                case 401,461:
//                    let log = LogModel(statusCode: statusCode, date: date ?? "Date", maxInterval: nil, remainingSessionSeconds: nil, errorDescription: "Error 401/406")
//                    self.logStack.addLog(log: log)
//                    print("Предупредждение")
//                case 500:
//                    print("Ошибка сервера")
//                default:
//                    print("Неизвестная ошибка")
//                }
//                print(HTTPResponce.description)
//            }
//        }
//        task.resume()
//    }
//}
