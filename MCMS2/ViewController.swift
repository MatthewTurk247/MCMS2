//
//  ViewController.swift
//  MCMS2
//
//  Created by Matthew Turk on 4/12/15.
//  Copyright (c) 2015 Turk Enterprises. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var creatureTextField: UITextField!
    
    @IBAction func addCell(sender: UIBarButtonItem) {
        var creaturesTextFieldText:String = creatureTextField.text
        //take the creaturesTextField.text and append to creatures NSMutableArray
        creatures.addObject(creaturesTextFieldText)
        //refresh the tableviewcell, which hopefully adds the new cell in the process?
        NSLog("%@", creatures);
        creatureTableView.reloadData()
        
    }
    @IBAction func creatureTableAction(sender: AnyObject) {
        
        creatures.addObject(creatureTextField.text)
        
    }
    @IBOutlet weak var creatureTableView: UITableView!
    let creatures:NSMutableArray = ["Abominable Snowman", "Bigfoot", "Mitochondrion"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        creatureTableView.delegate = self
        for (index, creature) in enumerate(creatures) {
            
            println("\(index + 1): \(creature)")
            
        }
    }
    
    func insertNewObject(sender: AnyObject) {
        creatures.insertObject(NSDate(), atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.creatureTableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        textFieldShouldReturn(creatureTextField)
        println("#2ndLawOfThermodynamics")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true);
        return false;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creatures.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.creatureTableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
//        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = self.creatures[indexPath.row] as! String;
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            //UIAlertView
            //UIAlertView(title: "Delete", message: "Are you sure you want to delete?", delegate: self, cancelButtonTitle: "No", otherButtonTitles: "Yes")
            creatures.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }

    }

}