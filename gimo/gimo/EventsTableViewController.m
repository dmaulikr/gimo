//
//  EventsTableViewController.m
//  gimo
//
//  Created by 吳隆筠 on 3/18/17.
//  Copyright © 2017 Cyrus Goh. All rights reserved.
//

#import "EventsTableViewController.h"
#import <ChameleonFramework/Chameleon.h>

@interface EventsTableViewController ()

@property (strong, nonatomic) NSArray* events;

@end

@implementation EventsTableViewController


#pragma mark - ViewController Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadEvents];

    // init FCAlertView
    FCAlertView *alert = [[FCAlertView alloc] init];

    // basic allert
    [alert showAlertWithTitle:@"Summary"
                 withSubtitle:@"You didn't push any code yesterday! 💀"
              withCustomImage:[UIImage imageNamed:@"github-icon.png"]
          withDoneButtonTitle:nil
                   andButtons:nil];

    // more customizations
    alert.colorScheme = alert.flatMidnight;
    alert.bounceAnimations = YES;
    alert.animateAlertInFromTop = YES;
    alert.animateAlertOutToBottom = YES;
    alert.dismissOnOutsideTouch = NO;
    alert.detachButtons = YES;

//     Uncomment the following line to preserve selection between presentations.
//     self.clearsSelectionOnViewWillAppear = NO;

//     Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)setEvents:(NSArray *)events{
    _events = events;

    // Once all events' JSON are downloaded, let's refresh the tableview
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows
    return [self.events count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"eventsList" forIndexPath:indexPath];

    // change cell bg color
    if ( indexPath.row % 2 == 0 )
        cell.backgroundColor = [UIColor clearColor];
    else
        cell.backgroundColor = [UIColor clearColor];

    NSDictionary* events = self.events[indexPath.row];
    NSLog(@"%@",events);

    // *** DEBUG THIS SHIT ***

//    cell.textLabel.text = [events valueForKeyPath:REPO_ID];
//    cell.detailTextLabel.text = [events valueForKeyPath:REPO_URL];

    cell.textLabel.text = @"repo.id";
    cell.detailTextLabel.text = @"repo.url";
//    NSLog(@"textLabel");

    return cell;
}

#pragma mark - Helpers
- (void)loadEvents {
    NSURL* url = [NSURL URLWithString:@"https://api.github.com/users/lovincyrus/events"];

    dispatch_queue_t fetchQ = dispatch_queue_create("Load events", NULL);
    dispatch_async(fetchQ, ^{
        NSData* data = [NSData dataWithContentsOfURL:url];
        NSDictionary* jsonData = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:0
                                                                   error:NULL];
        NSArray* events = [jsonData valueForKeyPath:@"repo.name"];
        NSArray* events1 = [jsonData valueForKeyPath:@"repo.id"];
        NSArray* events2 = [jsonData valueForKeyPath:@"repo.url"];

        //        NSLog(@"%@",events);
        NSLog(@"%@",events1);
        NSLog(@"%@",events2);

        dispatch_async(dispatch_get_main_queue(), ^{
            self.events = events;
            //            NSLog(@"self.events");
        });
    });
}






/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
