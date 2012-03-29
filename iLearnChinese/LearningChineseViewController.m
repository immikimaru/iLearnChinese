//
//  LearningChineseViewController.m
//  iLearnChinese
//
//  Created by jean-laurent louis on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LearningChineseViewController.h"

@interface LearningChineseViewController ()

@end

@implementation LearningChineseViewController
@synthesize managedObjectContext = _managedObjectContext;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Setting up the databse
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PushDatabase"])
    {
        LearningChineseDatabaseViewController *words = segue.destinationViewController;
        words.managedObjectContext = self.managedObjectContext;
    }
    else if ([segue.identifier isEqualToString:@"PushGameOne"])
    {
        ;
    }
}
@end
