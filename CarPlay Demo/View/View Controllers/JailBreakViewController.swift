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
    
    let jailBreakApps = ["uncOver","Chimera","Chakra1n"]
    
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
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jailBreakApps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: JailBreakTableViewCell.identifier, for: indexPath) as! JailBreakTableViewCell
        cell.selectionStyle = .none
        cell.actionInstall = {
            self.navigateToPaymentViewController()
        }
        
        return cell
    }
    
    
    func navigateToPaymentViewController(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PaymentOptionsViewController") as! PaymentOptionsViewController
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
}
