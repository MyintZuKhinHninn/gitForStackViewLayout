//
//  WeatherConditions.swift
//  StackViewAutoLayoutTest
//
//  Created by TechFun on 11/25/19.
//  Copyright © 2019 MyintZu. All rights reserved.
//

import Foundation
import UIKit

class  WeatherConditions {
    
    var visitingReason : String!
    var weatherConditon : String!
    var seeingReason : String!
    var rating : String!
    
    func setWeatherValue(){
        self.visitingReason = "One of the world's most visited cities, London has something for everyone: from history and culture to fine food and good times."
        self.weatherConditon = "Largely dry at first, before further rain and extensive low cloud soon arrives from the southwest by mid morning, turning showery then clearing east through the evening. Maximum temperature 14 °C."
        self.seeingReason = "After winning the Battle of Hastings, William, Duke of Normandy was crowned King of England in the newly completed Westminster Abbey on Christmas Day 1066."
        self.rating = "Rating"
    }
}
