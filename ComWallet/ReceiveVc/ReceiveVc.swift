//
//  ReceiveVc.swift
//  ComWallet
//
//  Created by Ammad on 11/01/2024.
//

import UIKit

class ReceiveVC: UIViewController {

    @IBOutlet weak var qrImage: UIImageView!
    
    
    
    static func ReceiveVC() -> ReceiveVC{
        let storyboard = UIStoryboard.init(name: "ReceiveVC", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "ReceiveVC") as! ReceiveVC
        return view
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let QRimage = generateQRCode(from: "Hello, world 23 45 we sd fr ew sw!")
        self.qrImage.image = QRimage
      //  self.QRView.image = QRimage
        // Do any additional setup after loading the view.
    }
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        if let QRFilter = CIFilter(name: "CIQRCodeGenerator") {
            QRFilter.setValue(data, forKey: "inputMessage")
            guard let QRImage = QRFilter.outputImage else {return nil}
            return UIImage(ciImage: QRImage)
        }
        return nil
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
