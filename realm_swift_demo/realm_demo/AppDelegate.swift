//
//  AppDelegate.swift
//  realm_demo
//
//  Created by allison on 2021/1/17.
//

import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        migrationRealmAction()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController()
        return true
    }
    
    // MARK:数据迁移
    func migrationRealmAction() -> Void {
        let newVersion : UInt64 = 2
        let config = Realm.Configuration(
            schemaVersion: newVersion,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < newVersion) {
                    print("需要迁移")
                    // 没有什么要做的！
                    // Realm 会自行检测新增和被移除的属性
                    // 然后会自动更新磁盘上的架构
                }
            })
        Realm.Configuration.defaultConfiguration = config
        // 打开文件将会自动执行迁移
//        let realm = try! Realm()
        do {
            try! Realm()
        } catch  {
            print("=====error:",error)
        }
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

