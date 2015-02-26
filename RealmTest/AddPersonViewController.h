//
//  AddPersonViewController.h
//  RealmTest
//
//  Created by DMU-24 on 26/02/15.
//  Copyright (c) 2015 DMU-24. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface AddPersonViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *inputTxtFields;
@property (weak, nonatomic) IBOutlet UITextField *nameTxtField;
@property (weak, nonatomic) IBOutlet UITextField *addressTxtField;
@property (weak, nonatomic) IBOutlet UITextField *bornTxtField;
@property (weak, nonatomic) IBOutlet UITextField *jobTxtField;


- (IBAction)SaveAndSubmit:(id)sender;
- (IBAction)ExportData:(id)sender;
@end
