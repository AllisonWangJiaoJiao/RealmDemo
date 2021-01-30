//
//  ViewController.swift
//  realm_demo
//
//  Created by allison on 2021/1/17.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        print("数据库path:",Realm.Configuration.defaultConfiguration.fileURL)
        
        let model = MigrationModel()
        model.name = "allison"
        model.age = 18
        model.fullName1 = "fullName001"
        model.fullName2 = "fullName002"

        let realm = try! Realm()
        try! realm.write {
            realm.add(model)
        }
        
    }
    

}


