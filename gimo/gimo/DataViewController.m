//
//  DataViewController.m
//  gimo
//
//  Created by 吳隆筠 on 3/13/17.
//  Copyright © 2017 Cyrus Goh. All rights reserved.
//

#import "DataViewController.h"

@interface DataViewController ()


@end

@implementation DataViewController

#pragma mark - ViewController Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];

    [self fetchData];
}


#pragma mark - Helpers
- (void)fetchData {
    NSURL* url = [NSURL URLWithString:USER_EVENTS];

    NSData* data = [NSData dataWithContentsOfURL:url];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                         options:0
                                                           error:NULL];

    // show json
    NSLog(@"json: %@", json);

    // nested objects
    NSArray *items = [json valueForKeyPath:REPO_NAME];
    self.dataLabel.text = [items componentsJoinedByString:@"\n"];

    // test nested obj
//    NSLog(@"%@", items);

    // json
//    self.dataLabel.text = [json objectForKey:@"bio"];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
