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

@interface ViewController ()

@property (weak, nonatomic) IBOutlet FUIButton *startBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor flatYellowColor];
    NSLog(@"--- self.view.backgroundColor shows! ---");


    self.startBtn.buttonColor = [UIColor flatBlackColorDark];
    NSLog(@"--- self.startBtn.buttonColor shows! ---");

    self.startBtn.shadowColor = [UIColor flatPlumColor];
    self.startBtn.shadowHeight = 3.0f;
    self.startBtn.cornerRadius = 6.0f;
    self.startBtn.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [self.startBtn setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.startBtn setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
