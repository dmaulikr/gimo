//
//  StreakViewController.m
//  gimo
//
//  Created by 吳隆筠 on 3/17/17.
//  Copyright © 2017 Cyrus Goh. All rights reserved.
//

#import "StreakViewController.h"
#import <ChameleonFramework/Chameleon.h>
#import "KAProgressLabel.h"


@interface StreakViewController ()

@property (weak,nonatomic) IBOutlet KAProgressLabel * pLabel1;
@property (weak,nonatomic) IBOutlet KAProgressLabel * pLabel2;
@property (weak,nonatomic) IBOutlet KAProgressLabel * pLabel3;

@end

@implementation StreakViewController


#pragma mark - ViewController Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];

    [self getStreaks]; // get github streak
    [self fetchStats]; // get # of additions, deletions, commits
    [self getProgress]; // display on the progress label

    // set background color
//    self.view.backgroundColor = [UIColor flatYellowColor];
//    self.view.backgroundColor = [UIColor clearColor];

    // retrieve NSUserDefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *savedValue = [defaults stringForKey:@"userProfile"];
    NSLog(@"userName: %@", savedValue);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    //    [self selectAnimate:nil];
    self.pLabel1.progress = 0;
    self.pLabel2.progress = 0;
    self.pLabel3.progress = 0;

    //    arc4random()
    // replace the score with real stats
    [self.pLabel1 setProgress:(20 % 100)*0.01 timing:TPPropertyAnimationTimingEaseInEaseOut duration:1 delay:.2];
    [self.pLabel2 setProgress:(40 % 100)*0.01 timing:TPPropertyAnimationTimingEaseInEaseOut duration:1 delay:.2];
    [self.pLabel3 setProgress:(80 % 100)*0.01 timing:TPPropertyAnimationTimingEaseInEaseOut duration:1 delay:.2];
}


#pragma mark - Helpers
- (void)getProgress {
    self.pLabel1.backgroundColor = [UIColor clearColor];
    self.pLabel1.trackWidth = 22;
    self.pLabel1.progressWidth = 22;
    self.pLabel1.roundedCornersWidth = 22;
    self.pLabel1.trackColor = [[UIColor redColor] colorWithAlphaComponent:.2];
    self.pLabel1.progressColor = [UIColor redColor];
    self.pLabel1.labelVCBlock = ^(KAProgressLabel *label){
        self.pLabel1.startLabel.text = @"D";
        //    self.pLabel1.startLabel.text = [NSString stringWithFormat:@"%.f",self.pLabel1.progress*100];
    };
    self.pLabel1.isEndDegreeUserInteractive = YES;

    self.pLabel2.backgroundColor = [UIColor clearColor];
    self.pLabel2.trackWidth = 22;
    self.pLabel2.progressWidth = 22;
    self.pLabel2.roundedCornersWidth = 22;
    self.pLabel2.trackColor = [[UIColor greenColor] colorWithAlphaComponent:.2];
    self.pLabel2.progressColor = [UIColor greenColor];
    self.pLabel2.labelVCBlock = ^(KAProgressLabel *label){
        self.pLabel2.startLabel.text = @"A";
        //    self.pLabel2.startLabel.text = [NSString stringWithFormat:@"%.f",self.pLabel2.progress*100];
    };
    [self.pLabel2 setIsEndDegreeUserInteractive:YES];

    self.pLabel3.backgroundColor = [UIColor clearColor];
    self.pLabel3.trackWidth = 22;
    self.pLabel3.progressWidth = 22;
    self.pLabel3.roundedCornersWidth = 22;
    UIColor * col = [UIColor colorWithRed:0.02 green:0.73 blue:0.88 alpha:1];
    self.pLabel3.trackColor = [col colorWithAlphaComponent:.2];
    self.pLabel3.progressColor = col;
    self.pLabel3.labelVCBlock = ^(KAProgressLabel *label){
        self.pLabel3.startLabel.text = @"C";
        //    self.pLabel3.startLabel.text = [NSString stringWithFormat:@"%.f",self.pLabel3.progress*100];
    };
    self.pLabel3.isEndDegreeUserInteractive = YES;

}

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
