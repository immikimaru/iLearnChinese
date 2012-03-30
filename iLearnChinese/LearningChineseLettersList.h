//
//  lettersList.h
//  testgesture
//
//  Created by Fries on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LearningChineseLetter.h"

@interface LearningChineseLettersList : NSObject

@property (strong, nonatomic) NSMutableArray *LearningChineseLettersList;

-(void)addLetterWithName:(NSString *)inputLetter center:(CGPoint)inputCenter;
-(id)getLetter:(NSString *)buttonLetter;

@end
