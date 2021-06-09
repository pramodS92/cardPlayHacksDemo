//
//
// JailBreakViewController.swift
// CarPlay Demo
//
//Created by Pramod Ranasinghe on 6/3/21
// Copyright © 2021 CBC Tech Solutions. All rights reserved.


import UIKit

class JailBreakViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var jailBreakInstructionTextFeild: UITextView!
    
    let jailBreakApps = ["uncOver","Chimera","Chakra1n"]
    let phoneType = "iPhone 11 Pro Max"
    let iOSVersion = "iOS 14.3"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUiProps()
    }
    
    @IBAction func actionBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setUpUiProps() {
        let nib = UINib(nibName: JailBreakTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: JailBreakTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        let text = "Any of the following jailbreak tools can be used to jailbreak your " + phoneType + " Running in " + iOSVersion
        self.jailBreakInstructionTextFeild.attributedText = text.withBoldText(textArray: [phoneType,iOSVersion],fontSize: 16.0)
        self.jailBreakInstructionTextFeild.textAlignment = .left
        self.jailBreakInstructionTextFeild.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: JailBreakTableViewCell.identifier, for: indexPath) as! JailBreakTableViewCell
        cell.selectionStyle = .none
        cell.actionInstall = {
            self.navigateToPaymentViewController()
        }
        if indexPath.row == 4 {
            cell.separatorInset = .zero
        }
        
        return cell
    }
    
    
    func navigateToPaymentViewController(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PaymentOptionsViewController") as! PaymentOptionsViewController
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
}
