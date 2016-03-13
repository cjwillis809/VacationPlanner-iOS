//
//  ProjectsViewController.swift
//  VacationPlanner
//
//  Created by Brenda Maya on 3/7/16.
//  Copyright © 2016 DePaul University. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    var settingSavingModel = SavingsModel();
    @IBOutlet weak var savingsTotalLabel: UILabel!
    @IBOutlet weak var savingsInput: UITextField!
    
    @IBAction func saveAction(sender: UIButton) {
        if let cost = savingsInput.text, _ = Double(cost){
            let tempCost = Double(cost)!;
            settingSavingModel.setSavings(tempCost);
            savingsTotalLabel.text = String(tempCost);
            
            // Hide Keyboard
            [savingsInput.endEditing(true)];
            savingsInput.text = "";
            
            // Confirmation Message
            let errorMsg = "Update has been saved!";
            let title = "Finished!";
            
            // Alert Controller
            let alertController = UIAlertController(title: title, message: errorMsg, preferredStyle: .Alert);
            
            // Create the simple Cancel Action
            let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler: nil);
            
            // Add Action to Alert Controller
            alertController.addAction(cancelAction);
            
            // Present the View controller
            presentViewController(alertController, animated: true, completion: nil);
        } else{
            // Alert Error
            let errorMsg = "The Savings Input is empty or invalid!";
            let title = "Savings Error!";
            
            // Alert Controller
            let alertController = UIAlertController(title: title, message: errorMsg, preferredStyle: .Alert);
            
            // Create the simple Cancel Action
            let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler: nil);
            
            // Add Action to Alert Controller
            alertController.addAction(cancelAction);
            
            // Present the View controller
            presentViewController(alertController, animated: true, completion: nil);
        }
    }
    
    /* ************************ */
    /* Final Required Functions */
    /* ************************ */
    @IBAction func hideKeyboard(sender: UITapGestureRecognizer) {
        [savingsInput.endEditing(true)];
    }
    /* Loaded each time the tab is loaded */
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        savingsTotalLabel.text = String(settingSavingModel.getSavings());
    }
    
    /* Required functions */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
