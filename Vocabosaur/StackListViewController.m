//
//  DetailViewController.m
//  Vocabosaur
//
//  Created by Pratik on 3-1-15.
//  Copyright (c) 2015 NimbleChapps. All rights reserved.
//

#import "StackListViewController.h"

@interface StackListViewController ()

@property NSMutableArray *objects;

@end

@implementation StackListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.objects = [NSMutableArray arrayWithArray:@[@"Stack 1", @"Stack 2", @"Stack 3", @"Stack 4", @"Stack 5", @"Stack 6", @"Stack 7", @"Stack 8", @"Stack 9", @"Stack 10"]];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
        StackListViewController *controller = (StackListViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellTypeStack" forIndexPath:indexPath];
    
    NSDate *object = self.objects[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}

@end
