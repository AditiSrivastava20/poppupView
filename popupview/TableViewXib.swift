//
//  TableViewXib.swift
//  popupview
//
//  Created by Sierra 4 on 30/03/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import UIKit

protocol ViewClassDelegate{
    func information(info: String)
}

class TableViewXib: UIView  {
    var array1 = [ aray1.hi.rawValue , aray1.thiss.rawValue ,aray1.iss.rawValue, aray1.codebrew.rawValue, aray1.labs.rawValue]
    var array2 = [aray2.Hi.rawValue , aray2.i.rawValue ,aray2.Am.rawValue, aray2.aditi.rawValue,
                  aray2.srivastava.rawValue]
    var btnchoice = 0
    var delegate:ViewClassDelegate?
    
    @IBOutlet var closeView: UIButton!
    @IBOutlet var tblView: UITableView!
    

           {
        didSet{
            
            let nib = UINib(nibName : NIB.tblview.rawValue , bundle : nil)
            tblView.register(nib, forCellReuseIdentifier: NIB.tblcell.rawValue)
            tblView.dataSource = self
            tblView.delegate = self
            NotificationCenter.default.addObserver(self, selector: #selector(btnTap), name: NSNotification.Name(rawValue: NIB.btn.rawValue), object: nil)
        }
    }
    
    func btnTap(notification: NSNotification){
        let userInfo:Dictionary<String,Int> = notification.userInfo as! Dictionary<String,Int>
        let item = userInfo[NIB.Value.rawValue]! as Int
        print(item)
        btnchoice = item
        tblView.reloadData()
    }
    
    
    @IBAction func closebtn(_ sender: Any) {
      
        tblView.isHidden = true
        closeView.isHidden = true
        
    }
    
}
extension TableViewXib : UITableViewDelegate ,UITableViewDataSource ,ViewControllerDelegate
{
    func btnInfo(info: Int) {
        
        btnchoice = info
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array1.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NIB.tblcell.rawValue, for: indexPath) as! firstTableViewCell
        if btnchoice == 0
        {
            tblView.isHidden = false
            closeView.isHidden = false
            cell.lbldata.text = array1[indexPath.row]
            //tblView.reloadData()
            return cell
        }
        else
        {
            tblView.isHidden = false
            closeView.isHidden = false
            cell.lbldata.text = array2[indexPath.row]
            //tblView.reloadData()
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if btnchoice == 0
        {
            self.delegate?.information(info: array1[indexPath.row])
        }
        else
        {
            self.delegate?.information(info: array2[indexPath.row])
        }
    }
}
