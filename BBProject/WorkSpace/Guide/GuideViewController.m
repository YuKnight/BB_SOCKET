//
//  GuideViewController.m
//  BBProject
//
//  Created by qthd on 16/1/18.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#import "GuideViewController.h"

@interface GuideViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *guideScrollView;   //scrollView
@property (strong, nonatomic) IBOutlet UIButton *nowExperienceButton; //马上体验按钮

- (void)loadScrollView;

@end

@implementation GuideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nowExperienceButtonClick:(UIButton *)sender
{
    
}

- (void)loadScrollView
{
    
}

@end
