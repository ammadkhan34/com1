//
//  ViewController.swift
//  ComWallet
//
//  Created by Ammad on 09/01/2024.
//

import UIKit
import Substrate
import SubstrateRPC
import Bip39
import CoreImage.CIFilterBuiltins
import SubstrateKeychain
import RealmSwift
struct Validator: Decodable {
    let id: String?
    let name: String?
    let address: String?
    let emission: Int?
    let incentive: Int?
    let dividends: Int?
    let regblock: Int?
    let lastUpdate: Int?
    let balance: Int?
    let stake: Int?
    let totalStakers: Int?
    let delegationFee: Int?
    let type: String?
    let key: String?
    let apy: Double?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, address, emission, incentive, dividends, regblock, lastUpdate = "last_update", balance, stake, totalStakers = "total_stakers", delegationFee = "delegation_fee", type, key, apy
    }
}

struct Stake: Decodable {
    let validator: Validator?
    let amount: Int?
}

struct ResponseData: Decodable {
    let balance: Int?
    let staked: Int?
    let stakes: [Stake]?
}

class ViewController: UIViewController {

        
    @IBOutlet weak var transactionsTable: UITableView!
    
    
    // MARK: - Constructor
    static func ViewController() -> ViewController{
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "ViewController") as! ViewController
        return view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        transactionsTable.dataSource = self
        transactionsTable.delegate = self
        transactionsTable.register(UINib(nibName: "WalletCell", bundle: nil), forCellReuseIdentifier: "WalletCell")

       // .register(<#T##nib: UINib?##UINib?#>, forCellReuseIdentifier: <#T##String#>)
//        let mnemonic = try! Bip39.Wordlist(words: ["","",""])
//        print("Mnemonic phrase: \(mnemonic)")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        Task {
             //   await startAPI()
            }
        // Do any additional setup after loading the view.
    }

    @IBAction func createWallet(_ sender: Any) {
        print("creating")
        navigationController?.pushViewController(CreateVC1.CreateVC1(), animated: true)
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "CreateVC1") as! CreateVC
//         navigationController?.pushViewController(vc,
//         animated: true)

//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "CreateVC") as! CreateVC
//         navigationController?.pushViewController(vc,
//         animated: true)
    }
    
    
    @IBAction func importWallet(_ sender: Any) {
       // fetchJSONData()
      //  importWallet()
       // createPolkadotWallet()
        self.navigationController?.pushViewController(CreateVC.CreateVC(), animated: true)

    }
 
    func createPolkadotWallet() {
       // importWallet(<#T##Any#>)
        guard let mnemonic = try? Mnemonic() else {
                    showAlert(message: "Error generating mnemonic phrase")
                    return
                }
        
        
        print("Mnemonic is", mnemonic.mnemonic())
        let seed = Data(mnemonic.substrate_seed())
                // Convert mnemonic phrase to seed
              
           do {
               // Generate a new key pair using Substrate
               let keyPair = try Sr25519KeyPair(seed: seed)
               let address = try keyPair.publicKey.ss58(format: .substrate)
             print(address)
               showAlert(message: "Your Polkadot wallet address is \(address)")
           } catch {
               // Handle error
               print("Error creating Polkadot wallet: \(error.localizedDescription)")
               showAlert(message: "Error creating Polkadot wallet. Please try again.")
           }
       }
    
    
    
    func importWallet() {
       // importWallet(<#T##Any#>)
    
        
        
      //  print("Mnemonic is", mnemonic.mnemonic())
        
        //let seed = Data(mnemonic.substrate_seed())
                // Convert mnemonic phrase to seed
              
           do {
               
               let seed = Data(try Mnemonic(mnemonic: ["siege", "argue", "shell", "flavor", "ranch", "staff", "reform", "trust", "ramp", "differ", "enrich", "destroy"], wordlist: .english).substrate_seed())
               // Generate a new key pair using Substrate
               let keyPair = try Sr25519KeyPair(seed: seed)
               let address = try keyPair.publicKey.ss58(format: .substrate)
             print(address)
               showAlert(message: "Your Polkadot wallet address is \(address)")
           } catch {
               // Handle error
               print("Error creating Polkadot wallet: \(error.localizedDescription)")
               showAlert(message: "Error creating Polkadot wallet. Please try again.")
           }
       }
       
//       func storePrivateKeyInKeychain(_ privateKeyData: Data) throws {
//           // Access Keychain
//           let keychain = Keychain(service: "com.yourapp.polkadotwallet")
//           
//           // Store private key securely in Keychain
//           try keychain.set(privateKeyData, key: "privateKey")
//       }
       
       func showAlert(message: String) {
           let alertController = UIAlertController(title: "Polkadot Wallet Created", message: message, preferredStyle: .alert)
           alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           present(alertController, animated: true, completion: nil)
       }
    
//    private func startAPI() async {
//        do {
//            let nodeUrl = URL(string: "wss://westend-rpc.polkadot.io")!
//            
//            // Dynamic Config should work for almost all Substrate based networks.
//            // It's not most eficient though because uses a lot of dynamic types
//            let substrate = try await Api(
//                rpc: JsonRpcClient(.ws(url: nodeUrl)),
//                config: .dynamicBlake2
//            )
//            
//            print("Done")
//            await initializeSubstrateAPI()
//            
//        }
//        
//        catch {
//            // Handle initialization error and update UI accordingly
//            print("Failed to initialize Substrate API: \(error)")
//        }
//    }
//    
//    private func initializeSubstrateAPI() async {
//      
//       
//        do {
//            let nodeUrl = URL(string: "wss://westend-rpc.polkadot.io")!
//            
//            // Dynamic Config should work for almost all Substrate based networks.
//            // It's not most eficient though because uses a lot of dynamic types
//            let substrate = try await Api(
//                rpc: JsonRpcClient(.ws(url: nodeUrl)),
//                config: .dynamicBlake2
//            )
//            // Initialize Substrate API
//            let mnemonic = "child cave wood vocal chaos salute spin middle damp endless note sniff"
//            let from = try Sr25519KeyPair(parsing: mnemonic + "//Key1") // hard key derivation
//
//            // Create recipient address from ss58 string
//            let to = try substrate.runtime.address(ss58: "5FqVuhD8E5rmd8akHi31vQUXagsDWWmSbb8zSWUampR1Rq7F")
//
//            // Dynamic Call type with Map parameters.
//            // any ValueRepresentable type can be used as parameter
//            let call = AnyCall(name: "transfer",
//                               pallet: "Balances",
//                               params: ["dest": to, "value": 15483812850])
//
//            // Create Submittable (transaction) from the call
//            let tx = try await substrate.tx.new(call)
//
//            // We are using direct signer API here
//            // Or we can set Keychain as signer in Api and provide `account` parameter
//            // `waitForFinalized()` will wait for block finalization
//            // `waitForInBlock()` will wait for inBlock status
//            // `success()` will search for failed event and throw in case of failure
//            let events = try await tx.signSendAndWatch(signer: from)
//                    .waitForFinalized()
//                    .success()
//
//            // `parsed()` will dynamically parse all extrinsic events.
//            // Check `ExtrinsicEvents` struct for more efficient search methods.
//            print("Events: \(try events.parsed())")
//
//            // You can now use 'substrate' to interact with the Substrate API
//        } catch {
//            // Handle initialization error and update UI accordingly
//            print("Failed to initialize Substrate API: \(error)")
//        }
//
//    }

    
}

@IBDesignable
class DesignableButton: UIButton {

    @IBInspectable internal override var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.masksToBounds = newValue > 0
            layer.cornerRadius = newValue
        }
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setNeedsDisplay()
    }

}

extension UIView {

    @IBInspectable var shadow: Bool {
        get {
            return layer.shadowOpacity > 0.0
        }
        set {
            if newValue == true {
                self.addShadow()
            }
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue

            // Don't touch the masksToBound property if a shadow is needed in addition to the cornerRadius
            if shadow == false {
                self.layer.masksToBounds = true
            }
        }
    }


    func addShadow(shadowColor: CGColor = UIColor.black.cgColor,
               shadowOffset: CGSize = CGSize(width: 1.0, height: 2.0),
               shadowOpacity: Float = 0.4,
               shadowRadius: CGFloat = 3.0) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
}


extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        get_offline_data_count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let wallet_address = get_wallet_addresses()
       
        let cell:WalletCell = transactionsTable.dequeueReusableCell(withIdentifier: "WalletCell") as! WalletCell
        cell.walletaddress.text = wallet_address[indexPath.row]
        cell.walletnumber.text = "Wallet \(indexPath.row+1):"
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let realm = try! Realm()
        let info = realm.objects(WalletAddresses.self)
        self.navigationController?.pushViewController(DetailsVC.DetailsVC(wallet_address: info[indexPath.row].Address, wallet_mnemonic: info[indexPath.row].mnemonic.map { $0 }), animated: true)
    }


    
    
    func get_offline_data_count() -> Int {
        let realm = try! Realm()
        let info = realm.objects(WalletAddresses.self)
        if !info.isEmpty {
            return info.count
        } else {
            return 0 // or any other default value you want
        }
    }
    
    func get_wallet_addresses() -> [String] {
        let realm = try! Realm()
        let info = realm.objects(WalletAddresses.self)
        var addresses: [String] = []
        for walletAddress in info {
            addresses.append(walletAddress.Address)
        }
        return addresses
    }

}


extension UIView {

  @IBInspectable var borderWidth: CGFloat {
    get {
        return layer.borderWidth
    }
    set {
        layer.borderWidth = newValue
    }
  }

  @IBInspectable var borderColor: UIColor? {
    get {
        return UIColor(cgColor: layer.borderColor!)
    }
    set {
        layer.borderColor = newValue?.cgColor
    }
  }
}
