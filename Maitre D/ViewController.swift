//
//  ViewController.swift
//  Maitre D
//
//  Created by Davelaar,Clinton B on 9/11/19.
//  Copyright © 2019 Davelaar,Clinton B. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfTotal: UITextField!
    @IBOutlet weak var tfRate: UITextField!
    @IBOutlet weak var lblTip: UILabel!
    @IBOutlet weak var lblTax: UILabel!
    @IBOutlet weak var lblGrandTotal: UILabel!
    let taxPercent = 0.055
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnCalculate(_ sender: Any) {
        if let total = Double(tfTotal.text!){
            if let rate = Double(tfRate.text!) {
                let tip = total * rate / 100
                let tax = total * taxPercent
                let grandTotal = total + tip + tax
                lblTip.text = "\(NumberFormatter.localizedString(from:NSNumber(value:tip), number: .currency))"
                lblTax.text = "\(NumberFormatter.localizedString(from:NSNumber(value:tax), number: .currency))"
                lblGrandTotal.text = "\(NumberFormatter.localizedString(from:NSNumber(value:grandTotal), number: .currency))"
            }else{
                let alert = UIAlertController(title: "Warning!", message: "You did not specify  a rate, do you wish to use 15%?", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {(alert: UIAlertAction!) in self.use15()}))
                alert.addAction(UIAlertAction(title: "No, cancel", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }else{
            let alert = UIAlertController(title: "Warning!", message: "Please enter bill total", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    func use15() -> Void{
        let total = Double(tfTotal.text!)!
        let rate = 15.0
        let tip = total * rate / 100
        let tax = total * taxPercent
        let grandTotal = total + tip + tax
        lblTip.text = "\(NumberFormatter.localizedString(from:NSNumber(value:tip), number: .currency))"
        lblTax.text = "\(NumberFormatter.localizedString(from:NSNumber(value:tax), number: .currency))"
        lblGrandTotal.text = "\(NumberFormatter.localizedString(from:NSNumber(value:grandTotal), number: .currency))"
        
    }
}

