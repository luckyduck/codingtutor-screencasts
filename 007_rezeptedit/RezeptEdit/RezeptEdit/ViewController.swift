//
//  ViewController.swift
//  RezeptEdit
//
//  Created by Jan Brinkmann on 19/06/15.
//  Copyright (c) 2015 Jan Brinkmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var meineRezepte = [Rezept]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let pancakes = Rezept(name: "Pancakes")
        meineRezepte.append(pancakes)
        
        let spinat = Rezept(name: "Spinat mit Lachs")
        meineRezepte.append(spinat)
        
        let tofu = Rezept(name: "Tofu mit Kurkuma")
        meineRezepte.append(tofu)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let indexPath = sender as! NSIndexPath
        let rezept = meineRezepte[indexPath.row]

        let ctrl = segue.destinationViewController as! DetailViewController
        ctrl.meinRezept = rezept
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return meineRezepte.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("rezeptCell") as! UITableViewCell
        
        cell.textLabel?.text = meineRezepte[indexPath.row].name
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("edit", sender: indexPath)
    }
}

