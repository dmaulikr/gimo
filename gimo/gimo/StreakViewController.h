//
//  StreakViewController.h
//  gimo
//
//  Created by 吳隆筠 on 3/17/17.
//  Copyright © 2017 Cyrus Goh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UICountingLabel/UICountingLabel.h>

#define USER_STATS @"https://api.github.com/repos/lovincyrus/gimo/stats/contributors"

@interface StreakViewController : UIViewController

@property (strong, nonatomic) IBOutlet UICountingLabel *label;
@property (strong, nonatomic) IBOutlet UILabel *statsLabel;

@end
