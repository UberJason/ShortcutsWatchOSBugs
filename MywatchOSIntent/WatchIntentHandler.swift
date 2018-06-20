//
//  WatchIntentHandler.swift
//  MywatchOSIntent
//
//  Created by Ji,Jason on 6/20/18.
//  Copyright © 2018 Capital One Labs. All rights reserved.
//

import Intents

class WatchIntentHandler: INExtension, DoSomethingIntentHandling {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
//    func confirm(intent: DoSomethingIntent, completion: @escaping (DoSomethingIntentResponse) -> Void) {
//        print("Confirmed!")
//        completion(DoSomethingIntentResponse(code: .success, userActivity: nil))
//    }
    
    func handle(intent: DoSomethingIntent, completion: @escaping (DoSomethingIntentResponse) -> Void) {
        print("Handled!")
        completion(DoSomethingIntentResponse(code: .success, userActivity: nil))
    }
    
}
