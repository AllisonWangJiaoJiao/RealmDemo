//
//  AppDelegate.m
//  realm_oc_demo
//
//  Created by allison on 2021/1/22.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <Realm/Realm.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    ViewController *vc = [[ViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = nav;
    [self migrationRealmAction];
    return YES;
}

#pragma mark -- <迁移数据库>
- (void)migrationRealmAction {

    NSLog(@"数据库路径:%@",[[RLMRealmConfiguration defaultConfiguration]fileURL]);
    //1.获取默认配置
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    //2.叠加版本号（要比上一次版本号高）
    int newVersion = 3;
    config.schemaVersion = newVersion;
    //3.迁移步骤
    [config setMigrationBlock:^(RLMMigration * _Nonnull migration, uint64_t oldSchemaVersion) {
            if (oldSchemaVersion < newVersion) {
                NSLog(@"--需要迁移--oldSchemaVersion:%llu migration:%@",oldSchemaVersion,migration);
            }
    }];
    //4.让配置生效
    [RLMRealmConfiguration setDefaultConfiguration:config];
    //5.需要立即迁移
    [RLMRealm defaultRealm];

}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
