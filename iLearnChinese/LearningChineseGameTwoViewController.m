//
//  LearningChineseGameTwoViewController.m
//  iLearnChinese
//
//  Created by jean-laurent louis on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LearningChineseGameTwoViewController.h"

@interface LearningChineseGameTwoViewController ()

@end

@implementation LearningChineseGameTwoViewController
@synthesize purpose;
@synthesize nbQuestion;
@synthesize question;
@synthesize myScore;
@synthesize timeLeft;
@synthesize answerField;

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    bool isLaunchable = [self isChineseKeyboardActivated];
    if (!isLaunchable)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Chinese keyboard not activated" message:@"You need to activate the 'Chinese-Simplified (Handwriting)' keyboard to play this game. Would you like to activate this keyboard ?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes",nil];
        [alert show];
        return;
    }
    // Load virtual DB
    [self loadDB];
    // Launch a game
    [self resetGame];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=//Settings/Keyboard/Keyboards"]];
    }
}

- (void)viewDidUnload
{
    [self setPurpose:nil];
    [self setNbQuestion:nil];
    [self setQuestion:nil];
    [self setMyScore:nil];
    [self setTimeLeft:nil];
    [self setAnswerField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)isChineseKeyboardActivated
{
    [[NSUserDefaults standardUserDefaults] synchronize];
    NSDictionary* defaults = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    // NSLog(@"Value : %@", [defaults objectForKey:@"AppleKeyboards"]);
    // NSLog(@"Subvalue : %@", [[defaults objectForKey:@"AppleKeyboards"] objectAtIndex:0]);
    NSString *chineseKeyboard = [[NSString alloc] initWithString:@"zh_Hans-HWR@sw=HWR"];
    id appleKeyboards = [defaults objectForKey:@"AppleKeyboards"];
    for (int i = 0; i < [appleKeyboards count]; i++)
    {
        if ([chineseKeyboard isEqual:[appleKeyboards objectAtIndex:i]])
        {
            NSLog(@"Launchable okay");
            return YES;
        }
    }
    return NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.answerField) {
        [theTextField resignFirstResponder];
    }
    return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) resetGame
{
    // Reset value for a new game
    actualScore = 0;
    time = 60;
    nbQuestions = 0;
    goodAnswer = 0;
    nbQuestion.text = [[NSString alloc] initWithFormat:@"Question %i :", nbQuestions];
    myScore.text = [[NSString alloc] initWithFormat:@"Score : %i", actualScore];
    timeLeft.text = [[NSString alloc] initWithFormat:@"Time left : %i", time];
    isResting = NO;
    [self loadQuestion];
}

- (void) loadQuestion
{
    answerField.enabled = YES;
    answerField.text = nil;
    // Save the right answer & ask the question
    rightAnswer = arc4random() % countDB;
    nbQuestions++;
    nbQuestion.text = [[NSString alloc] initWithFormat:@"Question %i:", nbQuestions];
    question.text = [[NSString alloc] initWithFormat:[myDB objectAtIndex:(rightAnswer * 2 + 1)]];
    // Set purpose of the game
    purpose.text = @"Draw the chinese character !";
    [answerField becomeFirstResponder];
    
    // Launch timer
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
}

- (void) loadDB
{
    // Virtual DB for prototype
   NSArray *quizArray = [[NSArray alloc] initWithObjects:
                          @"护照",      @"Passport",
                          @"入境卡",    @"Entry card",
                          @"机票",      @"Plane ticket",
                          @"登记卡",    @"Boarding pass",
                          @"学习",      @"Study",
                          @"工作",      @"Work",
                          @"经商",      @"Do business",
                          @"目的",      @"Purpose",
                          @"陆游",      @"Travel",
                          @"来",       @"Come",
                          @"中国",      @"China",
                          @"箱子",      @"Suitcase",
                          @"背包",      @"Backpack",
                          @"行李",      @"Luggage",
                          @"袋子",      @"Bag",
                          @"出口",      @"Exit",
                          @"入口",      @"Entrance",
                          @"时间表",    @"Timetable",
                          @"抵达",      @"Arrival",
                          @"出发",      @"Departure",
                          @"需要",      @"Need",
                          @"相机",      @"Camera",
                          @"书",       @"Books",
                          @"光盘",      @"CD",
                          @"申报",      @"Declaration",
                          @"动物",      @"Dog",
                          @"可以",      @"Can",
                          @"带入",      @"Bring",
                          @"水果",       @"Fruits",
                          @"肉制品",     @"Meat products",
                          @"植物",      @"Plants",
                          nil];
    countDB = quizArray.count / 2;
	myDB = quizArray;
}

- (void)countDown
{
    // if the game is runningm isResting == NO
    if (!isResting)
    {
        // if time is left, game continues
        time--;
        timeLeft.text = [[NSString alloc] initWithFormat:@"Time left : %i", time];
        if (time == 0)
        {
            // time is over,
            isResting = YES;
            // set rest time
            restTime = 5;
            NSInteger percentage;
            if (nbQuestions == 1)
                percentage = 0;
            else
                percentage = (100 * goodAnswer / (nbQuestions - 1));
            question.text = [[NSString alloc] initWithFormat:@"Time up !\nYou scored %i.\n%i/%i (%i%%)", actualScore, goodAnswer, nbQuestions - 1, percentage];
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

- (BOOL)answerFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.answerField) {
        [theTextField resignFirstResponder];
    }
    return YES;
}

-(void) updateScore
{
    // Update score label
    myScore.text = [[NSString alloc] initWithFormat:@"Score : %i", actualScore];
    // Give a break
    restTime = 3;
    isResting = YES;
}

- (IBAction)valideAnswer:(id)sender {
    if ([answerField.text isEqual:[myDB objectAtIndex:rightAnswer * 2]])
    {
        purpose.text = @"很好！You scored.";
        goodAnswer++;
        actualScore += 10;
    }
    else
    {
        purpose.text = @"That's wrong, too bad...";
        question.text = [[NSString alloc] initWithFormat:@"%@ != %@", answerField.text, [myDB objectAtIndex:rightAnswer * 2]];
        actualScore -= 2;
    }
    answerField.enabled = NO;
    [self updateScore];
}

@end
