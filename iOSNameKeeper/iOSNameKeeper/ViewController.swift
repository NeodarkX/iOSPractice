//
//  ViewController.swift
//  iOSNameKeeper
//
//  Created by Alumnos on 8/06/16.
//  Copyright © 2016 UPC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var platformPickerView: UIPickerView!
    
    let NAME_KEY = "Name"
    let PLATFORM_KEY = "Platform"
    var userDefaults = NSUserDefaults.standardUserDefaults()
    
    let platforms = ["iOS","Android","Windows"]
    var selectedPlatform: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        platformPickerView.delegate = self
        platformPickerView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
        restoreDefaults()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return platforms.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return platforms[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPlatform = row
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func trashButtonAction(sender: AnyObject) {
        nameTextField.text = ""
        platformPickerView.selectRow(0, inComponent: 0, animated: true)
        userDefaults.removeObjectForKey(NAME_KEY)
        userDefaults.removeObjectForKey(PLATFORM_KEY)
        
    }
    
    @IBAction func saveButtonAction(sender: AnyObject) {
        userDefaults.setObject(nameTextField.text, forKey: NAME_KEY)
        userDefaults.setInteger(selectedPlatform, forKey: PLATFORM_KEY)
    }
    
    func restoreDefaults(){
        if let storedName = userDefaults.objectForKey(NAME_KEY){
            nameTextField.text = storedName as? String
        }
        platformPickerView.selectRow(userDefaults.integerForKey(PLATFORM_KEY), inComponent: 0, animated: true)
    }
    
    

}

