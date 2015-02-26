//
//  Person.h
//  RealmTest
//
//  Created by DMU-24 on 26/02/15.
//  Copyright (c) 2015 DMU-24. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>

@interface Person : RLMObject

@property NSString *name;
@property NSString *address;
@property NSDate *born;
@property NSString *job;

@end
