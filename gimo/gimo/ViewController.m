//
//  ViewController.m
//  gimo
//
//  Created by 吳隆筠 on 3/12/17.
//  Copyright © 2017 Cyrus Goh. All rights reserved.
//

#import "ViewController.h"
#import <ChameleonFramework/Chameleon.h>
#import <FlatUIKit/FlatUIKit.h>
//#import <FlatUIKit/UIColor+FlatUI.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet FUIButton *startBtn;


@end

@implementation ViewController

#pragma mark - ViewController Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor flatYellowColor];

    self.startBtn.buttonColor = [UIColor flatPlumColorDark];
    self.startBtn.shadowColor = [UIColor flatPlumColor];
    self.startBtn.shadowHeight = 3.0f;
    self.startBtn.cornerRadius = 8.0f;
    self.startBtn.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [self.startBtn setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.startBtn setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];



}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
