//
//  ViewController.swift
//  Collage Profile Builder
//
//  Created by Student on 1/20/16.
//  Copyright © 2016 Dank Memes and Son International Shipping Company Express. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tabeView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var collages : [ClassOfCollages] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        editButton.tag = 0
        collages.append(ClassOfCollages(name: "Harverd", state: "Boston", numberOfStudents: 420000, image: UIImage(named: "harvard")!))
        collages.append(ClassOfCollages(name: "Air Force Acadamy", state: "Colorado", numberOfStudents: 7004, image: UIImage(named: "airforce")!))
        collages.append(ClassOfCollages(name: "Johns Hopkins", state: "Maryland", numberOfStudents: 7385485, image: UIImage(named: "johns")!))
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collages.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        cell.textLabel?.text = collages[indexPath.row].name
        return cell
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            collages.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }

    @IBAction func onPlusTapped(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add City", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add City Here"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Add", style: .Default) { (action) -> Void in
            let collageTextField = alert.textFields![0] as UITextField
            self.collages.append(ClassOfCollages(name: collageTextField.text!))
            self.tabeView.reloadData()
        }
        alert.addAction(addAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let collage = collages[sourceIndexPath.row]
        collages.removeAtIndex(sourceIndexPath.row)
        collages.insert(collage, atIndex: destinationIndexPath.row)
    }
    
    @IBAction func onEditTapped(sender: UIBarButtonItem) {
        if sender.tag == 0 {
            tabeView.editing = true
            sender.tag = 1
        }
        else {
            tabeView.editing = false
            sender.tag = 0
        }
    }
}
