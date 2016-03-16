//
//  BudgetViewController.swift
//  VacationPlanner
//
//  Created by Brenda Maya on 3/7/16.
//  Copyright © 2016 DePaul University. All rights reserved.
//

import UIKit
import Foundation;

class BudgetViewController: UIViewController {
    @IBOutlet weak var savingsBar: UIProgressView!
    @IBOutlet var entryCollection: [UITextField]!
    @IBOutlet weak var savingsRatio: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    var totalToSave = 0.0;
    var globalSavings = SavingsModel();
    var destinationName = ""
    
    /* ************** */
    /* Food Variables */
    /* ************** */
    @IBOutlet weak var foodCostEntry: UITextField!
    @IBOutlet weak var foodItemEntry: UITextField!
    @IBOutlet weak var foodAmountTotal: UITextView!
    @IBOutlet weak var foodItemLst: UITextView!
    var foodLstCosts: [Double] = [];
    var foodLstItems: [String] = [];
    /* ************************ */
    /* Transportation Variables */
    /* ************************ */
    @IBOutlet weak var transCostEntry: UITextField!
    @IBOutlet weak var transItemEntry: UITextField!
    @IBOutlet weak var transAmountTotal: UITextView!
    @IBOutlet weak var transItemLst: UITextView!
    var transLstCosts: [Double] = [];
    var transLstItems: [String] = [];
    /* ************************ */
    /* Accommodation  Variables */
    /* ************************ */
    @IBOutlet weak var accomCostEntry: UITextField!
    @IBOutlet weak var accomItemEntry: UITextField!
    @IBOutlet weak var accomAmountTotal: UITextView!
    @IBOutlet weak var accomItemLst: UITextView!
    var accomLstCosts: [Double] = [];
    var accomLstItems: [String] = [];
    /* ************************ */
    /* Entertainment  Variables */
    /* ************************ */
    @IBOutlet weak var entCostEntry: UITextField!
    @IBOutlet weak var entItemEntry: UITextField!
    @IBOutlet weak var entAmountTotal: UITextView!
    @IBOutlet weak var entItemLst: UITextView!
    var entLstCosts: [Double] = [];
    var entLstItems: [String] = [];
    /* *************** */
    /* Misc  Variables */
    /* *************** */
    @IBOutlet weak var miscCostEntry: UITextField!
    @IBOutlet weak var miscItemEntry: UITextField!
    @IBOutlet weak var miscAmountTotal: UITextView!
    @IBOutlet weak var miscItemLst: UITextView!
    var miscLstCosts: [Double] = [];
    var miscLstItems: [String] = [];

    /* ********** */
    /* Food Logic */
    /* ********** */
    // Action for Add Item button
    @IBAction func addFoodItem(sender: UIButton) {
        // Check if the Cost Input was a numerical value
        if let cost = foodCostEntry.text, _ = Double(cost){
            // Check if the Item input is valid
            if !foodItemEntry.text!.isEmpty {
                let strItem = foodItemEntry.text!;
                
                // Round Cost
                let temp = Double(cost);
                let roundCost = Double(round(100*temp!)/100)
                
                // Add item and price to corresponding lists
                foodLstCosts.append(roundCost);
                foodLstItems.append(strItem);
                
                // Updating
                displayLists(foodLstItems, costLst: foodLstCosts, labelToUpdate: foodItemLst);
                calculateTotal(foodAmountTotal, costLst: foodLstCosts);
                clearEntries(foodCostEntry, e2 : foodItemEntry);
                updateRatio();
                
            } else{
                // Error message and title
                let errorMsg = "The Item input is empty";
                let title = "Food Item Error!"
                showError(errorMsg, title: title)
                
            }
        } else{
            // Error message and title
            let errorMsg = "The Cost input is empty or invalid";
            let title = "Food Cost Error!"
            showError(errorMsg, title: title)
        }
    }
    @IBAction func foodRemoveAction(sender: UIButton) {
        // If no specific item entered, clear the entire section
        if foodItemEntry.text!.isEmpty {
            clearError("Food");
        } else{
            if let ind = foodLstItems.indexOf(foodItemEntry.text!){
                foodLstItems.removeAtIndex(ind);
                foodLstCosts.removeAtIndex(ind);
                // Updating
                displayLists(foodLstItems, costLst: foodLstCosts, labelToUpdate: foodItemLst);
                calculateTotal(foodAmountTotal, costLst: foodLstCosts);
                clearEntries(foodCostEntry, e2 : foodItemEntry);
                updateRatio();
            }else{
                showError("The item was not found. Search is case sensitive", title: "Remove error!")
            }
        }
    }
    
    /* ******************** */
    /* Transportation Logic */
    /* ******************** */
    // Action for Add Item button
    @IBAction func addTransAction(sender: UIButton) {
        // Check if the Cost Input was a numerical value
        if let cost = transCostEntry.text, _ = Double(cost){
            // Check if the Item input is valid
            if !transItemEntry.text!.isEmpty {
                let strItem = transItemEntry.text!;
                
                // Round Cost
                let temp = Double(cost);
                let roundCost = Double(round(100*temp!)/100)
                
                // Add item and price to corresponding lists
                transLstCosts.append(roundCost);
                transLstItems.append(strItem);
                displayLists(transLstItems, costLst: transLstCosts, labelToUpdate: transItemLst);
                calculateTotal(transAmountTotal, costLst: transLstCosts);
                clearEntries(transCostEntry, e2 : transItemEntry);
                // Update the denom of the ratio
                updateRatio();
            } else{
                // Error message and title
                let errorMsg = "The Item input is empty";
                let title = "Transportation Item Error!"
                showError(errorMsg, title: title)
            }
        } else{
            // Error message and title
            let errorMsg = "The Cost input is empty or invalid";
            let title = "Transportation Cost Error!"
            showError(errorMsg, title: title)
        }
    }
    @IBAction func transRemoveAction(sender: UIButton) {
        // If no specific item entered, clear the entire section
        if transItemEntry.text!.isEmpty {
            clearError("Trans");
        } else{
            if let ind = transLstItems.indexOf(transItemEntry.text!){
                transLstItems.removeAtIndex(ind);
                transLstCosts.removeAtIndex(ind);
                // Updating
                displayLists(transLstItems, costLst: transLstCosts, labelToUpdate: transItemLst);
                calculateTotal(transAmountTotal, costLst: transLstCosts);
                clearEntries(transCostEntry, e2 : transItemEntry);
                updateRatio();
            }else{
                showError("The item was not found. Search is case sensitive", title: "Remove error!")
            }
        }
    }
    /* ******************** */
    /* Accommodations Logic */
    /* ******************** */
    // Action for Add Item button
    @IBAction func addAccomAction(sender: UIButton) {
        // Check if the Cost Input was a numerical value
        if let cost = accomCostEntry.text, _ = Double(cost){
            // Check if the Item input is valid
            if !accomItemEntry.text!.isEmpty {
                let strItem = accomItemEntry.text!;
                
                // Round Cost
                let temp = Double(cost);
                let roundCost = Double(round(100*temp!)/100)
                
                // Add item and price to corresponding lists
                accomLstCosts.append(roundCost);
                accomLstItems.append(strItem);
                displayLists(accomLstItems, costLst: accomLstCosts, labelToUpdate: accomItemLst);
                calculateTotal(accomAmountTotal, costLst: accomLstCosts);
                clearEntries(accomCostEntry, e2 : accomItemEntry);
                updateRatio();
            } else{
                // Error message and title
                let errorMsg = "The Item input is empty";
                let title = "Accommodation Item Error!"
                showError(errorMsg, title: title)
            }
        } else{
            // Error message and title
            let errorMsg = "The Cost input is empty or invalid";
            let title = "Accommodation Cost Error!"
            showError(errorMsg, title: title)
        }
    }
    @IBAction func accomRemoveAction(sender: UIButton) {
        // If no specific item entered, clear the entire section
        if accomItemEntry.text!.isEmpty {
            clearError("Accom");
        } else{
            if let ind = accomLstItems.indexOf(accomItemEntry.text!){
                accomLstItems.removeAtIndex(ind);
                accomLstCosts.removeAtIndex(ind);
                // Updating
                displayLists(accomLstItems, costLst: accomLstCosts, labelToUpdate: accomItemLst);
                calculateTotal(accomAmountTotal, costLst: accomLstCosts);
                clearEntries(accomCostEntry, e2 : accomItemEntry);
                updateRatio();
            }else{
                showError("The item was not found. Search is case sensitive", title: "Remove error!")
            }
        }
    }
    
    /* ******************* */
    /* Entertainment Logic */
    /* ******************* */
    // Action for Add Item button
    @IBAction func addEntAction(sender: UIButton) {
        // Check if the Cost Input was a numerical value
        if let cost = entCostEntry.text, _ = Double(cost){
            // Check if the Item input is valid
            if !entItemEntry.text!.isEmpty {
                let strItem = entItemEntry.text!;
                
                // Round Cost
                let temp = Double(cost);
                let roundCost = Double(round(100*temp!)/100)
                
                // Add item and price to corresponding lists
                entLstCosts.append(roundCost);
                entLstItems.append(strItem);
                displayLists(entLstItems, costLst: entLstCosts, labelToUpdate: entItemLst);
                calculateTotal(entAmountTotal, costLst: entLstCosts);
                clearEntries(entCostEntry, e2 : entItemEntry);
                // Update the denom of the ratio
                updateRatio();
            } else{
                // Error message and title
                let errorMsg = "The Item input is empty";
                let title = "Entertainment Item Error!"
                showError(errorMsg, title: title)
            }
        } else{
            // Error message and title
            let errorMsg = "The Cost input is empty or invalid";
            let title = "Entertainment Cost Error!"
            showError(errorMsg, title: title)
        }
    }
    @IBAction func entRemoveAction(sender: UIButton) {
        // If no specific item entered, clear the entire section
        if entItemEntry.text!.isEmpty {
            clearError("Ent");
        } else{
            if let ind = entLstItems.indexOf(entItemEntry.text!){
                entLstItems.removeAtIndex(ind);
                entLstCosts.removeAtIndex(ind);
                // Updating
                displayLists(entLstItems, costLst: entLstCosts, labelToUpdate: entItemLst);
                calculateTotal(entAmountTotal, costLst: entLstCosts);
                clearEntries(entCostEntry, e2 : entItemEntry);
                updateRatio();
            }else{
                showError("The item was not found. Search is case sensitive", title: "Remove error!")
            }
        }
    }
    /* ********** */
    /* Misc Logic */
    /* ********** */
    // Action for Add Item button
    @IBAction func addMiscAction(sender: UIButton) {
        // Check if the Cost Input was a numerical value
        if let cost = miscCostEntry.text, _ = Double(cost){
            // Check if the Item input is valid
            if !miscItemEntry.text!.isEmpty {
                let strItem = miscItemEntry.text!;
                
                // Round Cost
                let temp = Double(cost);
                let roundCost = Double(round(100*temp!)/100)
                
                // Add item and price to corresponding lists
                miscLstCosts.append(roundCost);
                miscLstItems.append(strItem);
                displayLists(miscLstItems, costLst: miscLstCosts, labelToUpdate: miscItemLst);
                calculateTotal(miscAmountTotal, costLst: miscLstCosts);
                clearEntries(miscCostEntry, e2 : miscItemEntry);
                // Update the denom of the ratio
                updateRatio();
            } else{
                // Error message and title
                let errorMsg = "The Item input is empty";
                let title = "Misc Item Error!"
                showError(errorMsg, title: title)
            }
        } else{
            // Error message and title
            let errorMsg = "The Cost input is empty or invalid";
            let title = "Misc Cost Error!"
            showError(errorMsg, title: title)
        }
    }
    @IBAction func miscRemoveAction(sender: UIButton) {
        // If no specific item entered, clear the entire section
        if miscItemEntry.text!.isEmpty {
            clearError("Misc");
        } else{
            if let ind = miscLstItems.indexOf(miscItemEntry.text!){
                miscLstItems.removeAtIndex(ind);
                miscLstCosts.removeAtIndex(ind);
                // Updating
                displayLists(miscLstItems, costLst: miscLstCosts, labelToUpdate: miscItemLst);
                calculateTotal(miscAmountTotal, costLst: miscLstCosts);
                clearEntries(miscCostEntry, e2 : miscItemEntry);
                updateRatio();
            }else{
                showError("The item was not found. Search is case sensitive", title: "Remove error!")
            }
        }
    }
    
    /* **************** */
    /* Helper Functions */
    /* **************** */
    /* Shows a simple error message */
    func showError(errorMsg : String, title : String){
        // Alert Controller
        let alertController = UIAlertController(title: title, message: errorMsg, preferredStyle: .Alert);
        
        // Create the action
        let cancelAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil);
        
        // Add Action to Alert Controller
        alertController.addAction(cancelAction);
        presentViewController(alertController, animated: true, completion: nil);
    }
    
    /* Updates the textViews */
    func displayLists(itemLst : [String], costLst : [Double], labelToUpdate : UITextView){
        var toDisplay = "";
        var temp = "";
        let lstLen = itemLst.count;

        for var index = 0; index < lstLen; ++index{
            temp = "\(itemLst[index]) \t-\t \(String(costLst[index]))\n";
            toDisplay += temp;
        }
        labelToUpdate.textColor = UIColor.orangeColor();
        labelToUpdate.text = toDisplay;
        labelToUpdate.textColor = UIColor.orangeColor();
    }
    
    /* Clears the entries specified */
    func clearEntries(e1 : UITextField, e2 : UITextField){
        e1.text = "";
        e2.text = "";
    }
    
    /* Calculates the total */
    func calculateTotal(totalAmountLabel : UITextView, costLst : [Double]){
        var total = 0.0;
        for cost in costLst{
            total += cost;
        }
        totalAmountLabel.text = String(total);
    }
    
    /* Updates the Progress Bar and the ratio */
    func updateRatio(){
        var totalLst : [[Double]] = [];
        totalLst.append(foodLstCosts);
        totalLst.append(transLstCosts);
        totalLst.append(accomLstCosts);
        totalLst.append(entLstCosts);
        totalLst.append(miscLstCosts);
        var sum = 0.0;
        for l in totalLst{
            for n in l{
                sum+=n;
            }
        }
        totalToSave = sum;
        let temp = self.globalSavings.getSavings();
        
        // Set the Savings Ratio
        savingsRatio.text = "\(temp) / \(totalToSave)";
        savingsBar.progress = Float(temp/totalToSave);
    }
    
    /* Creates an error message with a forced action */
    func clearError(sectionTitle: String){
        // Alert Error
        let errorMsg = "A specific Item to remove was not entered.\nClick 'Clear' to clear the entire section or cancel to go back.";
        let title = "Remove Alert!";
        
        // Alert Controller
        let alertController = UIAlertController(title: title, message: errorMsg, preferredStyle: .Alert);
        
        // Create the simple Cancel Action
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil);
        
        // Create the Force Action with Handler
        let forceAction = UIAlertAction(title: "Clear", style: .Default, handler: { (action: UIAlertAction!) -> Void in
            // Clear the lists
            if (sectionTitle == "Food"){
                self.foodLstCosts = [];
                self.foodLstItems = [];
                // Updates
                self.displayLists(self.foodLstItems, costLst: self.foodLstCosts, labelToUpdate: self.foodItemLst);
                self.calculateTotal(self.foodAmountTotal, costLst: self.foodLstCosts);
                self.clearEntries(self.foodCostEntry, e2 : self.foodItemEntry);
                self.updateRatio();
            }
            
            else if (sectionTitle == "Trans"){
                self.transLstCosts = [];
                self.transLstItems = [];
                // Updates
                self.displayLists(self.transLstItems, costLst: self.transLstCosts, labelToUpdate: self.transItemLst);
                self.calculateTotal(self.transAmountTotal, costLst: self.transLstCosts);
                self.clearEntries(self.transCostEntry, e2 : self.transItemEntry);
                self.updateRatio();
            }
            
            else if (sectionTitle == "Accom"){
                self.accomLstCosts = [];
                self.accomLstItems = [];
                // Updates
                self.displayLists(self.accomLstItems, costLst: self.accomLstCosts, labelToUpdate: self.accomItemLst);
                self.calculateTotal(self.accomAmountTotal, costLst: self.accomLstCosts);
                self.clearEntries(self.accomCostEntry, e2 : self.accomItemEntry);
                self.updateRatio();
            }
            
            else if (sectionTitle == "Ent"){
                self.entLstCosts = [];
                self.entLstItems = [];
                // Updates
                self.displayLists(self.entLstItems, costLst: self.entLstCosts, labelToUpdate: self.entItemLst);
                self.calculateTotal(self.entAmountTotal, costLst: self.entLstCosts);
                self.clearEntries(self.entCostEntry, e2 : self.entItemEntry);
                self.updateRatio();
            }
            
            else if (sectionTitle == "Misc"){
                self.miscLstCosts = [];
                self.miscLstItems = [];
                // Updates
                self.displayLists(self.miscLstItems, costLst: self.miscLstCosts, labelToUpdate: self.miscItemLst);
                self.calculateTotal(self.miscAmountTotal, costLst: self.miscLstCosts);
                self.clearEntries(self.miscCostEntry, e2 : self.miscItemEntry);
                self.updateRatio();
            }
            
            // Inner Alert Controller
            let subAlertController = UIAlertController(title: "Cleared", message: "The section has been cleared", preferredStyle: .Alert);
            // Create the Actions
            let okAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil);
            subAlertController.addAction(okAction);
            self.presentViewController(subAlertController, animated: true, completion: nil);
        });
        
        // Add Action to Alert Controller
        alertController.addAction(cancelAction);
        alertController.addAction(forceAction);
        
        // Present the View controller
        presentViewController(alertController, animated: true, completion: nil);
    }
    
    /* ************************ */
    /* Final Required Functions */
    /* ************************ */
    /* Recognizes a tap in a UIScrollView, and hides the keyboard */
    @IBAction func hideKeyboard(sender: UITapGestureRecognizer) {
        for tf in entryCollection{
            [tf.endEditing(true)];
        }
    }
    /* Resigns the First Responder */
    @IBAction func editEndedAction(sender: UITextField) {
        sender.resignFirstResponder();
    }
    /* Called each time the tab is loaded */
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // Set the Savings Ratio
        let temp = self.globalSavings.getSavings();
        savingsRatio.text = "\(temp) / \(totalToSave)";
        savingsBar.progress = Float(temp/totalToSave);
    }
    /* Called each time the tab is loaded */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        savingsBar.transform = CGAffineTransformScale(savingsBar.transform, 1, 12)
        
        //Share data and set pointers
        let barViewCtrls = self.tabBarController?.viewControllers;
        let settingsVC = barViewCtrls![1] as! SettingsViewController;
        self.globalSavings = settingsVC.settingSavingModel;
        
        // Set the Savings Ratio
        let temp = self.globalSavings.getSavings();
        savingsRatio.text = "\(temp) / \(totalToSave)";
        savingsBar.progress = Float(temp/totalToSave);
        
        // Set title
        titleLabel.text = "\(self.destinationName) Vacation Budget"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
