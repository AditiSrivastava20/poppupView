//
//  ViewController.swift
//  popupview
//
//  Created by Sierra 4 on 30/03/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import UIKit


protocol ViewControllerDelegate{
    func btnInfo(info: Int)
}


class ViewController: UIViewController ,ViewClassDelegate {

    @IBOutlet var ViewTable: UIView!
    @IBOutlet var lblInfo: UILabel!
    var delegate:ViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewTable.isHidden = true
        let subView = ViewController.instanceFromNib() as! TableViewXib
        ViewTable.center = CGPoint(x: 120, y: 120)
        ViewTable.addSubview(subView)
        subView.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(btnTap), name: NSNotification.Name(rawValue: NIB.btn.rawValue), object: nil)
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: NIB.view1.rawValue, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    @IBAction func Refresh(_ sender: Any) {
    lblInfo.text = enumeration.nilWrapping.rawValue
        
    }

       func btnTap(_ tag: Int)
    {
        
    }
    
    func information(info: String) {
        lblInfo.text = info
        print(info)
    }
    @IBAction func btnOpenTable(_ sender: UIButton) {
        if sender.tag == 0
        {
            
            ViewTable.isHidden = false
            NotificationCenter.default.post(name: NSNotification.Name(NIB.btn.rawValue), object: nil, userInfo: [NIB.Value.rawValue : sender.tag])
           
        }
        else if sender.tag == 1
        {
            ViewTable.isHidden = false
            NotificationCenter.default.post(name: NSNotification.Name(NIB.btn.rawValue), object: nil, userInfo: [NIB.Value.rawValue : sender.tag])
            
        }
    }
}


