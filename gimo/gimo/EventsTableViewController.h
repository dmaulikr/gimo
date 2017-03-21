//
//  EventsTableViewController.h
//  gimo
//
//  Created by 吳隆筠 on 3/18/17.
//  Copyright © 2017 Cyrus Goh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCAlertView.h"

#define USER_EVENTS @"https://api.github.com/users/lovincyrus/events"
#define REPO_ID @"repo.id"
#define REPO_URL @"repo.url"

@interface EventsTableViewController : UITableViewController

@property (retain, nonatomic) UIImage *alertImage;

@end
