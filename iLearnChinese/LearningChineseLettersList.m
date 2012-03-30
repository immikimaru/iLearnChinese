//
//  lettersList.m
//  testgesture
//
//  Created by Fries on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LearningChineseLettersList.h"
#import "LearningChineseLetter.h"

@implementation LearningChineseLettersList

@synthesize LearningChineseLettersList;

- (id)init
{
    if (self = [super init])
    {
        self.LearningChineseLettersList = [NSMutableArray arrayWithCapacity:4];
        return self;
    }
    return nil; 
}

-(void)addLetterWithName:(NSString *)inputLetter center:(CGPoint)inputCenter
{
    LearningChineseLetter *newLetter = [[LearningChineseLetter alloc] initWithName:inputLetter center:inputCenter];
    
    [[self LearningChineseLettersList] addObject:newLetter];
}

-(id)getLetter:(NSString *)buttonLetter
{
    for(LearningChineseLetter *currentLetter in self.LearningChineseLettersList)
    {
        if ([currentLetter.letter isEqualToString:buttonLetter])
            return currentLetter;
    }
     return nil;
}

@end
