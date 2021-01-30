//
//  MigrationModel.h
//  realm_oc_demo
//
//  Created by allison on 2021/1/24.
//

#import <Realm/Realm.h>

NS_ASSUME_NONNULL_BEGIN

@interface MigrationModel : RLMObject
//新增字段
@property NSString *fullName3;

@property NSString *fullName2;

@property NSString *fullName;

@property NSString *name;

@property int age;
@end

NS_ASSUME_NONNULL_END
