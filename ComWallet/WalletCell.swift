//
//  WalletCell.swift
//  ComWallet
//
//  Created by Ammad on 03/03/2024.
//

import UIKit

class WalletCell: UITableViewCell {

    
    @IBOutlet weak var walletaddress: UILabel!
    
    @IBOutlet weak var walletnumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
