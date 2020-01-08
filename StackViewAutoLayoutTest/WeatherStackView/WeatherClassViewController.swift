//
//  WeatherClassViewController.swift
//  StackViewAutoLayoutTest
//
//  Created by TechFun on 11/28/19.
//  Copyright © 2019 MyintZu. All rights reserved.
//

import UIKit

class WeatherClassViewController: UIViewController{

    private let showData = ["Item 1","Item 2","Item 3","Item 4","Item 5","Item 6"]
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
extension WeatherClassViewController: UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return showData.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }
}
