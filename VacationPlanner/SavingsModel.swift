//
//  SavingsModel.swift
//  VacationPlanner
//
//  Created by Brenda Maya on 3/12/16.
//  Copyright © 2016 DePaul University. All rights reserved.
//

import UIKit

class SavingsModel: NSObject {
    var travelDestination = ""
    var currentSavings = 0.0;
    
    func getSavings() -> Double{
        return currentSavings;
    }
    func setSavings(updateValue :  Double){
        // Round Value
        let temp = Double(updateValue);
        let roundCost = Double(round(100*temp)/100)
        currentSavings = roundCost;
    }
    func getTravelDestionation() -> String {
        return travelDestination
    }
    func setTravelDestionation(update: String) {
        travelDestination = update
    }
}