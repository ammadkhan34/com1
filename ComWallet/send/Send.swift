//
//  Send.swift
//  ComWallet
//
//  Created by Ammad on 11/02/2024.
//

import UIKit

class Send: UIViewController {

    
    static func Send() -> Send{
        let storyboard = UIStoryboard.init(name: "Send", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "Send") as! Send
        return view
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func stakeVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "stakeVC") as! stakeVC
         navigationController?.pushViewController(vc,
         animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
