//
//  LearningChineseGameThreeViewController.h
//  iLearnChinese
//
//  Created by jean-laurent louis on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LearningChineseLettersList.h"
#import "LearningChineseLetter.h"

@interface LearningChineseGameThreeViewController : UIViewController
{
    NSInteger nbQuestions;
    NSInteger goodAnswer;
    NSInteger time;
    NSInteger restTime;
    BOOL isResting;
    NSTimer *timer;
    
    NSInteger indexQuestion;
    
    NSArray *myDB;
    NSInteger countDB;
}

@property (strong, nonatomic) LearningChineseLettersList *dataController;

// use for the DB
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

extern NSUInteger const WIDTH_LETTER;
extern NSUInteger const WIDTH_BUTTON;

extern NSUInteger const TOP_LINE_TWO;
extern NSUInteger const TOP_LINE_THREE;

@property (weak, nonatomic) IBOutlet UIButton *buttonA;
@property (weak, nonatomic) IBOutlet UIButton *buttonE;
@property (weak, nonatomic) IBOutlet UIButton *buttonI;
@property (weak, nonatomic) IBOutlet UIButton *buttonO;
@property (weak, nonatomic) IBOutlet UIButton *buttonU;
@property (weak, nonatomic) IBOutlet UIButton *buttonU2;
@property (weak, nonatomic) IBOutlet UIButton *buttonY;
@property (weak, nonatomic) IBOutlet UIButton *buttonB;
@property (weak, nonatomic) IBOutlet UIButton *buttonC;
@property (weak, nonatomic) IBOutlet UIButton *buttonD;
@property (weak, nonatomic) IBOutlet UIButton *buttonF;
@property (weak, nonatomic) IBOutlet UIButton *buttonG;
@property (weak, nonatomic) IBOutlet UIButton *buttonH;
@property (weak, nonatomic) IBOutlet UIButton *buttonJ;
@property (weak, nonatomic) IBOutlet UIButton *buttonK;
@property (weak, nonatomic) IBOutlet UIButton *buttonL;
@property (weak, nonatomic) IBOutlet UIButton *buttonM;
@property (weak, nonatomic) IBOutlet UIButton *buttonN;
@property (weak, nonatomic) IBOutlet UIButton *buttonP;
@property (weak, nonatomic) IBOutlet UIButton *buttonQ;
@property (weak, nonatomic) IBOutlet UIButton *buttonR;
@property (weak, nonatomic) IBOutlet UIButton *buttonS;
@property (weak, nonatomic) IBOutlet UIButton *buttonT;
@property (weak, nonatomic) IBOutlet UIButton *buttonV;
@property (weak, nonatomic) IBOutlet UIButton *buttonW;
@property (weak, nonatomic) IBOutlet UIButton *buttonX;
@property (weak, nonatomic) IBOutlet UIButton *buttonZ;

@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;
@property (weak, nonatomic) IBOutlet UIButton *button11;
@property (weak, nonatomic) IBOutlet UIButton *button12;
@property (weak, nonatomic) IBOutlet UIButton *button13;
@property (weak, nonatomic) IBOutlet UIButton *button14;
@property (weak, nonatomic) IBOutlet UIButton *button15;
@property (weak, nonatomic) IBOutlet UIButton *button16;
@property (weak, nonatomic) IBOutlet UIButton *button21;
@property (weak, nonatomic) IBOutlet UIButton *button22;
@property (weak, nonatomic) IBOutlet UIButton *button23;
@property (weak, nonatomic) IBOutlet UIButton *button24;
@property (weak, nonatomic) IBOutlet UIButton *button25;
@property (weak, nonatomic) IBOutlet UIButton *button26;

@property (weak, nonatomic) IBOutlet UIButton *p1;
@property (weak, nonatomic) IBOutlet UIButton *p2;
@property (weak, nonatomic) IBOutlet UIButton *p3;
@property (weak, nonatomic) IBOutlet UIButton *p4;


@property (weak, nonatomic) IBOutlet UILabel *chineseCharacter;
@property (weak, nonatomic) IBOutlet UILabel *gamePoints;
@property (weak, nonatomic) IBOutlet UILabel *gameTime;

@property (strong, nonatomic) NSArray *tablePronunciation;
@property (readwrite, nonatomic) BOOL partTwoEnable;
@property (readwrite, nonatomic) BOOL partThreeEnable;
@property (readwrite, nonatomic) NSUInteger score;
@property (weak, nonatomic) IBOutlet UILabel *displayZone;

- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer;
- (IBAction)resetSelectedChoice:(id)sender;
- (IBAction)checkAnswer:(id)sender;
- (IBAction)skipAnswer:(id)sender;

@end
