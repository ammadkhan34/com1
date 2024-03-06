//
//  DetailsVC.swift
//  ComWallet
//
//  Created by Ammad on 11/01/2024.
//

import UIKit

class DetailsVC: UIViewController {
    var transactionData: TransactionData?
    @IBOutlet weak var noTransactionImage: UIImageView!
    @IBOutlet weak var NoTransactionLabel: UILabel!
    @IBOutlet weak var transactionsTable: UITableView!
    @IBOutlet weak var stackedBalance: UILabel!
    @IBOutlet weak var totalBalance: UILabel!
    @IBOutlet var optionsView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addRightSideShadow(to: optionsView)
        fetchWalletData()
        transactionsTable.register(UINib(nibName: "TransactionCell", bundle: nil), forCellReuseIdentifier: "TransactionCell")
        transactionsTable.dataSource = self
        transactionsTable.delegate = self
        fetchWalletTransactions()
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
    
    
    func fetchWalletTransactions() {
        guard let url = URL(string: "https://api.explorer.comwallet.io/transactions/wallet/5GZBhMZZRMWCiqgqdDGZCGo16Kg5aUQUcpuUGWwSgHn9HbRC") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                self.transactionData = try JSONDecoder().decode(TransactionData.self, from: data)
                // Now you have access to transactionData which contains the decoded JSON data
                if self.transactionData?.data.count ?? 0 > 0 {
                    DispatchQueue.main.async {
                        self.transactionsTable.isHidden = false
                        self.NoTransactionLabel.isHidden = true
                        self.noTransactionImage.isHidden = true
                        self.transactionsTable.reloadData()
                    }
                }
                print("Trans data is",self.transactionData)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    
    func fetchWalletData() {
        guard let url = URL(string: "https://api.comstats.org/balance/?wallet=5GZBhMZZRMWCiqgqdDGZCGo16Kg5aUQUcpuUGWwSgHn9HbRC") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                return
            }

            guard let data = data else {
                return
            }
print("Data is", data)
            print("Response is", response)
            do {
                        let responseData = try JSONDecoder().decode(ResponseData.self, from: data)
                
                print("Balance is ", responseData)

                DispatchQueue.main.async {
                    self.totalBalance.text = String(responseData.balance ?? 0)
                    self.stackedBalance.text = String(responseData.staked ?? 0)
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


extension DetailsVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (transactionData?.data.count ?? 1) - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = transactionsTable.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as? TransactionCell, let transactionData =  transactionData,transactionData.data.count != 0  {
            print("Data here is",transactionData.data[indexPath.row])
            cell.comPrice.text = transactionData.data[indexPath.row].fee
            cell.dateAndTime.text = transactionData.data[indexPath.row].timestamp
            cell.methodType.text = transactionData.data[indexPath.row].method
            cell.comAmount.text = transactionData.data[indexPath.row].amount
           return cell
        }
        return UITableViewCell()
    }
    
    
}
