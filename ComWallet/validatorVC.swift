//
//  validatorVC.swift
//  ComWallet
//
//  Created by Ammad on 10/02/2024.
//

import UIKit

class validatorVC: UIViewController {

    @IBOutlet weak var stakeBalanceText: UILabel!
    @IBOutlet weak var stakeText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let text = "Search validators to find the highest stake COM APY (Annual Percentage Yield)."
        
        // Create an attributed string
        let attributedString = NSMutableAttributedString(string: text)
        
        // Find the range of the specific word
        let wordToHighlight = "COM"
        let range = (text as NSString).range(of: wordToHighlight)
        
        // Apply red color to the specific word
        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 0.98, green: 0, blue: 0.35, alpha: 1), range: range)
        
        stakeText.attributedText = attributedString
        
        let text1 = "Validator APY: 50%"
        
        // Create an attributed string
        let attributedString1 = NSMutableAttributedString(string: text1)
        
        // Find the range of the specific word
        let wordToHighlight1 = "50%"
        let range1 = (text1 as NSString).range(of: wordToHighlight1)
        
        // Apply red color to the specific word
        attributedString1.addAttribute(.foregroundColor, value: UIColor.white, range: range1)
        
        stakeBalanceText.attributedText = attributedString1
        // Do any additional setup after loading the view.
    }

}
