//
//  WeatherViewController.swift
//  StackViewAutoLayoutTest
//
//  Created by TechFun on 11/25/19.
//  Copyright © 2019 MyintZu. All rights reserved.
//

import UIKit
import Cosmos
import TinyConstraints
class WeatherViewController: UIViewController {

    @IBOutlet weak var visitLabel: UILabel!
    @IBOutlet weak var WhyVistLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var showBtn: UIButton!
    @IBOutlet weak var showWeatherView: UIView!
    @IBOutlet weak var WeatherInfoLabel: UILabel!
    @IBOutlet weak var seeLabel: UILabel!
    @IBOutlet weak var WhatToSeeLabel: UILabel!
    @IBOutlet weak var ratingStackView: UIStackView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var submitRatingBtn: UIButton!
    @IBOutlet weak var viewMapBtn: UIButton!
    @IBOutlet weak var wikipedia: UIButton!
    @IBOutlet weak var pickerDropDownView: UITextField!
    @IBOutlet weak var WeatherViewClass: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    public var weathercondition = WeatherConditions()
    public var isShow : Bool = false
    var selectedClass : String?
    private let showData = ["Class A","Class B","Class C","Class D","Class E","Class F"]
    
    lazy var cosmosView: CosmosView = {
        var cosView = CosmosView()
        cosView.settings.filledImage  = UIImage(named: "GoldStar")?.withRenderingMode(.alwaysOriginal)
        cosView.settings.emptyImage = UIImage(named: "GoldStarEmpty")?.withRenderingMode(.alwaysOriginal)
        cosView.settings.totalStars = 7
        cosView.settings.starSize = 17
        cosView.settings.starMargin = 1
        cosView.settings.fillMode = .full
        cosView.height(50)
        cosView.text = "Rate me"
        cosView.settings.textColor = .red
        cosView.settings.textMargin = 10
        return cosView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !isShow{
            self.WeatherInfoLabel.isHidden = true
            self.showWeatherView.isHidden = true
            self.showBtn.setTitle("Show", for: .normal)
        }
        self.weathercondition.setWeatherValue()
        self.setValue()
        self.shaping()
       
        view.addSubview(cosmosView)
        //cosmosView.centerInSuperview()
        self.customizeSize()
        cosmosView.didTouchCosmos = { rating in print("Rated \(rating)")}
        self.createPickerView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    func setValue(){
        self.visitLabel.text = "WHY VISIT"
        self.WhyVistLabel.text = weathercondition.visitingReason
        self.weatherLabel.text = "WEATHER"
        self.WeatherInfoLabel.text = weathercondition.weatherConditon
        self.seeLabel.text = "WHAT TO SEE"
        self.WhatToSeeLabel.text = weathercondition.seeingReason
        self.ratingLabel.text = weathercondition.rating
        self.submitRatingBtn.setTitle("Submit Rating", for: .normal)
        self.viewMapBtn.setTitle("View Map", for: .normal)
        self.wikipedia.setTitle("Wikipedia", for: .normal)
    }

    func shaping(){
        self.visitLabel.backgroundColor = .clear
        self.WhyVistLabel.backgroundColor = .clear
        self.weatherLabel.backgroundColor = .clear
        self.WeatherInfoLabel.backgroundColor = .clear
        self.seeLabel.backgroundColor = .clear
        self.WhatToSeeLabel.backgroundColor = .clear
        self.ratingLabel.backgroundColor = .clear
    }
    
    func createPickerView(){
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerDropDownView.inputView = pickerView
     //   self.pickerShape()
        self.pickerDropDownView.allowsEditingTextAttributes = false
        dismissPickerView()
        pickerDropDownView.text = showData[0]
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return false
    }
    
    func pickerShape(){
         pickerView.dataSource = self
            pickerView.delegate = self
            pickerView.setValue(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), forKey: "textColor")
            pickerView.setValue(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.5), forKey: "backgroundColor")
    }
    
    func dismissPickerView(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        pickerDropDownView.inputAccessoryView = toolBar
        pickerDropDownView.endEditing(true)
        
    }
    
    @objc func action(){
        pickerDropDownView.endEditing(true)
    }
    
    @IBAction func nextPickerView(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "WeatherClass", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SecondVC") as! WeatherClassViewController
        self.present(nextViewController, animated:true, completion:nil)
        
        
    }
    
    @IBAction func showHideWeather(_ sender: Any) {
        if !isShow{
            self.isShow = true
            self.WeatherInfoLabel.isHidden = false
            self.showWeatherView.isHidden = false
            self.showBtn.setTitle("Hide", for: .normal)
            self.animateView()
        }else{
            self.customizeSize()
            self.isShow = false
            self.WeatherInfoLabel.isHidden = true
            self.showWeatherView.isHidden = true
            self.showBtn.setTitle("Show", for: .normal)
            self.animateView()
            
        }
    }
    
    @IBAction func mapAction(_ sender: Any) {
        performSegue(withIdentifier: "mapSegue", sender: self)
    }
    
//    @IBAction func profileAction(_ sender: Any) {
//      let storyboard = UIStoryboard(name: "Profile", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "ProfileViewControllerID") as UIViewController
//        present(vc, animated: true, completion: nil)
//    }
    
    private func animateView(){
        let options: UIView.AnimationOptions = [.showHideTransitionViews]
        UIView.animate(withDuration: 3,delay: 0,options: .allowUserInteraction,animations: {
            self.showWeatherView.frame = self.view.frame
        })
    }
//
//    @IBAction func backAction(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
//    }
    private func customizeSize(){
//        view.addConstraint(NSLayoutConstraint(item: cosmosView, attribute: .centerY, relatedBy: .equal, toItem: ratingLabel, attribute: .centerY, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: cosmosView, attribute: .top, relatedBy: .equal, toItem: ratingLabel, attribute: .top, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: cosmosView, attribute: .leading, relatedBy: .equal, toItem: ratingLabel, attribute: .leading, multiplier: 1, constant: 80))
    }
 
}

extension WeatherViewController: UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate{
func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
}
func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return showData.count
}
func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
   selectedClass = showData[row]
    pickerDropDownView.text = selectedClass
}
    
func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return showData[row]
}
}
//
//extension WeatherViewController {
//
//    func setBackButton(){
//        let yourBackImage = UIImage(named: "backbutton")
//        navigationController?.navigationBar.backIndicatorImage = yourBackImage
//        navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
//    }
//
//}
