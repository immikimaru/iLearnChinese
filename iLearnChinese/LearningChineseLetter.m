//
//  letter.m
//  testgesture
//
//  Created by Fries on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LearningChineseLetter.h"

@implementation LearningChineseLetter

@synthesize letter;
@synthesize initialCenter;

-(id)initWithName:(NSString *)inputLetter center:(CGPoint)inputInitialCenter
{
    self = [super init];
    if (self)
    {
        self.letter = inputLetter;
        self.initialCenter = inputInitialCenter;
        return self;
    }
    return nil;
}

@end
