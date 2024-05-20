//
//  ViewController.swift
//  Dabba Pay
//
//  Created by Abhilash Knox George on 13/05/24.
//

import UIKit
import Synth

class ViewController: UIViewController {

    @IBOutlet weak var priceTextFeild: UITextField!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var liteImageView: UIImageView!
    @IBOutlet weak var proceedPaymentButton: UIButton!
    @IBOutlet weak var paymentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        proceedPaymentButton.applyNeuBtnStyle(type: .elevatedSoft, title: "Proceed to Payment", image: UIImage(systemName: "gear"), imageTintColor: .green, imageDimension: 40, hideBasePit: false, hideImagePit: false)
        paymentView.applyNeuStyle(showOnlyShadows: true)
        mainView.applyNeuStyle(showOnlyShadows: true)
    }
    
    
    

}
