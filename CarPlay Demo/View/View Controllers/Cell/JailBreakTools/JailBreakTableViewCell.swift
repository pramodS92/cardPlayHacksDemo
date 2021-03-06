//
//
// JailBreakTableViewCell.swift
// CarPlay Demo
//
//Created by Pramod Ranasinghe on 6/3/21
// Copyright © 2021 CBC Tech Solutions. All rights reserved.


import UIKit

class JailBreakTableViewCell: UITableViewCell {
    static let identifier = "JailBreakTableViewCell"
    
    @IBOutlet weak var jailBreakAppIcon: UIImageView!
    @IBOutlet weak var jailBreakAppName: UILabel!
    @IBOutlet weak var jailBreakAppDescription: UILabel!
    @IBOutlet weak var jailBreakAppInstallButton: UIButton!
    @IBOutlet weak var jailBreakSeparator: UIView!
    
    var actionInstall: (()->Void)? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        self.jailBreakAppInstallButton.layer.cornerRadius = 3

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func actionInstall(_ sender: Any) {
        self.actionInstall?()
    }
    
}
