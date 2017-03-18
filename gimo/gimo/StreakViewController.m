//
//  StreakViewController.m
//  gimo
//
//  Created by 吳隆筠 on 3/17/17.
//  Copyright © 2017 Cyrus Goh. All rights reserved.
//

#import "StreakViewController.h"


@interface StreakViewController ()

@end

@implementation StreakViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // count up using a string that uses a number formatter
//    UICountingLabel* scoreLabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(10, 90, 200, 40)];
    [self.view addSubview:self.label];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = kCFNumberFormatterDecimalStyle;
    self.label.formatBlock = ^NSString* (CGFloat value)
    {
        NSString* formatted = [formatter stringFromNumber:@((int)value)];
        return [NSString stringWithFormat:@"%@",formatted];
    };
    self.label.method = UILabelCountingMethodEaseOut;
    [self.label countFrom:0 to:10000 withDuration:2.5];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
