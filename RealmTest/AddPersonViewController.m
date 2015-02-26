//
//  AddPersonViewController.m
//  RealmTest
//
//  Created by DMU-24 on 26/02/15.
//  Copyright (c) 2015 DMU-24. All rights reserved.
//

#import "AddPersonViewController.h"

@interface AddPersonViewController ()

@end

@implementation AddPersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)SaveAndSubmit:(id)sender {
    //Create object
    Person *newPerson = [[Person alloc]init];
    newPerson.name = self.nameTxtField.text;
    newPerson.address = self.addressTxtField.text;
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"yyyy-MM-dd"];
    newPerson.born = [df dateFromString:self.bornTxtField.text];
    newPerson.job = self.jobTxtField.text;
    
    //get default realm
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    //Add object to database
    [realm beginWriteTransaction];
    [realm addObject:newPerson];
    [realm commitWriteTransaction];
    
    //Reset txtFields
    for(UITextField *txtField in self.inputTxtFields){
        txtField.text = nil;
    }
    
}

- (IBAction)ExportData:(id)sender {
    NSError* error;
    NSDictionary *jsonData = [[NSDictionary alloc] initWithObjectsAndKeys: [self personsAsDict],@"persons", nil];
    
    //convert NSDictionary to data
    NSData *postData = [NSJSONSerialization dataWithJSONObject:jsonData options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *dataPrint = [[NSString alloc] initWithData:postData encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",dataPrint);

}

-(NSMutableArray *)personsAsDict{
    
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc]init];
    [dateformatter setDateFormat:@"yyyy-MM-dd"];
    
    NSMutableArray *returnArray = [[NSMutableArray alloc]init];

    for(Person *p in [Person allObjects]){
        NSMutableDictionary *personDict = [[NSMutableDictionary alloc]init];
        [personDict setObject:p.name forKey:@"name"];
        [personDict setObject:p.address forKey:@"address"];
        [personDict setObject:[dateformatter stringFromDate:p.born] forKey:@"born"];
        [personDict setObject:p.job forKey:@"job"];
        [returnArray addObject:personDict];
    }
    return returnArray;
}
@end
