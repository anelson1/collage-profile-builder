//
//  detailViewController.swift
//  Collage Profile Builder
//
//  Created by Student on 1/26/16.
//  Copyright © 2016 Dank Memes and Son International Shipping Company Express. All rights reserved.
//

import UIKit
import SafariServices

class detailViewController: UIViewController, SFSafariViewControllerDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate  {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var numberOfStudentsTextFIeld: UITextField!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var urlTextField: UITextField!
       
    var colleg : ClassOfCollages!
     let imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = colleg.name
        stateTextField.text = colleg.state
        numberOfStudentsTextFIeld.text = String(colleg.numberOfStudents)
        image.image = colleg.image
        urlTextField.text = String(colleg.url!)
        imagePicker.delegate = self
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true) { () -> Void in
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.image.image = selectedImage

        }
    }
    @IBAction func onSavedTappedAgain(sender: AnyObject) {
        colleg.name = nameTextField.text!
        colleg.state = stateTextField.text!
        colleg.numberOfStudents = Int(numberOfStudentsTextFIeld.text!)!
        colleg.url = NSURL(string: urlTextField.text!)
        colleg.image = image.image
    }
    @IBAction func onSaveTapped(sender: AnyObject) {
       
    }
    
    @IBAction func onGoButtonTapped(sender: AnyObject) {
        let svc = SFSafariViewController(URL: colleg.url!)
        svc.delegate = self
        self.presentViewController(svc, animated: true, completion: nil)

    }
    
    @IBAction func onLibaryTapped(sender: AnyObject) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func onScreenTapped(sender: AnyObject) {
        urlTextField.resignFirstResponder()
    }
    }
    

