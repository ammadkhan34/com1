//
//  DetailsVC.swift
//  ComWallet
//
//  Created by Ammad on 11/01/2024.
//

import UIKit

class DetailsVC: UIViewController {

    var wallet_address = ""
    var wallet_mnemonic:[String] = []
    
    // MARK: - Constructor
    static func DetailsVC(wallet_address:String,wallet_mnemonic:[String]) -> DetailsVC{
        let storyboard = UIStoryboard.init(name: "DetailsVC", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "DetailsVC") as! DetailsVC
        view.wallet_address = wallet_address
        view.wallet_mnemonic = wallet_mnemonic
        return view
    }

    
    @IBOutlet weak var stackedBalance: UILabel!
    @IBOutlet weak var totalBalance: UILabel!
    @IBOutlet var optionsView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addRightSideShadow(to: optionsView)
        fetchJSONData()
        // Do any additional setup after loading the view.
    }
    
    func addRightSideShadow(to view: UIView) {
            // Customize shadow properties
            view.layer.masksToBounds = false
            view.layer.shadowColor = UIColor.black.cgColor  // Set the shadow color
            view.layer.shadowOpacity = 0.3
            view.layer.shadowOffset = CGSize(width: 10, height: 5)  // Adjust the offset to create a right-side shadow
            view.layer.shadowRadius = 20

            // Optionally, you can set the corner radius to the view if you want rounded corners
            view.layer.cornerRadius = 12
        }
    
    func fetchJSONData() {
        guard let url = URL(string: "https://api.comstats.org/balance/?wallet=\(wallet_address)") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                return
            }

            guard let data = data else {
                return
            }
            //print("Data is", data)
//            print("Response is", response)
            do {
                        let responseData = try JSONDecoder().decode(ResponseData.self, from: data)
                
//                print("Balance is ", responseData)

                DispatchQueue.main.async {
                    self.totalBalance.text = String(responseData.balance ?? 0)
                    self.stackedBalance.text = String(responseData.staked ?? 0) + " com"
                }
             
                    } catch {
                        print("Error decoding JSON:", error)

                    }
        }.resume()
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
