//
//  GeneralIntentHandler.swift
//  Intent
//
//  Created by Yush Raj Kapoor on 9/25/21.
//

import Foundation
import Intents
import AVFoundation

class GeneralIntentHandler : NSObject, GeneralIntentHandling {

    func handle(intent: GeneralIntent, completion: @escaping (GeneralIntentResponse) -> Void) {
        print(intent)
        runCode()
        completion(GeneralIntentResponse(code: .success, userActivity: nil))
    }
    
    func runCode() {
      
        data?.setValue("It worked!!", forKey: "test")
     
        
    }
    
   
}
