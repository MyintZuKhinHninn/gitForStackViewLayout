//
//  ProfileViewController.swift
//  StackViewAutoLayoutTest
//
//  Created by TechFun on 12/18/19.
//  Copyright © 2019 MyintZu. All rights reserved.
//

import UIKit
import MaterialComponents
import MaterialComponents.MaterialChips

class ProfileViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,URLSessionDelegate,URLSessionTaskDelegate,UITextFieldDelegate {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileTxtField: MDCTextField!
    @IBOutlet weak var departTxtField: MDCTextField!
    @IBOutlet weak var roleTxtField: MDCTextField!
    @IBOutlet weak var NRCTxtField: MDCTextField!
    @IBOutlet weak var emailTxtField: MDCTextField!
    @IBOutlet weak var PhNoTxtField: MDCTextField!
    @IBOutlet weak var addressTxtField: MDCTextField!
    @IBOutlet weak var skillChipTxtField: MDCChipField!
    @IBOutlet weak var uploadBtn: UIButton!
    
    
    var ProfileTxtController: MDCTextInputControllerFilled?
    var DepartTxtController: MDCTextInputControllerFilled?
    var RoleTxtController: MDCTextInputControllerFilled?
    var NRCTxtController: MDCTextInputControllerFilled?
    var EmailTxtController: MDCTextInputControllerFilled?
    var PhnoTxtController: MDCTextInputControllerFilled?
    var AddressTxtController: MDCTextInputControllerFilled?
    
    let containerScheme = MDCContainerScheme()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Styling()
        //self.AddChips()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(gesture:)))
        profileImageView.addGestureRecognizer(tapGesture)
        profileImageView.isUserInteractionEnabled = true
    }
    
    @IBAction func showListAction(_ sender: Any) {
        self.validationMsg()
        
    }
    
    func isValidEmail(emailStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
    }
    
    private func isValidFormat(_ test: String) -> Bool {
        let pattern = "^[a-zA-Z -]*$"
        let patterntest = NSPredicate(format: "SELF MATCHES %@", pattern)
        let result = patterntest.evaluate(with: test)
        return result
    }
    
    func validationMsg() -> Bool{
        let providedEmailAddress = emailTxtField.text
        let isEmailAddressValid = isValidEmail(emailStr: providedEmailAddress!)
        if profileTxtField.text!.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty == true{
            showAlert("", message: "Enter Name", ViewController: self, ok: {})
            return false
        }else if isValidFormat(profileTxtField.text!) == false{
            showAlert("", message: "Name Invalid", ViewController: self, ok: {})
            return false
        }  else  if departTxtField.text!.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty == true{
            showAlert("", message: "Select Department", ViewController: self, ok: {})
            return false
        }
        else  if roleTxtField.text!.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty == true{
            showAlert("", message: "Select Role", ViewController: self, ok: {})
            return false
        }else  if NRCTxtField.text!.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty == true{
            showAlert("", message: "Enter NRC", ViewController: self, ok: {})
            return false
        }else  if emailTxtField.text!.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty == true{
            showAlert("", message: "Enter Email", ViewController: self, ok: {})
            return false
        }else if !isEmailAddressValid{
            print("Email address is not valid")
            displayAlertMessage(messageToDisplay: "Email address is not valid")
            return false
        }
        else  if PhNoTxtField.text!.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty == true{
            showAlert("", message: "Enter Phone Number", ViewController: self, ok: {})
            return false
        }else  if addressTxtField.text!.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty == true{
            showAlert("", message: "Enter Address", ViewController: self, ok: {})
            return false
        }
        
        return true
    }
    
    func addDoneButtonOnKeyboard(){
//        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
//        doneToolbar.barStyle = .default
//
//        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
//
//        let items = [flexSpace, done]
//        doneToolbar.items = items
//        doneToolbar.sizeToFit()
//
//        txtMobileNumber.inputAccessoryView = doneToolbar
    }

    @objc func doneButtonAction(){
       // txtMobileNumber.resignFirstResponder()
    }
    
    private func Styling(){
        profileTxtField.translatesAutoresizingMaskIntoConstraints = false
        departTxtField.translatesAutoresizingMaskIntoConstraints = false
        roleTxtField.translatesAutoresizingMaskIntoConstraints = false
        NRCTxtField.translatesAutoresizingMaskIntoConstraints = false
        emailTxtField.translatesAutoresizingMaskIntoConstraints = false
        PhNoTxtField.translatesAutoresizingMaskIntoConstraints = false
        addressTxtField.translatesAutoresizingMaskIntoConstraints = false
        profileTxtField.clearButtonMode = .unlessEditing
        departTxtField.clearButtonMode = .unlessEditing
        roleTxtField.clearButtonMode = .unlessEditing
        NRCTxtField.clearButtonMode = .unlessEditing
        emailTxtField.clearButtonMode = .unlessEditing
        PhNoTxtField.clearButtonMode = .unlessEditing
        addressTxtField.clearButtonMode = .unlessEditing
        profileTxtField.placeholder = "Full Name"
        departTxtField.placeholder = "Department"
        roleTxtField.placeholder = "Role"
        NRCTxtField.placeholder = "NRC"
        emailTxtField.placeholder = "Email"
        PhNoTxtField.placeholder = "PhoneNo"
        addressTxtField.placeholder = "Address"
        ProfileTxtController = MDCTextInputControllerFilled(textInput: profileTxtField)
        DepartTxtController = MDCTextInputControllerFilled(textInput: departTxtField)
        RoleTxtController = MDCTextInputControllerFilled(textInput: roleTxtField)
        NRCTxtController = MDCTextInputControllerFilled(textInput: NRCTxtField)
        EmailTxtController = MDCTextInputControllerFilled(textInput: emailTxtField)
        PhnoTxtController = MDCTextInputControllerFilled(textInput: PhNoTxtField)
        AddressTxtController = MDCTextInputControllerFilled(textInput: addressTxtField)
        
        //ProfileTxtController?.helperText = "Enter Name"
        //  ProfileTxtController?.leadingUnderlineLabelTextColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        ProfileTxtController?.inlinePlaceholderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        DepartTxtController?.inlinePlaceholderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        RoleTxtController?.inlinePlaceholderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        NRCTxtController?.inlinePlaceholderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        EmailTxtController?.inlinePlaceholderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        PhnoTxtController?.inlinePlaceholderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        AddressTxtController?.inlinePlaceholderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        //ProfileTxtController?.borderFillColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        ProfileTxtController?.activeColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        DepartTxtController?.activeColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        RoleTxtController?.activeColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        NRCTxtController?.activeColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        EmailTxtController?.activeColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        PhnoTxtController?.activeColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        AddressTxtController?.activeColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        //ProfileTxtController?.errorColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1) //profileTxtField.leadingUnderlineLabel.text = "Error"
        
    }
    
    //    private func AddChips(){
    //        //SkillChipTxtField.showChipsDeleteButton = true
    //        let chipView = MDCChipView()
    //        chipView.titleLabel.text = "Tap me"
    //        chipView.setTitleColor(UIColor.red, for: .selected)
    //        chipView.sizeToFit()
    //        // chipView.addTarget(self, action: #selector(tap), for: .touchUpInside)
    //        self.view.addSubview(chipView)
    //
    //    }
    
    private func textFieldShouldReturn(_ textField: MDCTextField) -> Bool {
        textField.resignFirstResponder()
        // TextField
        if (textField == profileTxtField &&
            profileTxtField.text == nil) {
            ProfileTxtController!.setErrorText("Error", errorAccessibilityValue: nil)
        }
        
        return false
    }
    
    @objc func imageTapped(gesture: UIGestureRecognizer) {
        // if the tapped view is a UIImageView then set it to imageview
        if (gesture.view as? UIImageView) != nil {
            print("Image Tapped")
            //Here you can initiate your new ViewController
            var myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(myPickerController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        profileImageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        profileImageView.backgroundColor = UIColor.clear
        self.dismiss(animated: true, completion: nil)
        self.uploadImage()
    }
    
    func uploadImage(){
        let imageData = profileImageView.image!.jpegData(compressionQuality: 1)
        if (imageData == nil){
            return
        }
        //  self.uploadBtn.isEnabled = false
        
        let uploadScriptUrl = NSURL(string: "http://swiftdeveloperblog.com/http-post-example-script/")
        var request = NSMutableURLRequest(url: uploadScriptUrl! as URL)
        request.httpMethod = "POST"
        request.setValue("Keep-Alive", forHTTPHeaderField: "Connection")
        var configuration = URLSessionConfiguration.default
        var session = URLSession(configuration: configuration,delegate: self as! URLSessionDelegate, delegateQueue: OperationQueue.main)
        
        var task = session.uploadTask(with: request as URLRequest, from: imageData!)
        task.resume()
    }
    
    func displayAlertMessage(messageToDisplay: String)
    {
        let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            
            // Code in this block will trigger when OK button tapped.
            print("Ok button tapped");
            
        }
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion:nil)
    }
    
    public func showAlert(_ title: String!, message: String, ViewController: UIViewController,ok: @escaping () -> ()){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel,handler: {_ in
            ok()
        });
        alert.addAction(action)
        ViewController.present(alert, animated: true, completion:nil)
    }
}
