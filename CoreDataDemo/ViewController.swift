//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by apple on 07/05/19.
//  Copyright © 2019 krispindia. All rights reserved.
//

import UIKit

class ViewController: UIViewController , DataPass{
    

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    
    var i = Int()
    var isUpdate = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnSaveClicked(_ sender: Any) {
        
        let dict = ["name":txtName.text,"mobile":txtMobile.text,"address":txtAddress.text,"city":txtCity.text]
        
        if isUpdate {
            
            DatabaseHelper.sharedInstance.editData(object: dict as! [String : String], i: i)
        }
        else
        {
        DatabaseHelper.sharedInstance.save(object: dict as! [String : String] )
            
        }
    }
    
    @IBAction func showListStudent(_ sender: Any) {
        
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        obj.delegate = self
       self.navigationController?.pushViewController(obj, animated: true)
        
    }
    func data(object: [String : String], index: Int, isEdit: Bool) {
        
        txtName.text = object["name"]
        txtCity.text = object["city"]
        txtMobile.text = object["mobile"]
        txtAddress.text = object["address"]
        
        i = index
        isUpdate = isEdit
        
    }
}

