//
//  LearningChineseDatabaseViewController.h
//  iLearnChinese
//
//  Created by jean-laurent louis on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LearningChineseAddWordToDatabaseViewController.h"
#import "CoreDataTableViewController.h"
#import "LearningChineseWordDetailViewController.h"
#import "Word.h"

@interface LearningChineseDatabaseViewController : CoreDataTableViewController 
<learningWordToDatabaseDelegate, wordDetailDelegate>


@property (weak, nonatomic) IBOutlet UILabel *chineseLabel;


@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) Word *selectedWord;

@property (nonatomic, weak) id <learningWordToDatabaseDelegate> delegate;
/*
@property (weak, nonatomic) IBOutlet UILabel *chineseLabel;
@property (weak, nonatomic) IBOutlet UILabel *englishLabel;
@property (weak, nonatomic) IBOutlet UILabel *pinyinLabel;
*/
@end
