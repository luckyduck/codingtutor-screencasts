//
//  ViewController.swift
//  Stoppuhr
//
//  Created by Jan Brinkmann on 12/06/15.
//  Copyright (c) 2015 Jan Brinkmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    
    var lastInterval = NSTimeInterval()
    var timer = NSTimer()
    var totalTime = NSTimeInterval()
    
    @IBAction func resetTapped(sender: AnyObject) {
        timer.invalidate()
        timerLabel.text = "00:00:00"
        totalTime = NSTimeInterval()
    }
    
    @IBAction func startStopTapped(sender: AnyObject) {
        if !timer.valid {
            let timerSelector: Selector = "timerUpdate"
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01,
                target: self,
                selector: timerSelector,
                userInfo: nil,
                repeats: true)
            lastInterval = NSDate.timeIntervalSinceReferenceDate()
        } else {
            timer.invalidate()
        }
    }
    
    func timerUpdate() {
        let elements = getTimerElements()
        let min = elements.minuten
        let sec = elements.sekunden
        let milli = elements.milli
        
        timerLabel.text = "\(min):\(sec):\(milli)"
    }
    
    func getTimerElements() -> (minuten: String, sekunden: String, milli: String) {
        
        let now = NSDate.timeIntervalSinceReferenceDate()
        // 10000-9997 = 3
        totalTime += now - lastInterval
        // 10003-10000 = 3
        lastInterval = now
        
        var displayTime = totalTime
        // minuten
        let min = Int(displayTime / 60)
        displayTime -= (NSTimeInterval(min) * 60)
        let minStr = String(format: "%02d", min)
        
        // minuten
        let sec = Int(displayTime)
        displayTime -= (NSTimeInterval(sec))
        let secStr = String(format: "%02d", sec)
        
        // milli
        let milli = Int(displayTime * 100)
        let milliStr = String(format: "%02d", milli)
        
        return (minStr, secStr, milliStr)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

