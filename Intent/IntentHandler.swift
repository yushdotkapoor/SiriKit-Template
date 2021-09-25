//
//  IntentHandler.swift
//  Intent
//
//  Created by Yush Raj Kapoor on 9/25/21.
//

import Intents

let data = UserDefaults(suiteName: "group.SiriKit-Template.yushrajkapoor")
class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        if intent is GeneralIntent {
            return GeneralIntentHandler()
        } else {
            fatalError("Unhandled Intent error : \(intent)")
        }
        
    }
    
}
