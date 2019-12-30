//
//  ContentView.swift
//  KubanKreditBankTest
//
//  Created by Полина on 24.12.2019.
//  Copyright © 2019 Станислав Белых. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    let netWorkingService = NetworkServiceAlamofire()

    @State var logStack = [LogModel]()
    @EnvironmentObject var logList: LogList
    
    var body: some View {
        VStack{
            Text("Hello, World!")
            Button("Start") {
                self.netWorkingService.sendRequest(){
                    self.logList.logList = LogStack.logStack
                }
                print(LogStack.logStack.count)
            }//Button
            List(self.logList.logList, id: \.id){ log in
                HStack {
                    Text("\(String(log.statusCode))")
                    Text("\(String(log.date))")
                    Text("\(log.remainingSessionSecondsValue)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
