//
//  ChoreListTableViewController.m
//  ChoreHero
//
//  Created by DetroitLabs on 5/25/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "ChoreListTableViewController.h"
#import "ChoreItem.h"
#import "AddChoreViewController.h"
@interface ChoreListTableViewController ()

@property NSMutableArray *choreArray;

@end

@implementation ChoreListTableViewController

-(void)loadChores
{
    ChoreItem *chore1 = [[ChoreItem alloc] init];
    ChoreItem *chore2 = [[ChoreItem alloc] init];
    ChoreItem *chore3 = [[ChoreItem alloc] init];
    
    chore1.name = @"walk dog";
    chore1.choreDescription = @"";
    chore1.status = @"";
    chore1.dueDate = [[NSDate alloc] init];
    chore1.assignedTo = @"";
    chore1.estimatedTimeToComplete = @0;
    
    chore2.name = @"due dishes";
    chore2.choreDescription = @"";
    chore2.status = @"";
    chore2.dueDate = [[NSDate alloc] init];
    chore2.assignedTo = @"";
    chore2.estimatedTimeToComplete = @0;
    
    chore3.name = @"clean room";
    chore3.choreDescription = @"";
    chore3.status = @"";
    chore3.dueDate = [[NSDate alloc] init];
    chore3.assignedTo = @"";
    chore3.estimatedTimeToComplete = @0;
    
    [self.choreArray addObject:chore1];
    [self.choreArray addObject:chore2];
    [self.choreArray addObject:chore3];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.choreArray = [[NSMutableArray alloc] init];
	
	NSArray * storedChoreArray = [self loadStoredChores];
	if([storedChoreArray count] > 0) {
		self.choreArray = [storedChoreArray mutableCopy];
	}
	else {
		[self loadChores];
	}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.choreArray count];
}

-(IBAction)unwindToList:(UIStoryboardSegue *) segue
{
    AddChoreViewController *source = [segue sourceViewController];
    ChoreItem *item = source.choreItem;
    [self.choreArray addObject:item];
    [self.tableView reloadData];
	
	[self saveChores];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listPrototypeCell" forIndexPath:indexPath];
    
    ChoreItem *choreItem = [self.choreArray objectAtIndex:indexPath.row];

    cell.textLabel.text = choreItem.name;
    
    
    return cell;
}

-(void)saveChores {
	BOOL isSuccessfulSave = [NSKeyedArchiver archiveRootObject:_choreArray toFile:[ChoreItem getArchiveURL]];
	
	if(isSuccessfulSave == NO) {
		NSLog(@"failed to save chores.");
	}
}

-(NSArray *)loadStoredChores {
	return [NSKeyedUnarchiver unarchiveObjectWithFile:[ChoreItem getArchiveURL]];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
