//
//  letter.h
//  testgesture
//
//  Created by Fries on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LearningChineseLetter : NSObject

@property (strong, nonatomic) NSString *letter;
@property (readwrite, nonatomic) CGPoint initialCenter;

-(id)initWithName:(NSString *)inputLetter center:(CGPoint)inputInitialCenter;

@end
