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
    @IBOutlet weak var paymentOptionTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUiProps()
        
    }
    
    func setUiProps() {
        let nib = UINib(nibName: PaymentsTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: PaymentsTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        let text = "You are one step away from adding add any app to cardPlay.Let's get your lifetime membership only for 9.99$ and enjoy."
        self.paymentOptionTextField.attributedText = text.withBoldText(textArray: [" add any app to cardPlay"],fontSize: 16.0)
        self.paymentOptionTextField.textAlignment = .left
        self.paymentOptionTextField.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
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

