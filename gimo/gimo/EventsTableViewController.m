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

    // get Github user's events
    [self loadEvents];

    // prompt summary using alert
    [self getSummary];

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

    // set cell bgColor
    if ( indexPath.row % 2 == 0 )
        // First Color
        cell.backgroundColor = [UIColor blackColor];
    else
        // Second Color
        cell.backgroundColor = [UIColor blackColor];

    // change cell textColor
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor whiteColor];

    // get events of "repo"
    NSDictionary* events = self.events[indexPath.row];
    cell.textLabel.text = [events valueForKeyPath:REPO_NAME];
    cell.detailTextLabel.text = [events valueForKeyPath:REPO_URL];
    return cell;
}


#pragma mark - Helpers
- (void)loadEvents {
    NSURL* url = [NSURL URLWithString:USER_EVENTS];

    // perform fetching events off the main queue
    dispatch_queue_t fetchQ = dispatch_queue_create("Load events", NULL);
    dispatch_async(fetchQ, ^{
        // GET JSON data from URL
        NSData* data = [NSData dataWithContentsOfURL:url];
        // Convert into Property list with objs and get NSDictionary
        NSDictionary* jsonData = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:0
                                                                   error:NULL];

        // search for objs name
        NSArray* events = [jsonData valueForKeyPath:@"repo"];

//        Uncomment to show the list of events
//        NSLog(@"%@",events);

        // update self.events in the main queue
        dispatch_async(dispatch_get_main_queue(), ^{
            self.events = events;
        });
    });
}

- (void)getSummary {

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
    alert.blurBackground = YES;
    alert.animateAlertInFromTop = YES;
    alert.animateAlertOutToBottom = YES;
    alert.dismissOnOutsideTouch = NO;
    alert.detachButtons = YES;
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
