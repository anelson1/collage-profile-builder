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
    var collages = ["University Of Illinois", "Airforce Acadamy", "Harvard"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collages.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        cell.textLabel?.text = collages[indexPath.row]
        return cell
    }

}
