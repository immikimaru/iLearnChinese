//
//  LearningChineseViewController.h
//  iLearnChinese
//
//  Created by jean-laurent louis on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "LearningChineseDatabaseViewController.h"


@interface LearningChineseViewController : UIViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end