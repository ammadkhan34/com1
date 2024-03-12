//
//  wallet.swift
//  ComWallet
//
//  Created by Muhammad Zia Shahid on 12/03/2024.
//

import Foundation
import RealmSwift

class WalletAddresses: Object {
    @Persisted var Address: String
    @Persisted var mnemonic: List<String>
}

