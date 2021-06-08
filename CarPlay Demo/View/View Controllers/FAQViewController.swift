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
    
    let questionFAQ = ["Do I need to pay for all the apps ? No its only a one time payment for all the apps. So once you made a payment, you are getting the oppertunity add any desired app for CarPlay.",
                       "What can I do if I do not have a compatible jailbreak for my iDevice?We are updating the app as soon as new jailbreak tools are released. Until that you can use the InCar app which is an alternative for CarPlay. It only runs on the phone screen as a simulation of CarPlay.",
                       "Can I get apps on CarPlay without jailbreaking iPhone?Actually adding non default apps to CarPlay is a process which goes beyond to what Apple offers. So we need to overcome the restrictions imposed by Apple. Its not that difficutl to jailbreak your iPhone. Simply select a tool and follow the step guide.",
                       "What is the difference between CarBridge and WheelPal?CarBridge runs apps realtime on the CarPlay screen while WheelPal mirrors the phone app to the screen. But CarBridge cannot display some apps like Netflix as it cannot go beyond the DRM imposed by Netflix. But WheelPal can mirror any app on CarPlay.","Do I need to pay monthly for WheelPal ?No it's only a one time payment for lifetime. Once you make a payments, all the apps get unlocked for you"]
    
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
        
        tableView.estimatedRowHeight = 180
        tableView.rowHeight = UITableView.automaticDimension
        
    }
    
    @IBAction func actionBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.selectedIndex == indexPath.row && isCollapse == true {
            return 180
        }else {
            return 55
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionFAQ.count
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
        cell.textFieldFAQ.text = questionFAQ[indexPath.row]
        return cell
    }
    
}




