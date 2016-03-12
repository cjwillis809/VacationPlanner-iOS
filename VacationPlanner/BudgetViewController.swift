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
    
    /* ************** */
    /* Food Variables */
    /* ************** */
    @IBOutlet weak var foodAmountEntry: UITextField!
    @IBOutlet weak var foodItemEntry: UITextField!
    @IBOutlet weak var foodAmountTotal: UITextView!
    @IBOutlet var entryCollection: [UITextField]!
    @IBOutlet weak var foodItemLst: UITextView!
    var foodLstCosts: [Double] = [];
    var foodLstItems: [String] = [];

    /* ********** */
    /* Food Logic */
    /* ********** */
    
    // Action for Add Item button
    @IBAction func addFoodItem(sender: UIButton) {
        // Check if the Cost Input was a numerical value
        if let cost = foodAmountEntry.text, _ = Double(cost){
            // Check if the Item input is valid
            if !foodItemEntry.text!.isEmpty {
                let strItem = foodItemEntry.text!;
                
                // Round Cost
                let temp = Double(cost);
                let roundCost = Double(round(100*temp!)/100)
                
                // Add item and price to corresponding lists
                foodLstCosts.append(roundCost);
                foodLstItems.append(strItem);
                displayLists();
                calculateTotal();
                clearEntries();
            } else{
                // Alert error - Item
                let errorMsg = "The Item input is empty";
                
                // Title
                let title = "Item Error!"
                
                // Alert Controller
                let alertController = UIAlertController(title: title, message: errorMsg, preferredStyle: .Alert);
                
                // Create the action
                let cancelAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil);
                
                // Add Action to Alert Controller
                alertController.addAction(cancelAction);
                presentViewController(alertController, animated: true, completion: nil);
            }
        } else{
            // Alert error - Cost
            let errorMsg = "The Cost input is empty or invalid";
            
            // Title
            let title = "Cost Error!"
            
            // Alert Controller
            let alertController = UIAlertController(title: title, message: errorMsg, preferredStyle: .Alert);
            
            // Create the action
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil);
            
            // Add Action to Alert Controller
            alertController.addAction(cancelAction);
            presentViewController(alertController, animated: true, completion: nil);
        }
    }
    
    // Calculate the total cost
    func calculateTotal(){
        var total = 0.0;
        for cost in foodLstCosts{
            total += cost;
        }
        foodAmountTotal.text = String(total);
    }
    
    /* **************** */
    /* Helper Functions */
    /* **************** */
    func displayLists(){
        //listLabel.adjustsFontSizeToFitWidth = false;
        var toDisplay = "";
        var temp = "";
        let lstLen = foodLstItems.count;

        for var index = 0; index < lstLen; ++index{
            temp = "\(foodLstItems[index]) \t-\t \(foodLstCosts[index])\n";
            toDisplay += temp;
        }
        foodItemLst.text = toDisplay;
    }
    func clearEntries(){
        foodAmountEntry.text = "";
        foodItemEntry.text = "";
    }
    
    /* ************************ */
    /* Final Required Functions */
    /* ************************ */
    
    /* Recognizes a tap in a UIScrollView, and hides the keyboard */
    @IBAction func hideKeyboard(sender: UITapGestureRecognizer) {
        [foodAmountEntry .endEditing(true)];
    }
    /* Resigns the First Responder */
    @IBAction func editEndedAction(sender: UITextField) {
        sender.resignFirstResponder();
    }
    /* Called each time the tab is loaded */
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        savingsBar.transform = CGAffineTransformScale(savingsBar.transform, 1, 12)
        
    }
    /* Called each time the tab is loaded */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
