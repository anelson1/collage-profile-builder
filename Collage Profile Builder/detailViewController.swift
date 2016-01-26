//
//  detailViewController.swift
//  Collage Profile Builder
//
//  Created by Student on 1/26/16.
//  Copyright © 2016 Dank Memes and Son International Shipping Company Express. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var numberOfStudentsTextFIeld: UITextField!
    @IBOutlet weak var image: UIImageView!
       
    var colleg : ClassOfCollages!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = colleg.name
        stateTextField.text = colleg.state
        numberOfStudentsTextFIeld.text = String(colleg.numberOfStudents)
        image.image = colleg.image

        // Do any additional setup after loading the view.
    }

    @IBAction func onSavedTappedAgain(sender: AnyObject) {
        colleg.name = nameTextField.text!
        colleg.state = stateTextField.text!
        colleg.numberOfStudents = Int(numberOfStudentsTextFIeld.text!)!
    }
    @IBAction func onSaveTapped(sender: AnyObject) {
       
    }
}
