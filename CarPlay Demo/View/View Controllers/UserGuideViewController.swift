//
//
// UserGuideViewController.swift
// CarPlay Demo
//
//Created by Pramod Ranasinghe on 6/5/21
// Copyright © 2021 CBC Tech Solutions. All rights reserved.


import UIKit

class UserGuideViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    @IBOutlet weak var stepCounterLabel: UILabel!
    @IBOutlet weak var stepDescription: UITextView!
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 8
        pageControl.backgroundColor = .clear
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.2050077915, green: 1, blue: 0, alpha: 1)
        
        return pageControl
    }()
    
    let images = [UIImage(named: "image1"),
                  UIImage(named: "image2"),
                  UIImage(named: "image3"),
                  UIImage(named: "image4"),
                  UIImage(named: "image5"),
                  UIImage(named: "image6"),
                  UIImage(named: "image7"),
                  UIImage(named: "image8")]
    
    
    let userGuideDescriptions = ["Copy the following repository","Open Sileo/Cydia and  then click on the Sources Tab.",
                                 "Go to add Sources And Paste the repo, So that you can add it.",
    "Go to Search bar in Sileo/Cydia and search NGXPlay.Select NGXPlay11 in search results so that you can Install it to your iPhone.",
    "Open NGXPlay",
    "Select the option ‘Application’, then it will display all the installed apps on your phone.",
    "Select the desired app from the app list, which is to be added to CarPlay. Then it will show the app options.",
    "Simply switch on the Enable switch, then the app will be added to your CarPlay !"]
    
    let pageCount = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUiProps()
    }
    
    func setUiProps(){
        scrollView.delegate = self
        
        scrollView.backgroundColor = .clear
        pageControl.addTarget(self, action: #selector(pageControllDidChanged(_:)), for: .valueChanged)
        
        view.addSubview(scrollView)
        view.addSubview(pageControl)
    }
    
    @objc private func pageControllDidChanged(_ sender: UIPageControl) {
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pageControl.frame = CGRect(x: 10, y: view.frame.size.height - 70, width: view.frame.size.width - 20, height: 50)
        scrollView.frame = CGRect(x: 0, y: 180, width: view.frame.size.width, height:  view.frame.size.height - 100)
        
        if scrollView.subviews.count == 2 {
            configureScrollView()
        }
    }
    
    func  configureScrollView() {
        scrollView.contentSize = CGSize(width: view.frame.size.width * CGFloat(pageCount), height: scrollView.frame.size.height)
        scrollView.isPagingEnabled = true

        for x in 0..<pageCount {
            let page = UIView(frame: CGRect(x: CGFloat(x) * view.frame.size.width,y: 0, width: view.frame.size.width,height: scrollView.frame.size.height))
            let image = images[x]
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: 0, y: 40, width:  view.frame.size.width, height:  view.frame.size.height - 250)
            imageView.contentMode = .scaleAspectFill
            imageView.backgroundColor = .clear
            page.addSubview(imageView)
            
           
            
            self.view.bringSubview(toFront: imageView)
            scrollView.addSubview(page)
        }
    }
    
    
}


extension UserGuideViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageNumber = Int(floorf( Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
        pageControl.currentPage = pageNumber
        if pageNumber >= 0 {
            self.stepCounterLabel.text =  "Step " + String(pageNumber + 1)
            self.stepDescription.text =  userGuideDescriptions[pageNumber]
        }
        
       
    }
}
