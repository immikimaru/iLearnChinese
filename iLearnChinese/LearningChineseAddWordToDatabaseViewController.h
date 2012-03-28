//
//  LearningChineseAddWordToDatabaseViewController.h
//  iLearnChinese
//
//  Created by jean-laurent louis on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LearningChineseAddWordToDatabaseViewController;

@protocol learningWordToDatabaseDelegate
- (void)saveButtonWasTapped:(LearningChineseAddWordToDatabaseViewController *)controller;
@end

@interface LearningChineseAddWordToDatabaseViewController : UITableViewController

@property (nonatomic, weak) id <learningWordToDatabaseDelegate>delegate;
- (IBAction)save:(id)sender;

@end
