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
                displayLists(foodLstItems, costLst: foodLstCosts, labelToUpdate: foodItemLst);
                calculateTotal(foodAmountTotal, costLst: foodLstCosts);
                clearEntries(foodCostEntry, e2 : foodItemEntry);
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
    
    /* **************** */
    /* Helper Functions */
    /* **************** */
    func showError(errorMsg : String, title : String){
        // Alert Controller
        let alertController = UIAlertController(title: title, message: errorMsg, preferredStyle: .Alert);
        
        // Create the action
        let cancelAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil);
        
        // Add Action to Alert Controller
        alertController.addAction(cancelAction);
        presentViewController(alertController, animated: true, completion: nil);
    }
    func displayLists(itemLst : [String], costLst : [Double], labelToUpdate : UITextView){
        //listLabel.adjustsFontSizeToFitWidth = false;
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
    func clearEntries(e1 : UITextField, e2 : UITextField){
        e1.text = "";
        e2.text = "";
    }
    // Calculate the total cost
    func calculateTotal(totalAmountLabel : UITextView, costLst : [Double]){
        var total = 0.0;
        for cost in costLst{
            total += cost;
        }
        totalAmountLabel.text = String(total);
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
    }
    /* Called each time the tab is loaded */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        savingsBar.transform = CGAffineTransformScale(savingsBar.transform, 1, 12)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
