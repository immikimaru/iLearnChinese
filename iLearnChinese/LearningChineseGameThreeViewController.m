//
//  LearningChineseGameThreeViewController.m
//  iLearnChinese
//
//  Created by jean-laurent louis on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "LearningChineseGameThreeViewController.h"
#import "LearningChineseLettersList.h"
#import "LearningChineseLetter.h"
#import "Word.h"

@interface LearningChineseGameThreeViewController ()

@end

@implementation LearningChineseGameThreeViewController

NSUInteger const WIDTH_LETTER = 30;
NSUInteger const WIDTH_BUTTON = 32;
NSUInteger const TOP_LINE_TWO = 198;
NSUInteger const TOP_LINE_THREE = 238;

@synthesize dataController = _dataController;
@synthesize buttonA;
@synthesize buttonE;
@synthesize buttonI;
@synthesize buttonO;
@synthesize buttonU;
@synthesize buttonU2;
@synthesize buttonY;
@synthesize buttonB;
@synthesize buttonC;
@synthesize buttonD;
@synthesize buttonF;
@synthesize buttonG;
@synthesize buttonH;
@synthesize buttonJ;
@synthesize buttonK;
@synthesize buttonL;
@synthesize buttonM;
@synthesize buttonN;
@synthesize buttonP;
@synthesize buttonQ;
@synthesize buttonR;
@synthesize buttonS;
@synthesize buttonT;
@synthesize buttonV;
@synthesize buttonW;
@synthesize buttonX;
@synthesize buttonZ;
@synthesize button1;
@synthesize button2;
@synthesize button3;
@synthesize button4;
@synthesize button5;
@synthesize button6;
@synthesize button11;
@synthesize button12;
@synthesize button13;
@synthesize button14;
@synthesize button15;
@synthesize button16;
@synthesize button21;
@synthesize button22;
@synthesize button23;
@synthesize button24;
@synthesize button25;
@synthesize button26;
@synthesize p1;
@synthesize p2;
@synthesize p3;
@synthesize p4;
@synthesize chineseCharacter;
@synthesize gamePoints;
@synthesize gameTime;
@synthesize tablePronunciation;
@synthesize partTwoEnable;
@synthesize partThreeEnable;
@synthesize score;
@synthesize displayZone;
@synthesize managedObjectContext = _managedObjectContext;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.dataController = [[LearningChineseLettersList alloc] init]; 
     [[self view] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background_game3.png"]]];
    // Initialization buttonMovableTable
    [self.dataController addLetterWithName:buttonA.titleLabel.text center:buttonA.center];
    [self.dataController addLetterWithName:buttonE.titleLabel.text center:buttonE.center];
    [self.dataController addLetterWithName:buttonI.titleLabel.text center:buttonI.center];
    [self.dataController addLetterWithName:buttonO.titleLabel.text center:buttonO.center];
    [self.dataController addLetterWithName:buttonU.titleLabel.text center:buttonU.center];
    [self.dataController addLetterWithName:buttonU2.titleLabel.text center:buttonU2.center];
    
    [self.dataController addLetterWithName:buttonB.titleLabel.text center:buttonB.center];
    [self.dataController addLetterWithName:buttonC.titleLabel.text center:buttonC.center];
    [self.dataController addLetterWithName:buttonD.titleLabel.text center:buttonD.center];
    [self.dataController addLetterWithName:buttonF.titleLabel.text center:buttonF.center];
    [self.dataController addLetterWithName:buttonG.titleLabel.text center:buttonG.center];
    [self.dataController addLetterWithName:buttonH.titleLabel.text center:buttonH.center];
    [self.dataController addLetterWithName:buttonJ.titleLabel.text center:buttonJ.center];
    [self.dataController addLetterWithName:buttonK.titleLabel.text center:buttonK.center];
    [self.dataController addLetterWithName:buttonL.titleLabel.text center:buttonL.center];
    [self.dataController addLetterWithName:buttonM.titleLabel.text center:buttonM.center];
    [self.dataController addLetterWithName:buttonN.titleLabel.text center:buttonN.center];
    [self.dataController addLetterWithName:buttonP.titleLabel.text center:buttonP.center];
    [self.dataController addLetterWithName:buttonQ.titleLabel.text center:buttonQ.center];
    [self.dataController addLetterWithName:buttonR.titleLabel.text center:buttonR.center];
    [self.dataController addLetterWithName:buttonS.titleLabel.text center:buttonS.center];
    [self.dataController addLetterWithName:buttonT.titleLabel.text center:buttonT.center];
    [self.dataController addLetterWithName:buttonV.titleLabel.text center:buttonV.center];
    [self.dataController addLetterWithName:buttonW.titleLabel.text center:buttonW.center];
    [self.dataController addLetterWithName:buttonX.titleLabel.text center:buttonX.center];
    [self.dataController addLetterWithName:buttonY.titleLabel.text center:buttonY.center];
    [self.dataController addLetterWithName:buttonZ.titleLabel.text center:buttonZ.center];
    
    // Pronunciation buttons
    [self.dataController addLetterWithName:p1.titleLabel.text center:p1.center];
    [self.dataController addLetterWithName:p2.titleLabel.text center:p2.center];
    [self.dataController addLetterWithName:p3.titleLabel.text center:p3.center];
    [self.dataController addLetterWithName:p4.titleLabel.text center:p4.center];
    
    
    // Initialization pronunciation table
    NSArray *a = [NSArray arrayWithObjects :@"ā",@"á",@"ǎ",@"à", nil];
    NSArray *e = [NSArray arrayWithObjects :@"ē",@"é",@"ě",@"è", nil];
    NSArray *i = [NSArray arrayWithObjects :@"ī",@"í",@"ǐ",@"ì", nil];
    NSArray *o = [NSArray arrayWithObjects :@"ō",@"ó",@"ǒ",@"ò", nil];
    NSArray *u = [NSArray arrayWithObjects :@"ū",@"ú",@"ǔ",@"ù", nil];
    NSArray *u2 = [NSArray arrayWithObjects :@"ǖ",@"ǘ",@"ǚ",@"ǜ", nil];
    NSArray *tmpTablePronunciation = [NSArray arrayWithObjects:a, e, i, o, u, u2, nil];
    
    tablePronunciation = tmpTablePronunciation;
    
    //Load data
    [self loadDB];
    
    // Init buttons
    //    [self prepareForNextQuestion:1];
    [self resetGame];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setButtonA:nil];
    [self setButtonE:nil];
    [self setButtonI:nil];
    [self setButtonO:nil];
    [self setButtonU:nil];
    [self setButtonU2:nil];
    [self setButtonY:nil];
    [self setButtonB:nil];
    [self setButtonC:nil];
    [self setButtonD:nil];
    [self setButtonF:nil];
    [self setButtonG:nil];
    [self setButtonH:nil];
    [self setButtonJ:nil];
    [self setButtonK:nil];
    [self setButtonL:nil];
    [self setButtonM:nil];
    [self setButtonN:nil];
    [self setButtonP:nil];
    [self setButtonQ:nil];
    [self setButtonR:nil];
    [self setButtonS:nil];
    [self setButtonT:nil];
    [self setButtonV:nil];
    [self setButtonW:nil];
    [self setButtonX:nil];
    [self setButtonZ:nil];
    [self setButton1:nil];
    [self setButton2:nil];
    [self setButton3:nil];
    [self setButton4:nil];
    [self setButton5:nil];
    [self setButton6:nil];
    [self setButton11:nil];
    [self setButton12:nil];
    [self setButton13:nil];
    [self setButton14:nil];
    [self setButton15:nil];
    [self setButton16:nil];
    [self setButton21:nil];
    [self setButton22:nil];
    [self setButton23:nil];
    [self setButton24:nil];
    [self setButton25:nil];
    [self setButton26:nil];
    [self setChineseCharacter:nil];
    [self setP1:nil];
    [self setP2:nil];
    [self setP3:nil];
    [self setP4:nil];
    [self setGamePoints:nil];
    [self setGameTime:nil];
    [self setDisplayZone:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (interfaceOrientation != UIInterfaceOrientationLandscapeLeft && interfaceOrientation != UIInterfaceOrientationLandscapeRight)
        return YES;
    return NO;
}

- (BOOL)doesTheCoordinatesMatches:(CGPoint)buttonCenter letterCenter:(CGPoint)letterCenter leftButton:(CGPoint)leftButtonCenter
{
    float xMinB = buttonCenter.x - (WIDTH_BUTTON / 2);
    float xMaxB = buttonCenter.x + (WIDTH_BUTTON / 2);
    float yMinB = buttonCenter.y - (WIDTH_BUTTON / 2);
    float yMaxB = buttonCenter.y + (WIDTH_BUTTON / 2);
    
    float xMinL = letterCenter.x - (WIDTH_LETTER / 2);
    float xMaxL = letterCenter.x + (WIDTH_LETTER / 2);
    float yMinL = letterCenter.y - (WIDTH_LETTER / 2);
    float yMaxL = letterCenter.y + (WIDTH_LETTER / 2);
    
    float otherButtonArea = 0;
    float width = 0;
    float height = 0;
    float currentButtonArea = 0;
    if (leftButtonCenter.x != 0 && leftButtonCenter.y != 0)
    {
        float xMinO = leftButtonCenter.x - (WIDTH_BUTTON / 2);
        float xMaxO = leftButtonCenter.x + (WIDTH_BUTTON / 2);
        float yMinO = leftButtonCenter.y - (WIDTH_BUTTON / 2);
        float yMaxO = leftButtonCenter.y + (WIDTH_BUTTON / 2);
        if ((xMaxO > xMinL && xMinO < xMinL) && (yMaxO > yMaxL && yMinO < yMaxL))
        {
            width = xMaxO - xMinL;
            height = yMaxL - yMinO;
            otherButtonArea = width * height;
        }
        else if ((xMaxO > xMinL && xMinO < xMinL) && (yMaxO > yMinL && yMinO < yMinL))
        {
            width = xMaxO - xMinL;
            height = yMaxO - yMinL;
            otherButtonArea = width * height;
        }
    }
    
    if ((xMaxB > xMinL && xMinB < xMinL) && (yMaxB > yMinL && yMinB < yMinL))
        return YES;
    else if ((xMaxB > xMinL && xMinB < xMinL) && (yMaxB > yMaxL && yMinB < yMaxL))
        return YES;
    else if ((xMaxB > xMaxL && xMinB < xMaxL) && (yMaxB > yMaxL && yMinB < yMaxL))
    {
        if (otherButtonArea != 0)
        {
            width = xMaxL - xMinB;
            height = yMaxL - yMinB;
            currentButtonArea = width * height;
            
            if (currentButtonArea < otherButtonArea)
                return NO;
        }
        return YES;
    }
    else if ((xMaxB > xMaxL && xMinB < xMaxL) && (yMaxB > yMinL && yMinB < yMinL))
    {
        if (otherButtonArea != 0)
        {
            width = xMaxL - xMinB;
            height = yMaxB - yMinL;
            currentButtonArea = width * height;
            
            if (currentButtonArea < otherButtonArea)
                return NO;
        }
        return YES;
    }
    return NO;
}

-(UIButton *)getTargetedButton:(CGPoint)center
{
    if (center.y < TOP_LINE_TWO)
    {
        CGPoint leftButtonCenter = button5.center;
        if (![button6 isHidden])
        {
            leftButtonCenter = button5.center;
            if ([self doesTheCoordinatesMatches:button6.center letterCenter:center leftButton:leftButtonCenter])
                return button6;
        }
        if (![button5 isHidden])
        {
            leftButtonCenter = button4.center;
            if ([self doesTheCoordinatesMatches:button5.center letterCenter:center leftButton:leftButtonCenter])
                return button5;
        }
        if (![button4 isHidden])
        {
            leftButtonCenter = button3.center;
            if ([self doesTheCoordinatesMatches:button4.center letterCenter:center leftButton:leftButtonCenter])
                return button4;
        }
        if (![button3 isHidden])
        {
            leftButtonCenter = button2.center;
            if ([self doesTheCoordinatesMatches:button3.center letterCenter:center leftButton:leftButtonCenter])
                return button3;
        }
        if (![button2 isHidden])
        {
            leftButtonCenter = button1.center;
            if ([self doesTheCoordinatesMatches:button2.center letterCenter:center leftButton:leftButtonCenter])
                return button2;
        }
        if (![button1 isHidden])
        {
            leftButtonCenter = CGPointMake(0, 0);
            if ([self doesTheCoordinatesMatches:button1.center letterCenter:center leftButton:leftButtonCenter])
                return button1;
        }
    }
    else if (center.y < TOP_LINE_THREE && partTwoEnable == YES)
    {
        CGPoint leftButtonCenter = button15.center;
        if (![button16 isHidden])
        {
            leftButtonCenter = button15.center;
            if ([self doesTheCoordinatesMatches:button16.center letterCenter:center leftButton:leftButtonCenter])
                return button16;
        }
        if (![button15 isHidden])
        {
            leftButtonCenter = button14.center;
            if ([self doesTheCoordinatesMatches:button15.center letterCenter:center leftButton:leftButtonCenter])
                return button15;
        }
        if (![button14 isHidden])
        {
            leftButtonCenter = button13.center;
            if ([self doesTheCoordinatesMatches:button14.center letterCenter:center leftButton:leftButtonCenter])
                return button14;
        }
        if (![button13 isHidden])
        {
            leftButtonCenter = button12.center;
            if ([self doesTheCoordinatesMatches:button13.center letterCenter:center leftButton:leftButtonCenter])
                return button13;
        }
        if (![button12 isHidden])
        {
            leftButtonCenter = button11.center;
            if ([self doesTheCoordinatesMatches:button12.center letterCenter:center leftButton:leftButtonCenter])
                return button12;
        }
        if (![button11 isHidden])
        {
            leftButtonCenter = CGPointMake(0, 0);
            if ([self doesTheCoordinatesMatches:button11.center letterCenter:center leftButton:leftButtonCenter])
                return button11;
        }
    }
    else if (partThreeEnable == YES)
    {
        CGPoint leftButtonCenter = button25.center;
        if (![button26 isHidden])
        {
            leftButtonCenter = button25.center;
            if ([self doesTheCoordinatesMatches:button26.center letterCenter:center leftButton:leftButtonCenter])
                return button26;
        }
        if (![button25 isHidden])
        {
            leftButtonCenter = button24.center;
            if ([self doesTheCoordinatesMatches:button25.center letterCenter:center leftButton:leftButtonCenter])
                return button25;
        }
        if (![button24 isHidden])
        {
            leftButtonCenter = button23.center;
            if ([self doesTheCoordinatesMatches:button24.center letterCenter:center leftButton:leftButtonCenter])
                return button24;
        }
        if (![button23 isHidden])
        {
            leftButtonCenter = button22.center;
            if ([self doesTheCoordinatesMatches:button23.center letterCenter:center leftButton:leftButtonCenter])
                return button23;
        }
        if (![button22 isHidden])
        {
            leftButtonCenter = button21.center;
            if ([self doesTheCoordinatesMatches:button22.center letterCenter:center leftButton:leftButtonCenter])
                return button22;
        }
        if (![button21 isHidden])
        {
            leftButtonCenter = CGPointMake(0, 0);
            if ([self doesTheCoordinatesMatches:button21.center letterCenter:center leftButton:leftButtonCenter])
                return button21;
        }
    }
    return nil;
}

- (void)assignValue:(UIButton *)currentButton value:(NSString *)value
{
    if (currentButton == nil)
        return ;
    else if (currentButton == button1)
        [self.button2 setHidden:NO];
    else if (currentButton == button2)
        [self.button3 setHidden:NO];
    else if (currentButton == button3)
        [self.button4 setHidden:NO];
    else if (currentButton == button4)
        [self.button5 setHidden:NO];
    else if (currentButton == button5)
        [self.button6 setHidden:NO];
    else if (currentButton == button11)
        [self.button12 setHidden:NO];
    else if (currentButton == button12)
        [self.button13 setHidden:NO];
    else if (currentButton == button13)
        [self.button14 setHidden:NO];
    else if (currentButton == button14)
        [self.button15 setHidden:NO];
    else if (currentButton == button15)
        [self.button16 setHidden:NO];
    else if (currentButton == button21)
        [self.button22 setHidden:NO];
    else if (currentButton == button22)
        [self.button23 setHidden:NO];
    else if (currentButton == button23)
        [self.button24 setHidden:NO];
    else if (currentButton == button24)
        [self.button25 setHidden:NO];
    else if (currentButton == button25)
        [self.button26 setHidden:NO];
    [currentButton setTitle:value forState:UIControlStateNormal];
}

-(BOOL)checkPronunciationAlreadyAssign:(UIButton*)currentButton tab:(NSArray *)tab
{
    for (NSUInteger i = 0; i < 4; ++i)
        if ([currentButton.titleLabel.text isEqualToString:[tab objectAtIndex:i]])
            return YES;
    return NO;
}

-(void)addPronunciation:(UIButton *)currentButton value:(NSString *) value
{
    if (currentButton == nil)
        return ;
    NSArray *letterPronunciation = nil;
    if ([currentButton.titleLabel.text isEqualToString:@"a"] || [self checkPronunciationAlreadyAssign:currentButton tab:[self.tablePronunciation objectAtIndex:0]])
        letterPronunciation = [self.tablePronunciation objectAtIndex:0];
    else if ([currentButton.titleLabel.text isEqualToString:@"e"] || [self checkPronunciationAlreadyAssign:currentButton tab:[self.tablePronunciation objectAtIndex:1]])
        letterPronunciation = [self.tablePronunciation objectAtIndex:1];
    else if ([currentButton.titleLabel.text isEqualToString:@"i"] || [self checkPronunciationAlreadyAssign:currentButton tab:[self.tablePronunciation objectAtIndex:2]])
        letterPronunciation = [self.tablePronunciation objectAtIndex:2];
    else if ([currentButton.titleLabel.text isEqualToString:@"o"] || [self checkPronunciationAlreadyAssign:currentButton tab:[self.tablePronunciation objectAtIndex:3]])
        letterPronunciation = [self.tablePronunciation objectAtIndex:3];
    else if ([currentButton.titleLabel.text isEqualToString:@"u"] || [self checkPronunciationAlreadyAssign:currentButton tab:[self.tablePronunciation objectAtIndex:4]])
        letterPronunciation = [self.tablePronunciation objectAtIndex:4];
    else if ([currentButton.titleLabel.text isEqualToString:@"ü"] || [self checkPronunciationAlreadyAssign:currentButton tab:[self.tablePronunciation objectAtIndex:5]])
        letterPronunciation = [self.tablePronunciation objectAtIndex:5];
    
    if (letterPronunciation == nil)
        return ;
    
    if ([value isEqualToString:p1.titleLabel.text])
        [self assignValue:currentButton value:[letterPronunciation objectAtIndex:0]];
    else if ([value isEqualToString:p2.titleLabel.text])
        [self assignValue:currentButton value:[letterPronunciation objectAtIndex:1]];
    else if ([value isEqualToString:p3.titleLabel.text])
        [self assignValue:currentButton value:[letterPronunciation objectAtIndex:2]];
    else if ([value isEqualToString:p4.titleLabel.text])
        [self assignValue:currentButton value:[letterPronunciation objectAtIndex:3]];
    
}

- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer
{
    UIButton *currentButton = (UIButton *)recognizer.view;
    
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x, 
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
    if (recognizer.state == UIGestureRecognizerStateBegan)
    {
        // POSITION START
    }
    else if (recognizer.state == UIGestureRecognizerStateChanged)
    {
        // POSITION IN MOVEMENT
    }
    else if (recognizer.state == UIGestureRecognizerStateEnded)
    {
        // Old information about the button
        LearningChineseLetter *currentLetter= [[self dataController] getLetter:currentButton.titleLabel.text];
        CGPoint oldCenter = currentLetter.initialCenter;
        
        // VELOCITY EFFECT
        CGPoint velocity = [recognizer velocityInView:self.view];
        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
        CGFloat slideMult = magnitude / 200;
        
        float slideFactor = 0.1 * slideMult; // Increase for more of a slide
        CGPoint finalPoint = CGPointMake(recognizer.view.center.x + (velocity.x * slideFactor), 
                                         recognizer.view.center.y + (velocity.y * slideFactor));
        finalPoint.x = MIN(MAX(finalPoint.x, 0), self.view.bounds.size.width);
        finalPoint.y = MIN(MAX(finalPoint.y, 0), self.view.bounds.size.height);
        
        [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            recognizer.view.center = finalPoint;
        } completion:nil];
        
        // Check assign
        UIButton *targetedButton = [self getTargetedButton:finalPoint];
        if (targetedButton != nil)
        {
            // CHECK Pronunciation
            if ([currentLetter.letter isEqualToString:p1.titleLabel.text]
                || [currentLetter.letter isEqualToString:p2.titleLabel.text]
                || [currentLetter.letter isEqualToString:p3.titleLabel.text]
                || [currentLetter.letter isEqualToString:p4.titleLabel.text]
                )
            {
                if (targetedButton.titleLabel.text != nil)
                    [self addPronunciation:targetedButton value:currentLetter.letter];
            }
            else
                [self assignValue:targetedButton value:currentLetter.letter];
        }
        
        // COME BACK TO BEGININ POSITION
        [UIView animateWithDuration:slideFactor*2 delay:0.5 options:UIViewAnimationOptionCurveEaseOut animations:^{recognizer.view.center = oldCenter;} completion:nil];
    }
}

-(void)initializePrononciationTable
{
    // TODO: implementation
}

- (IBAction)resetSelectedChoice:(id)sender
{
    if (isResting == YES)
    {
        return ;
    }
    [self.button1 setHidden:NO];
    [self.button2 setHidden:YES];
    [self.button3 setHidden:YES];
    [self.button4 setHidden:YES];
    [self.button5 setHidden:YES];
    [self.button6 setHidden:YES];
    
    self.button1.titleLabel.text = nil;
    self.button2.titleLabel.text = nil;
    self.button3.titleLabel.text = nil;
    self.button4.titleLabel.text = nil;
    self.button5.titleLabel.text = nil;
    self.button6.titleLabel.text = nil;
    
    [self.button11 setHidden:YES];
    [self.button12 setHidden:YES];
    [self.button13 setHidden:YES];
    [self.button14 setHidden:YES];
    [self.button15 setHidden:YES];
    [self.button16 setHidden:YES];
    
    self.button11.titleLabel.text = nil;
    self.button12.titleLabel.text = nil;
    self.button13.titleLabel.text = nil;
    self.button14.titleLabel.text = nil;
    self.button15.titleLabel.text = nil;
    self.button16.titleLabel.text = nil;
    
    [self.button21 setHidden:YES];
    [self.button22 setHidden:YES];
    [self.button23 setHidden:YES];
    [self.button24 setHidden:YES];
    [self.button25 setHidden:YES];
    [self.button26 setHidden:YES];
    
    self.button21.titleLabel.text = nil;
    self.button22.titleLabel.text = nil;
    self.button23.titleLabel.text = nil;
    self.button24.titleLabel.text = nil;
    self.button25.titleLabel.text = nil;
    self.button26.titleLabel.text = nil;
    
    if (partTwoEnable == YES)
        [self.button11 setHidden:NO];
    if (partThreeEnable == YES)
        [self.button21 setHidden:NO];
}

-(IBAction)checkAnswer:(id)sender
{
    if (isResting == YES)
    {
        [self skipCorrection];
        return ;
    }
    NSString *word = nil;
    NSString *word2 = nil;
    NSString *word3 = nil;
    
    word = nil;
    if (button1.titleLabel.text.length)
        word = [button1.titleLabel.text copy];
    if (button2.titleLabel.text.length)
        word = [[NSString alloc] initWithFormat:@"%@%@", word, button2.titleLabel.text];
    if (button3.titleLabel.text.length)
        word = [[NSString alloc] initWithFormat:@"%@%@", word, button3.titleLabel.text];
    if (button4.titleLabel.text.length)
        word = [[NSString alloc] initWithFormat:@"%@%@", word, button4.titleLabel.text];
    if (button5.titleLabel.text.length)
        word = [[NSString alloc] initWithFormat:@"%@%@", word, button5.titleLabel.text];
    if (button6.titleLabel.text.length)
        word = [[NSString alloc] initWithFormat:@"%@%@", word, button6.titleLabel.text];
    if (partTwoEnable == YES)
    {
        if (button11.titleLabel.text.length)
            word2 = [button11.titleLabel.text copy];
        if (button12.titleLabel.text.length)
            word2 = [[NSString alloc] initWithFormat:@"%@%@", word2, button12.titleLabel.text];
        if (button13.titleLabel.text.length)
            word2 = [[NSString alloc] initWithFormat:@"%@%@", word2, button13.titleLabel.text];
        if (button14.titleLabel.text.length)
            word2 = [[NSString alloc] initWithFormat:@"%@%@", word2, button14.titleLabel.text];
        if (button15.titleLabel.text.length)
            word2 = [[NSString alloc] initWithFormat:@"%@%@", word2, button15.titleLabel.text];
        if (button16.titleLabel.text.length)
            word2 = [[NSString alloc] initWithFormat:@"%@%@", word2, button16.titleLabel.text];
        if (word2)
            word = [[NSString alloc] initWithFormat:@"%@%@", word, word2];
        if (partThreeEnable == YES)
        {
            if (button21.titleLabel.text.length)
                word3 = [button21.titleLabel.text copy];
            if (button22.titleLabel.text.length)
                word3 = [[NSString alloc] initWithFormat:@"%@%@", word3, button22.titleLabel.text];
            if (button23.titleLabel.text.length)
                word3 = [[NSString alloc] initWithFormat:@"%@%@", word3, button23.titleLabel.text];
            if (button24.titleLabel.text.length)
                word3 = [[NSString alloc] initWithFormat:@"%@%@", word3, button24.titleLabel.text];
            if (button25.titleLabel.text.length)
                word3 = [[NSString alloc] initWithFormat:@"%@%@", word3, button25.titleLabel.text];
            if (button26.titleLabel.text.length)
                word3 = [[NSString alloc] initWithFormat:@"%@%@", word3, button26.titleLabel.text];
            if (word3)
                word = [[NSString alloc] initWithFormat:@"%@%@", word, word3];
        }
    }
    
    [self cleanForResult];
    restTime = 3;
    isResting = YES;
    
    NSString *correctAnswer = [[NSString alloc] initWithFormat:[[myDB objectAtIndex:indexQuestion] valueForKey:@"pinyin"]];
    if ([word isEqualToString:correctAnswer])
    {
        restTime = 3;
        if (partThreeEnable)
            self.score += 15;
        else if (partTwoEnable)
            self.score += 10;
        else
            self.score += 5;
        displayZone.text = [[NSString alloc] initWithFormat:@"很好！You scored.\n\n%@\n%@", chineseCharacter.text, correctAnswer];
    }
    else
    {
        restTime = 5;
        if ([word length])
        {
            displayZone.text = [[NSString alloc] initWithFormat:@"That's wrong, too bad...\n\n%@\n%@\n\nYou write: %@", chineseCharacter.text, correctAnswer, word];
        }
        else
        {
            displayZone.text = [[NSString alloc] initWithFormat:@"You should try!! :(\n\n%@\n%@", chineseCharacter.text, correctAnswer];
        }
        if (partThreeEnable)
            self.score -= 1;
        else if (partTwoEnable)
            self.score -= 2;
        else
            self.score -= 3;
    }
    gamePoints.text = [NSString stringWithFormat:@"%d", score];
}

-(void)skipCorrection
{
    restTime = 0;
    isResting = NO;
    [self.p1 setHidden:NO];
    [self.p2 setHidden:NO];
    [self.p3 setHidden:NO];
    [self.p4 setHidden:NO];
    [self.displayZone setHidden:YES];
    [self.p1 setHidden:NO];
    [self.p2 setHidden:NO];
    [self.p3 setHidden:NO];
    [self.p4 setHidden:NO];
    // Rest time is over
    isResting = NO;
    [timer invalidate];
    // If time is > 0, game continues with another question
    if (time > 0)
        [self loadQuestion];
    else
        [self resetGame];
}

- (IBAction)skipAnswer:(id)sender
{
    if (isResting == YES)
    {
        [self skipCorrection];
        return ;
    }
    self.score -= 5;
    restTime = 5;
    [self cleanForResult];
    isResting = YES;
    NSString *correctAnswer = [[NSString alloc] initWithFormat:[[myDB objectAtIndex:indexQuestion] valueForKey:@"pinyin"]];
    displayZone.text = [[NSString alloc] initWithFormat:@"You should try!! :(\n\n%@\n%@", chineseCharacter.text, correctAnswer];
    gamePoints.text = [NSString stringWithFormat:@"%d", score];
}

-(void)prepareForNextQuestion:(NSUInteger)partsNumber
{
    self.partTwoEnable = NO;
    self.partThreeEnable = NO;
    
    if (partsNumber > 1)
        self.partTwoEnable = YES;
    if (partsNumber > 2)
        self.partThreeEnable = YES;
    
    [self resetSelectedChoice:nil];
}

- (void) loadDB
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Word" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError *error;
    myDB = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    countDB = myDB.count;
    for (Word *word in myDB)
    {
        // no more actions
    }
}

- (void)cleanForResult
{
    [self resetSelectedChoice:nil];
    [self.button1 setHidden:YES];
    [self.button11 setHidden:YES];
    [self.button21 setHidden:YES];
    [self.displayZone setHidden:NO];
    [self.p1 setHidden:YES];
    [self.p2 setHidden:YES];
    [self.p3 setHidden:YES];
    [self.p4 setHidden:YES];
}

- (void)countDown
{
    // if the game is runningm isResting == NO
    if (!isResting)
    {
        [self.displayZone setHidden:YES];
        // if time is left, game continues
        time--;
        gameTime.text = [[NSString alloc] initWithFormat:@"%i", time];
        if (time == 0)
        {
            [self cleanForResult];
            // time is over,
            isResting = YES;
            // set rest time
            restTime = 5;
            NSInteger percentage;
            if (nbQuestions == 1)
                percentage = 0;
            else
                percentage = (100 * goodAnswer / (nbQuestions - 1));
            displayZone.text = [[NSString alloc] initWithFormat:@"Time up !\nYou scored %i.\n%i/%i (%i%%)", score, goodAnswer, nbQuestions - 1, percentage];
        }
    }
    else 
    {
        if (restTime > 0)
        {
            restTime--;
        }
        else 
        {
            // Rest time is over
            isResting = NO;
            [timer invalidate];
            // If time is > 0, game continues with another question
            if (time > 0)
                [self loadQuestion];
            else
                [self resetGame];
        }
    }
}

- (void) resetGame
{
    [self.displayZone setHidden:YES];
    // TODO: IMPLEMENTATION
    time = 300;
    gameTime.text = [[NSString alloc] initWithFormat:@"%i", time];
    goodAnswer = 0;
    score = 0;
    gamePoints.text = [NSString stringWithFormat:@"%d", score];
    isResting = NO;
    [self.p1 setHidden:NO];
    [self.p2 setHidden:NO];
    [self.p3 setHidden:NO];
    [self.p4 setHidden:NO];
    [self.displayZone setHidden:YES];
    [self loadQuestion];
}

- (void) loadQuestion
{
    [self.displayZone setHidden:YES];
    [self.p1 setHidden:NO];
    [self.p2 setHidden:NO];
    [self.p3 setHidden:NO];
    [self.p4 setHidden:NO];
    // Save the right answer & ask the question
    indexQuestion = arc4random() % countDB;
    int lenght = 0;
    NSString *word = nil;
    while (lenght > 3 || lenght < 1)
    {
        word = [[NSString alloc] initWithFormat:[[myDB objectAtIndex:indexQuestion] valueForKey:@"chinese"]];
        lenght = word.length;
    }
    nbQuestions++;
    chineseCharacter.text = word;
    
    [self prepareForNextQuestion:lenght];
    
    // Launch timer
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
}

@end
