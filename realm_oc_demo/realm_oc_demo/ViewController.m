//
//  ViewController.m
//  realm_oc_demo
//
//  Created by allison on 2021/1/22.
//

#import "ViewController.h"
#import <Realm/Realm.h>
#import "MigrationModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setDefaultRealmForUser:@"zhangsan"];
    [self migrationAction];
}


///数据库迁移
- (void)migrationAction {
    NSLog(@"数据库路径:%@",[[RLMRealmConfiguration defaultConfiguration]fileURL]);
    MigrationModel *model = [[MigrationModel alloc]init];
    model.name = @"allison";
    model.age = 18;
    model.fullName = @"allison-fullname";
    model.fullName2 = @"fullname22222";
    model.fullName3 = @"fullname33333";

    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:model];
    }];
    
}

- (void)setDefaultRealmForUser:(NSString *)userName {
//    RLMRealm *realm = [RLMRealm defaultRealm];
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    //使用默认的目录，但是使用用户名来替换默认的文件名
    config.fileURL = [[[config.fileURL URLByDeletingLastPathComponent]URLByAppendingPathComponent:userName]URLByAppendingPathExtension:@"realm"];
    //将这个配置应用到默认的realm数据库中
    [RLMRealmConfiguration setDefaultConfiguration:config];
    
}

@end
