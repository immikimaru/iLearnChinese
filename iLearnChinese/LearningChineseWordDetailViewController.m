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
@synthesize saveButton = _saveButton;
@synthesize word = _word;


- (void)viewDidLoad 
{
    if (![self.word.addByUser boolValue])
    {
        NSLog(@"added by user %@", self.word.addByUser);
        [self.englishTextField setUserInteractionEnabled:NO];
        [self.pinyinTextField setUserInteractionEnabled:NO];
        [self.chineseTextField setUserInteractionEnabled:NO];
        [self.saveButton setEnabled:NO];
        self.title = self.word.chinese;
        //[self.view setBackgroundColor:[UIColor darkGrayColor]];
    }
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
    [self setSaveButton:nil];
    [super viewDidUnload];
}

- (IBAction)save:(id)sender
{
    [self.word setEnglish:self.englishTextField.text];
    [self.word setPinyin:self.pinyinTextField.text];
    [self.word setChinese:self.chineseTextField.text];
    [self.word setAddByUser:[NSNumber numberWithBool:YES]];
    
    [self.managedObjectContext save:nil];  // write to database
    [self.delegate saveButtonWasTappedEdit:self];
}
@end
