//
//  ViewController.swift
//  SingleApplication
//
//  Created by Alumnos on 5/31/16.
//  Copyright © 2016 Alumnos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var skillSlider: UISlider!
    @IBOutlet weak var welcomeLabel: UILabel!
    let DEFAULT_MESSAGE = "Please write your name. "+"Use the slider to indicate your development skill level."+"Let's start!"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        welcomeLabel.text=DEFAULT_MESSAGE
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func trashAction(sender: AnyObject) {
        nameTextField.text = ""
        skillSlider.value = 0
        welcomeLabel.text = DEFAULT_MESSAGE
    }

    @IBAction func addAction(sender: AnyObject) {
        let nameParagraph = nameTextField.text!.isEmpty ? "Don't be shy, write your name.": "Welcome "+nameTextField.text!+"! "
        var skillParagraph: String
        switch skillSlider.value{
        case 0: skillParagraph = "Please share how do you rate your development skill."
        case 50...skillSlider.maximumValue: skillParagraph = "You are a great Developer"
        default: skillParagraph = "You are a raising star!"
        }
        welcomeLabel.text = nameParagraph+"\n"+skillParagraph
    }
    @IBAction func didEndOnExitAction(sender: AnyObject) {
        self.view.endEditing(true);
    }

}

