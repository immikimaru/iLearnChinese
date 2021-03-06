//
//  LearningChineseAddWordToDatabaseViewController.h
//  iLearnChinese
//
//  Created by jean-laurent louis on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Word.h"

@class LearningChineseAddWordToDatabaseViewController;

@protocol learningWordToDatabaseDelegate
- (void)saveButtonWasTapped:(LearningChineseAddWordToDatabaseViewController *)controller;
@end

@interface LearningChineseAddWordToDatabaseViewController : UITableViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, weak) id <learningWordToDatabaseDelegate>delegate;
- (IBAction)save:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *englishTextField;
@property (weak, nonatomic) IBOutlet UITextField *pinyinTextField;
@property (weak, nonatomic) IBOutlet UITextField *chineseTextField;

@end
