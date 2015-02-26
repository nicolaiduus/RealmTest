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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

}

-(NSMutableDictionary *)personsAsDict{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    return dict;
}
@end
