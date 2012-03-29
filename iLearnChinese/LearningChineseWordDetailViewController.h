//
//  LearningChineseWordDetailViewController.h
//  iLearnChinese
//
//  Created by jean-laurent louis on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Word.h"

@class LearningChineseWordDetailViewController;

@protocol wordDetailDelegate
- (void)saveButtonWasTappedEdit:(LearningChineseWordDetailViewController *)controller;
@end

@interface LearningChineseWordDetailViewController : UITableViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, weak) id <wordDetailDelegate>delegate;
- (IBAction)save:(id)sender;

@property (strong, nonatomic)Word *word;
@property (weak, nonatomic) IBOutlet UITextField *englishTextField;
@property (weak, nonatomic) IBOutlet UITextField *pinyinTextField;
@property (weak, nonatomic) IBOutlet UITextField *chineseTextField;

@end
