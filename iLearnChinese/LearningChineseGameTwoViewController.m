//
//  LearningChineseGameTwoViewController.m
//  iLearnChinese
//
//  Created by jean-laurent louis on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "LearningChineseGameTwoViewController.h"
#import "Word.h"

@interface LearningChineseGameTwoViewController ()

@end

@implementation LearningChineseGameTwoViewController
@synthesize managedObjectContext;
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
    // Load virtual DB
    [self loadDB];
    // Launch a game
    [self resetGame];
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
    time = 300;
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
    question.text = [[NSString alloc] initWithFormat:[[myDB objectAtIndex:rightAnswer] valueForKey:@"pinyin"]];
    // Set purpose of the game
    purpose.text = @"Draw the chinese character !";
    [answerField becomeFirstResponder];
    
    // Launch timer
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
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
        NSLog(@"[JL DEBUG %s]\nE: %@\nC: %@", __func__, word.english, word.chinese);
    }
    NSLog(@"[JL DEBUG %s] LOAD DB : %i", __func__, countDB);
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
    if([answerField.text isEqual:[[myDB objectAtIndex:rightAnswer] valueForKey:@"chinese"]])
    {
        purpose.text = @"很好！You scored.";
        goodAnswer++;
        actualScore += 10;
    }
    else
    {
        purpose.text = @"That's wrong, too bad...";
        question.text = [[NSString alloc] initWithFormat:@"The right answer was %@", [[myDB objectAtIndex:rightAnswer] valueForKey:@"chinese"]];
        actualScore -= 2;
    }
    answerField.enabled = NO;
    [self updateScore];
}

@end
