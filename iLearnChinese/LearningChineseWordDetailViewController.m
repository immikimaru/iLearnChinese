//
//  LearningChineseWordDetailViewController.m
//  iLearnChinese
//
//  Created by jean-laurent louis on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LearningChineseWordDetailViewController.h"

@implementation LearningChineseWordDetailViewController
@synthesize englishTextField = _englishTextField;
@synthesize pinyinTextField = _pinyinTextField;
@synthesize chineseTextField = _chineseTextField;
@synthesize delegate = _delegate;
@synthesize managedObjectContext = __managedObjectContext;
@synthesize word = _word;


- (void)viewDidLoad 
{
    self.englishTextField.text = self.word.english;
    self.pinyinTextField.text = self.word.pinyin;
    self.chineseTextField.text = self.word.chinese;
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
    [self.word setEnglish:self.englishTextField.text];
    [self.word setPinyin:self.pinyinTextField.text];
    [self.word setChinese:self.chineseTextField.text];
    [self.word setAddByUser:0];
    
    [self.managedObjectContext save:nil];  // write to database
    [self.delegate saveButtonWasTappedEdit:self];
}
@end
