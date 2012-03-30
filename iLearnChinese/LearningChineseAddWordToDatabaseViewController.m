//
//  LearningChineseAddWordToDatabaseViewController.m
//  iLearnChinese
//
//  Created by jean-laurent louis on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LearningChineseAddWordToDatabaseViewController.h"

@implementation LearningChineseAddWordToDatabaseViewController
@synthesize englishTextField = _englishTextField;
@synthesize pinyinTextField = _pinyinTextField;
@synthesize chineseTextField = _chineseTextField;
@synthesize delegate = _delegate;
@synthesize managedObjectContext = __managedObjectContext;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setEnglishTextField:nil];
    [self setPinyinTextField:nil];
    [self setChineseTextField:nil];
    [super viewDidUnload];
}

- (IBAction)save:(id)sender
{
    NSLog(@"[DEBUG %s] save button pressed", __func__);
    Word *word = [NSEntityDescription insertNewObjectForEntityForName:@"Word"
                                               inManagedObjectContext:self.managedObjectContext];

    //word.english = _englishTextField.text;
    //word.pinyin = _pinyinTextField.text;
    //word.chinese = _chineseTextField.text;
    
    [word setEnglish:_englishTextField.text];
    [word setPinyin:_pinyinTextField.text];
    [word setChinese:_chineseTextField.text];
    [word setAddByUser:[NSNumber numberWithBool:YES]];
    
    [self.managedObjectContext save:nil];  // write to database
    [self.delegate saveButtonWasTapped:self];
}
@end
