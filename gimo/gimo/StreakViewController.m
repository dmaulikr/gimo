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

@property (weak,nonatomic) IBOutlet KAProgressLabel * pLabel1; // commits progress
@property (weak,nonatomic) IBOutlet KAProgressLabel * pLabel2; // additions progress
@property (weak,nonatomic) IBOutlet KAProgressLabel * pLabel3; // deletions progress

@property (strong, nonatomic) IBOutlet UILabel *dateLabel;     // date

@property (nonatomic) float addNum;                            // additions #
@property (nonatomic) float delNum;                            // deletions #
@property (nonatomic) float comNum;                            // commits #

@end

@implementation StreakViewController


#pragma mark - ViewController Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];

    [self getStreaks];  // get github streak
    [self fetchStats];  // get # of additions, deletions, commits

    [self getProgress]; // display on the progress label

    // set background color
    self.view.backgroundColor = [UIColor blackColor];

    // retrieve NSUserDefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *savedValue = [defaults stringForKey:@"userProfile"];
    NSLog(@"userName: %@", savedValue);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self getDate];     // get current date

    //    [self selectAnimate:nil];
    self.pLabel1.progress = 0;
    self.pLabel2.progress = 0;
    self.pLabel3.progress = 0;


    // pass float num to the progress labels
    _addNum = 223123;
//    _delNum = 2;
//    _comNum = 3;
    NSLog(@"Right here! %f", _addNum);

    //    arc4random()
    // replace the score with real stats
    [self.pLabel1 setProgress:(20 % 100)*0.01 timing:TPPropertyAnimationTimingEaseInEaseOut duration:1 delay:.2];
    [self.pLabel2 setProgress:(40 % 100)*0.01 timing:TPPropertyAnimationTimingEaseInEaseOut duration:1 delay:.2];
    [self.pLabel3 setProgress:(80 % 100)*0.01 timing:TPPropertyAnimationTimingEaseInEaseOut duration:1 delay:.2];
}

#pragma mark - Helpers
- (void)getDate {
    NSLocale* currentLocale = [NSLocale currentLocale];
    [[NSDate date] descriptionWithLocale:currentLocale];
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd-yyyy HH:mm:ss"];
    self.dateLabel.text = [dateFormatter stringFromDate:[NSDate date]];
    self.dateLabel.textColor = [UIColor whiteColor];
}

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
    self.pLabel1.isStartDegreeUserInteractive = NO;
    self.pLabel1.isEndDegreeUserInteractive = NO; // user can't touch the progress

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
    self.pLabel2.isStartDegreeUserInteractive = NO;
    self.pLabel2.isEndDegreeUserInteractive = NO; // user can't touch the progress


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
    self.pLabel3.isStartDegreeUserInteractive = NO;
    self.pLabel3.isEndDegreeUserInteractive = NO; // user can't touch the progress

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
    self.label.textColor = [UIColor whiteColor]; // changed to white color for black bg
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

    self.statsLabel.text = [items componentsJoinedByString:@"\n"];
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
