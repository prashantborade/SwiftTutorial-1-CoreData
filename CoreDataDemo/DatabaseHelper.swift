//
//  DatabaseHelper.swift
//  CoreDataDemo
//
//  Created by apple on 07/05/19.
//  Copyright © 2019 krispindia. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper {
    
    
    static var sharedInstance = DatabaseHelper()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    
    func save(object:[String:String]) {
        
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!) as! Student
        
        student.name = object["name"]
        student.mobile = object["mobile"]
        student.address = object["address"]
        student.city = object["city"]
        
        do{
            
            try context?.save()
        }catch{
            
            print("Data not saved")
        }
    }
    
    func getData() -> [Student] {
        
        var student = [Student]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        
        do{
            
            student = try context?.fetch(fetchRequest) as! [Student]
            
        }catch{
            
            print("Could not fetch student data")
        }
        
        return student
    }
    
    func deleteData(index:Int) -> [Student]{
        
        var student = getData()
        context?.delete(student[index])
        student.remove(at: index)
        
        do{
            
            try context?.save()
        }catch{
            
            print("Can not delete Data")
        }
        
        return student
    }
    
    func editData(object:[String:String], i:Int) {
        
        var student = getData()
        
        student[i].name = object["name"]
        student[i].city = object["city"]
        student[i].address = object["address"]
        student[i].mobile = object["mobile"]
        
        do{
            
            try context?.save()
            
        }catch{
            print("Can not edited")
        }
    }
    
    
}
