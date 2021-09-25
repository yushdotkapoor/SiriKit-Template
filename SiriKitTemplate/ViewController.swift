//
//  ViewController.swift
//  SiriKitTemplate
//
//  Created by Yush Raj Kapoor on 9/25/21.
//

import UIKit
import IntentsUI

let data = UserDefaults(suiteName: "group.SiriKit-Template.yushrajkapoor")

class ViewController: UIViewController {
    
    /*
     Requires Info.plist privacy changes!!!
     Privacy - Siri Usage Description
     */

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let test = data?.string(forKey: "test") ?? ""
        print("Here is the test: \(test)")
        addSiriButton(to: self.view)
    }
    
    
    func addSiriButton(to view: UIView) {
        let button = INUIAddVoiceShortcutButton(style: .automaticOutline)
        button.delegate = self
        button.shortcut = INShortcut(intent: intent)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        view.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
        button.isUserInteractionEnabled = true
        
    }

}

extension ViewController {
    public var intent: GeneralIntent {
        let testIntent = GeneralIntent()
        testIntent.suggestedInvocationPhrase = "Watermelon"
        return testIntent
    }
}

extension ViewController: INUIAddVoiceShortcutButtonDelegate {
    
    public func present(_ addVoiceShortcutViewController: INUIAddVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
        addVoiceShortcutViewController.delegate = self
        addVoiceShortcutViewController.modalPresentationStyle = .formSheet
        present(addVoiceShortcutViewController, animated: true, completion: nil)
    }
    
    
    public func present(_ editVoiceShortcutViewController: INUIEditVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
        editVoiceShortcutViewController.delegate = self
        editVoiceShortcutViewController.modalPresentationStyle = .formSheet
        present(editVoiceShortcutViewController, animated: true, completion: nil)
    }
    
    
}

extension ViewController: INUIAddVoiceShortcutViewControllerDelegate {
    
    public func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    public func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
}

extension ViewController: INUIEditVoiceShortcutViewControllerDelegate {
    
    public func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController, didUpdate voiceShortcut: INVoiceShortcut?, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    public func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController, didDeleteVoiceShortcutWithIdentifier deletedVoiceShortcutIdentifier: UUID) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    public func editVoiceShortcutViewControllerDidCancel(_ controller: INUIEditVoiceShortcutViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
