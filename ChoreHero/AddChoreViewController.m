//
//  AddChoreViewController.m
//  ChoreHero
//
//  Created by DetroitLabs on 5/25/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "AddChoreViewController.h"
#import "ChoreItem.h"
@interface AddChoreViewController ()

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *choreDescription;
@property (weak, nonatomic) IBOutlet UITextField *estimatedTimeOfCompletion;
@property (weak, nonatomic) IBOutlet UIDatePicker *date;
@property (weak, nonatomic) IBOutlet UIPickerView *assignedTo;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveChore;


@end

@implementation AddChoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if(sender != self.saveChore){
        return;
    }
    self.choreItem = [[ChoreItem alloc] init];
    self.choreItem.name = self.name.text;
    self.choreItem.choreDescription = self.choreDescription.text;
    self.choreItem.status = @"Planned";
    self.choreItem.dueDate = self.date.date;
//    self.choreItem.assignedTo = self.assignedTo.;
    self.choreItem.estimatedTimeToComplete = [NSNumber numberWithInt:self.estimatedTimeOfCompletion.text];
    
    
}


@end
