//
//
// PaymentOptionsViewController.swift
// CarPlay Demo
//
//Created by Pramod Ranasinghe on 6/3/21
// Copyright © 2021 CBC Tech Solutions. All rights reserved.


import UIKit

class PaymentOptionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUiProps()
        
    }
    
    func setUiProps() {
        let nib = UINib(nibName: PaymentsTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: PaymentsTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func actionBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PaymentsTableViewCell.identifier, for: indexPath) as! PaymentsTableViewCell
        cell.selectionStyle = .none
        cell.actionContinue = {
            self.showSuccessAlert()
        }
        return cell
    }
    
    func showSuccessAlert() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
}

