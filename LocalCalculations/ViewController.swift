//
//  ViewController.swift
//  LocalCalculations
//
//  Created by Santhosh Kumar on 16/03/20.
//  Copyright © 2020 WeKanCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var lblProduct1: UILabel!
    @IBOutlet weak var lblProduct2: UILabel!
    @IBOutlet weak var lblProduct3: UILabel!
    @IBOutlet weak var lblProduct4: UILabel!
    @IBOutlet weak var lblTax: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblDiscount: UILabel!
    @IBOutlet weak var lblPayAmount: UILabel!
    
    // MARK: - Property
    
    var product1: Float = 0
    var product2: Float = 0
    var product3: Float = 0
    var product4: Float = 0
    var taxAmount: Float = 0
    var totalAmount: Float = 0
    var discountAmount: Float = 0
    var payableAmount: Float = 0
    var taxPercentage: Float = 5.5
    
    // MARK: - ViewController Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initializeView()
    }
    
    // MARK: - InitializeView
    
    fileprivate func initializeView() {
        
        ///set product amount
        product1 = Float("13.3456")!
        product2 = Float("199.987")!
        product3 = Float("5.0933")!
        product4 = Float("9.298")!
        discountAmount = Float("34.8967")!
        
        ///set label values
        lblProduct1.text = "$ \(String(format: "%.2f", product1))"
        lblProduct2.text = "$ \(String(format: "%.2f", product2))"
        lblProduct3.text = "$ \(String(format: "%.2f", product3))"
        lblProduct4.text = "$ \(String(format: "%.2f", product4))"
        
        ///calculate product total, discount & tax
        calculations()
    }
}

// MARK: - Calculations

extension ViewController {
    fileprivate func calculations() {
        
        if !lblProduct1.text!.isEmpty {
            totalAmount += Float(String(format: "%.2f", product1))!
        }
        
        if !lblProduct2.text!.isEmpty {
            totalAmount += Float(String(format: "%.2f", product2))!
        }
        
        if !lblProduct3.text!.isEmpty {
            totalAmount += Float(String(format: "%.2f", product3))!
        }
        
        if !lblProduct4.text!.isEmpty {
            totalAmount += Float(String(format: "%.2f", product4))!
        }
        
        lblTotal.text = "$ \(String(format: "%.2f", totalAmount))"
        lblDiscount.text = "$ \(String(format: "%.2f", discountAmount))"
        
        taxAmount = Float((totalAmount - discountAmount) * (taxPercentage / 100))
        lblTax.text = "$ \(String(format: "%.2f", taxAmount))"
        
        lblPayAmount.text = "$ \(String(format: "%.2f", (totalAmount - discountAmount) + taxAmount))"
    }
}
