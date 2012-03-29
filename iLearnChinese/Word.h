//
//  Word.h
//  iLearnChinese
//
//  Created by jean-laurent louis on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Word : NSManagedObject

@property (nonatomic, retain) NSString * english;
@property (nonatomic, retain) NSString * chinese;
@property (nonatomic, retain) NSString * pinyin;
@property (nonatomic, retain) NSNumber * addByUser;

@end
