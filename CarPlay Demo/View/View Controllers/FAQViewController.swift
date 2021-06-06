//
//
// FAQViewController.swift
// CarPlay Demo
//
//Created by Pramod Ranasinghe on 6/5/21
// Copyright © 2021 CBC Tech Solutions. All rights reserved.


import UIKit

class FAQViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tabelViewHieght: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    var selectedIndex = -1
    var isCollapse = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUiProps()
    }
    
    func setupUiProps() {
        let nib = UINib(nibName: FAQTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: FAQTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 156
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    @IBAction func actionBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.selectedIndex == indexPath.row && isCollapse == true {
            return 156
        }else {
            return 55
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if self.selectedIndex == indexPath.row {
            if self.isCollapse == false {
                self.isCollapse = true
            }else {
                self.isCollapse = false
            }
        }else {
            self.isCollapse = true
        }
        
        self.selectedIndex = indexPath.row
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FAQTableViewCell.identifier, for: indexPath) as! FAQTableViewCell
        cell.selectionStyle = .none
        cell.titleFAQ.text = "Here is yout FAQ #" + String(indexPath.row + 1)
        return cell
    }
    
}


