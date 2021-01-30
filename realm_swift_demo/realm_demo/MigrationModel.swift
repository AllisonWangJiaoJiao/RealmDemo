//
//  MigrationModel.swift
//  realm_demo
//
//  Created by allison on 2021/1/25.
//

import Foundation
import RealmSwift

class MigrationModel: Object {
    @objc dynamic var fullName2 = ""
    @objc dynamic var fullName1 = ""
    @objc dynamic var name = ""
    @objc dynamic var age = 0
}
