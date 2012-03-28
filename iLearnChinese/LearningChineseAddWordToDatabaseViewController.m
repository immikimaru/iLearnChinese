//
//  LearningChineseAddWordToDatabaseViewController.m
//  iLearnChinese
//
//  Created by jean-laurent louis on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LearningChineseAddWordToDatabaseViewController.h"

@implementation LearningChineseAddWordToDatabaseViewController
@synthesize delegate = _delegate;


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (IBAction)save:(id)sender
{
    NSLog(@"[DEBUG %s] save button pressed", __func__);
    [self.delegate saveButtonWasTapped:self];
}
@end
