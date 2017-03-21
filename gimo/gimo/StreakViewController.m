//
//  StreakViewController.m
//  gimo
//
//  Created by 吳隆筠 on 3/17/17.
//  Copyright © 2017 Cyrus Goh. All rights reserved.
//

#import "StreakViewController.h"
#import <ChameleonFramework/Chameleon.h>


@interface StreakViewController ()

@end

@implementation StreakViewController


#pragma mark - ViewController Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];

    [self getStreaks];
    [self fetchStats];

    // set background color
    self.view.backgroundColor = [UIColor flatYellowColor];
//    self.view.backgroundColor = [UIColor clearColor];

    // retrieve NSUserDefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *savedValue = [defaults stringForKey:@"userProfile"];
    NSLog(@"userName: %@", savedValue);
}


#pragma mark - Helpers
- (void)getStreaks {
    // count up using a string that uses a number formatter
    [self.view addSubview:self.label];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = kCFNumberFormatterDecimalStyle;
    self.label.formatBlock = ^NSString* (CGFloat value) {
        NSString* formatted = [formatter stringFromNumber:@((int)value)];
        return [NSString stringWithFormat:@"%@",formatted];
    };
    self.label.method = UILabelCountingMethodEaseOut;
    [self.label countFrom:0 to:10000 withDuration:2.5];
}

- (void)fetchStats {
    NSURL* url = [NSURL URLWithString:USER_STATS];
    NSData* data = [NSData dataWithContentsOfURL:url];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                         options:0
                                                           error:NULL];

    // show json
//    NSLog(@"json: %@", json);

    // nested objects
    NSArray *items = [json valueForKeyPath:@"weeks"];
    NSArray *week = [json valueForKeyPath:@"weeks.w"];
    NSArray *addition = [json valueForKeyPath:@"weeks.a"];
    NSArray *deletion = [json valueForKeyPath:@"weeks.d"];
    NSArray *commit = [json valueForKeyPath:@"weeks.c"];

    // test nested obj
    NSLog(@"%@", items);
    NSLog(@"Start of the week: %@", week);
    NSLog(@"Number of additions: %@", addition);
    NSLog(@"Number of deletions: %@", deletion);
    NSLog(@"Number of commits: %@", commit);

//    NSArray *stats = @[week, addition, deletion, commit];


    self.statsLabel.text = [items componentsJoinedByString:@"\n"];
//    self.statsLabel.text = [stats componentsJoinedByString:@"\n"];
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
