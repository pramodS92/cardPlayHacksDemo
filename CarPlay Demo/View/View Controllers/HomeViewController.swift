//
//
// HomeViewController.swift
// CarPlay Demo
//
//Created by Pramod Ranasinghe on 5/27/21



import UIKit
import Foundation


enum Category: Int {
    case entertainment = 0
    case utilities = 1
    case health = 2
    case social = 3
    case medicines = 4
    case finance = 5
    case skin = 6
    case surgeon = 7
}

class HomeViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    static let segue = "homeSegue"
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var homeSearchContainerView: UIView!
    @IBOutlet weak var homeSearchTextInput: UITextField!
    @IBOutlet weak var selectedCategotyLabel: UILabel!
    @IBOutlet weak var appListTableView: UITableView!
    @IBOutlet var homeMenuButtons: [UIButton]!
    @IBOutlet var homeMenuTitles: [UILabel]!
    
    let homeMenuList = ["Entertainment","Utilities","Health","Social","Medicines","Finance","Skin","Surgeon"]
    var tableData: [AppDetails] = []
    var sortTableData: [AppDetails] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configData()
        self.setUpUiProps()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillAppear(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillDisappear(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
        
    }
    
    
    
    func configData(){
        tableData.append(AppDetails(appName: "YouTube", appDescription: "aaaa", appImage: UIImage(named: "Youtube")!))
        tableData.append(AppDetails(appName: "FaceBook", appDescription: "bbbb", appImage: UIImage(named: "Facebook")!))
        tableData.append(AppDetails(appName: "Netflix", appDescription: "cccc", appImage: UIImage(named: "Netflix")!))
        tableData.append(AppDetails(appName: "YouTube", appDescription: "ddddd", appImage: UIImage(named: "Youtube")!))
        tableData.append(AppDetails(appName: "FaceBook", appDescription: "eeeee", appImage: UIImage(named: "Facebook")!))
        tableData.append(AppDetails(appName: "Netflix", appDescription: "fffffff", appImage: UIImage(named: "Netflix")!))
        
        sortTableData = tableData
    }
    
    
    
    
    func setUpUiProps() {
        self.homeSearchContainerView.layer.borderWidth = 1
        self.homeSearchContainerView.layer.cornerRadius = 8
        self.homeSearchContainerView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.homeSearchTextInput.placeholder = "Search app name, youtube etc"
        
        let nib = UINib(nibName: HomeCategoryTableViewCell.identifier, bundle: nil)
        appListTableView.register(nib, forCellReuseIdentifier: HomeCategoryTableViewCell.identifier)
        appListTableView.delegate = self
        appListTableView.dataSource = self
        
        self.hideLoginKeyboardWhenTappedAround()
        self.setMenuProps()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(navigateToFAQ))
        profileImage.addGestureRecognizer(tap)
        profileImage.isUserInteractionEnabled = true
        
        self.homeSearchTextInput.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    
    
    @objc func keyboardWillAppear(notification: NSNotification) {
        self.view.frame.origin.y = -70
    }
    
    @objc func keyboardWillDisappear(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    
    func setMenuProps() {
        for (index, element) in homeMenuTitles.enumerated() {
            element.text = homeMenuList[index]
        }
    }
    
    @objc func textFieldDidChange(_ sender: UITextField) {
        if (sender.text == "") {
            sortTableData = tableData
        }else{
            sortTableData.removeAll()
            for object in tableData{
                if object.appName.lowercased().contains((sender.text?.lowercased())!){
                    sortTableData.append(object)
                }
            }
        }
        
        appListTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortTableData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = appListTableView.dequeueReusableCell(withIdentifier: HomeCategoryTableViewCell.identifier, for: indexPath) as! HomeCategoryTableViewCell
        cell.selectionStyle = .none
        cell.cetegoryAddButton.tag = indexPath.row
        cell.categoryItemAppName.text = self.sortTableData[indexPath.row].appName
        cell.categoryItemAppIcon.image = self.sortTableData[indexPath.row].appImage
        cell.actionCellClick = {
            self.navigateToAppInstaller(appName:  self.sortTableData[indexPath.row].appName)
        }
        
        let totalRows = tableView.numberOfRows(inSection: indexPath.section)
        cell.homeCellSeparator.isHidden = indexPath.row == totalRows - 1 ? true: false
        return cell
    }
    
    
    
    func navigateToAppInstaller(appName: String) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AppInstalationViewController") as! AppInstalationViewController
        vc.modalPresentationStyle = .overCurrentContext
        vc.appName = appName
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func navigateToFAQ(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FAQViewController") as! FAQViewController
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func homeMenuTapAction(_ sender: UIButton) {
        selectedCategotyLabel.text = homeMenuList[sender.tag]
        let categoryType = Category(rawValue: sender.tag)
        
        //Change table data array according to the category
        switch categoryType {
        case .entertainment:
            print("..entertainment")
        case .utilities:
            print("..utilities")
        case .health:
            print("..health")
        case .social:
            print("..social")
        case .medicines:
            print("..medicines")
        case .finance:
            print("..finance")
        case .skin:
            print("..skin")
        case .surgeon:
            print("..surgeon")
        default:
            print("..entertainment")
        }
        appListTableView.reloadData()
        
    }
    
}


extension HomeViewController {
    func hideLoginKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}


struct AppDetails {
    var appName: String
    var appDescription: String
    var appImage: UIImage
}



