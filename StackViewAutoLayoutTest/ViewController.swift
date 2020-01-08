//
//  ViewController.swift
//  StackViewAutoLayoutTest
//
//  Created by TechFun on 11/22/19.
//  Copyright © 2019 MyintZu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nrcLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phonenoLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var nametxtfield: UITextField!
    @IBOutlet weak var nrctxtfield: UITextField!
    @IBOutlet weak var emailtxtfield: UITextField!
    @IBOutlet weak var phonenotxtfield: UITextField!
    @IBOutlet weak var addresstxtfield: UITextField!
    @IBOutlet weak var classtxtfield: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillValue()
        self.addDoneButtonOnKeyboard()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view.
    }

    private func fillValue(){
        nameLabel.text = "Name"
        nrcLabel.text = "NRC"
        emailLabel.text = "Email"
        phonenoLabel.text = "PhoneNo"
        addressLabel.text = "Address"
        classLabel.text = "Class"
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        nextButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        nextButton.layer.cornerRadius = 5
    }
    
    func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        nametxtfield.inputAccessoryView = doneToolbar
        nrctxtfield.inputAccessoryView = doneToolbar
        emailtxtfield.inputAccessoryView = doneToolbar
        phonenotxtfield.inputAccessoryView = doneToolbar
        addresstxtfield.inputAccessoryView = doneToolbar
        classtxtfield.inputAccessoryView = doneToolbar
    }

    @objc func doneButtonAction(){
        nametxtfield.resignFirstResponder()
        nrctxtfield.resignFirstResponder()
        emailtxtfield.resignFirstResponder()
        phonenotxtfield.resignFirstResponder()
        addresstxtfield.resignFirstResponder()
        classtxtfield.resignFirstResponder()
    }
    
    @objc func keyboardWillShow(notification: Notification) {
    if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
    print("notification: Keyboard will show")
    if self.view.frame.origin.y == 0{
        print(self.view.frame.origin.y)
    self.view.frame.origin.y -= keyboardSize.height
    }
    }
    }

    @objc func keyboardWillHide(notification: Notification) {
    if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
    if self.view.frame.origin.y != 0 {
    self.view.frame.origin.y += keyboardSize.height
    }
    }
    }
    
    @IBAction func onGoButton(_ sender: Any) {
        performSegue(withIdentifier: "GoSecondView", sender: self)
    }
    
}

