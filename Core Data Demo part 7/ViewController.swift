//
//  ViewController.swift
//  Core Data Demo part 7
//
//  Created by TrungLD on 6/8/20.
//  Copyright © 2020 TrungLD. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        newUser.setValue("trung", forKey: "username")
        
        newUser.setValue("pass", forKey: "password")
        newUser.setValue(21, forKey: "age")
        do {
            try context.save()
            print("saved")
        } catch {
            print("save failed")
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.fetch(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    if let username = result.value(forKey: "username") as? String {
                        print(username)
                    }
                    
                    
                    
                }
                
            }
            else {
                print("No results")
            }
        } catch {
            print("Couldn't fetch results")
        }
    }


}

