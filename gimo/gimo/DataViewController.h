//
//  DataViewController.h
//  gimo
//
//  Created by 吳隆筠 on 3/13/17.
//  Copyright © 2017 Cyrus Goh. All rights reserved.
//

#import <UIKit/UIKit.h>

#define USER_EVENTS @"https://api.github.com/users/lovincyrus/events"
#define REPO_NAME @"repo.name"


@interface DataViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *dataLabel;

@end
