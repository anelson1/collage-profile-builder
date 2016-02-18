//
//  MapViewController.swift
//  Collage Profile Builder
//
//  Created by Student on 2/11/16.
//  Copyright © 2016 Dank Memes and Son International Shipping Company Express. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var textView: UITextField!
    @IBOutlet weak var mapView: MKMapView!
     var colleg : ClassOfCollages!
    var collages : [ClassOfCollages] = []
    
    var location = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
    
        findLocation(location)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let locationName = textField.text!
        textField.resignFirstResponder()
        findLocation(locationName)
        return true
    }
    func findLocation(locationName: String){
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(locationName) { (placemarks, error) -> Void in
            if error != nil{
                print(error)
                
            }
            else {
                if placemarks!.count > 1{
                    let alert = UIAlertController(title: "Select Location", message: nil, preferredStyle: .ActionSheet)
                    for placemark in placemarks!
                    {
                        let locationAction = UIAlertAction(title: placemark.name!, style: .Default, handler: { (action) -> Void in
                            self.displaMap(placemark)
                        })
                    }
                }
                else if placemarks?.count == 1 {
                    let placemark = placemarks!.first as CLPlacemark!
                    self.displaMap(placemark)
                }
                
            }
        }
    }
    
    func displaMap(placemark: CLPlacemark)
    {
        textView.text = placemark.name
        let center = placemark.location!.coordinate
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(center, span)
        let pin = MKPointAnnotation()
        pin.coordinate = center
        pin.title = placemark.name
        mapView.addAnnotation(pin)
        mapView.setRegion(region, animated: true)
    }
    
    
}
