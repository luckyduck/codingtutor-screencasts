//
//  ViewController.swift
//  TouchIdBeispiel
//
//  Created by Jan Brinkmann on 01/07/15.
//  Copyright (c) 2015 Jan Brinkmann. All rights reserved.
//

import UIKit
import LocalAuthentication


class ViewController: UIViewController {

    @IBOutlet var login: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        login.hidden = true
        startTouchId()
    }
    
    func startTouchId() {
        let authContext = LAContext()
        let msg = "Geschützter Bereich"
        
        var error: NSError?
        
        // geht es überhaupt? canEvaluatePolicy?
        if !authContext.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            println(error!.localizedDescription)
            login.hidden = false
            return
        }
        
        // mach es! evaluatePolicy
        authContext.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: msg) { (success: Bool, error: NSError!) -> Void in
            
            if !success {
                switch error.code {
                case LAError.AuthenticationFailed.rawValue:
                    println("AuthenticationFailed")
                case LAError.PasscodeNotSet.rawValue:
                    println("PasscodeNotSet")
                case LAError.SystemCancel.rawValue:
                    println("SystemCancel")
                case LAError.UserCancel.rawValue:
                    println("UserCancel")
                case LAError.TouchIDNotEnrolled.rawValue:
                    println("TouchIDNotEnrolled")
                case LAError.TouchIDNotAvailable.rawValue:
                    println("TouchIDNotAvailable")
                case LAError.UserFallback.rawValue:
                    println("UserFallback")
                    
                default:
                    println(error!.localizedDescription)
                }
                
                NSOperationQueue.mainQueue().addOperationWithBlock({
                    self.login.hidden = false
                })
                
                return
            }
            
            println("TouchID hat funktioniert!")
            NSOperationQueue.mainQueue().addOperationWithBlock({
                self.performSegueWithIdentifier("goToApp", sender: nil)
            })
        }
    }
}

