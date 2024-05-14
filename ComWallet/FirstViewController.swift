//
//  FirstViewController.swift
//  ComWallet
//
//  Created by Ammad on 24/03/2024.
//

import UIKit
import LocalAuthentication
class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let context = LAContext()
            var error: NSError?

            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Identify yourself!"

                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                    [weak self] success, authenticationError in

                    DispatchQueue.main.async {
                        if success {
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                            self?.navigationController?.pushViewController(vc,
                             animated: true)
                           // self?.unlockSecretMessage()
                        } else {
                            print("Wrong face id")
                            // error
                        }
                    }
                }
            } else {
                print("No biometric")
                // no biometry
            }
        // Do any additional setup after loading the view.
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
