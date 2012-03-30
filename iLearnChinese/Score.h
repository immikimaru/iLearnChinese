//
//  Score.h
//  iLearnChinese
//
//  Created by jean-laurent louis on 3/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Score : NSManagedObject

@property (nonatomic, retain) NSNumber * score;
@property (nonatomic, retain) NSNumber * game;
@property (nonatomic, retain) NSString * user;
@property (nonatomic, retain) NSNumber * accuracy;
@property (nonatomic, retain) NSNumber * askedQuestion;
@property (nonatomic, retain) NSNumber * answeredQuestion;
@property (nonatomic, retain) NSDate * date;

@end
