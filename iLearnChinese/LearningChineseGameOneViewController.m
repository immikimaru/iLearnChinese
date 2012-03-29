//
//  LearningChineseGameOneViewController.m
//  iLearnChinese
//
//  Created by pierre cangemi on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LearningChineseGameOneViewController.h"
#import <CoreData/CoreData.h>

@interface LearningChineseGameOneViewController ()

@end

@implementation LearningChineseGameOneViewController
@synthesize managedObjectContext;
@synthesize purpose;
@synthesize question;
@synthesize answerOne;
@synthesize answerTwo;
@synthesize answerThree;
@synthesize answerFour;
@synthesize myScore;
@synthesize timeLeft;
@synthesize nbQuestion;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // Load the CoreData DB
    NSLog(@"[JL DEBUG %s] LOAD DB : %@", __func__, self.managedObjectContext);
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Word" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *db = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    for (NSManagedObject *word in db)
    {
        NSLog(@"\nEnglish : %@\nPinyin : %@\nChinese : %@", [word valueForKey:@"english"], [word valueForKey:@"pinyin"], [word valueForKey:@"chinese"]);
    }
    // Load virtual DB
    [self loadDB];
    // Launch a game
    [self resetGame];
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
    // Random a question
    UIColor *black = [UIColor blackColor];
    
    one = (arc4random() % countDB) * 2 + 1;
    two = (arc4random() % countDB) * 2 + 1;
    while (one == two)
        two = (arc4random() % countDB) * 2 + 1;
    three = (arc4random() % countDB) * 2 + 1;
    while (one == three || two == three)
        three = (arc4random() % countDB) * 2 + 1;
    four = (arc4random() % countDB) * 2 + 1;
    while (one == four || two == four || three == four)
        four = (arc4random() % countDB) * 2 + 1;
    
    // Reset the button to initial state
    [answerOne setTitle:[myDB objectAtIndex:one] forState:UIControlStateNormal];
    answerOne.titleLabel.textColor = black;
    [answerOne setHidden:NO];
    [answerOne setEnabled:YES];
    
	[answerTwo setTitle:[myDB objectAtIndex:two] forState:UIControlStateNormal];
    answerTwo.titleLabel.textColor = black;
    [answerTwo setHidden:NO];
    [answerTwo setEnabled:YES];
    
	[answerThree setTitle:[myDB objectAtIndex:three] forState:UIControlStateNormal];
    answerThree.titleLabel.textColor = black;
    [answerThree setHidden:NO];
    [answerThree setEnabled:YES];
    
	[answerFour setTitle:[myDB objectAtIndex:four] forState:UIControlStateNormal];
    answerFour.titleLabel.textColor = black;
	[answerFour setHidden:NO];
    [answerFour setEnabled:YES];
    
    right = arc4random() % 4;
    switch (right) {
        case 0:
            right = one;
            break;
        case 1:
            right = two;
            break;
        case 2:
            right = three;
            break;
        case 3:
            right = four;
            break;
        default:
            break;
    }
    
    // Save the right answer & ask the question
    rightAnswer = [myDB objectAtIndex:right];
    nbQuestions++;
    nbQuestion.text = [[NSString alloc] initWithFormat:@"Question %i :", nbQuestions];
    question.text = [[NSString alloc] initWithFormat:@"%@", [myDB objectAtIndex:(right - 1)]];
    // Set purpose of the game
    purpose.text = @"Find the meaning !";
    
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
            [answerOne setHidden:YES];
            [answerTwo setHidden:YES];
            [answerThree setHidden:YES];
            [answerFour setHidden:YES];
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

- (void)checkAnswer:(NSInteger)answer
{
    
    if (rightAnswer == [myDB objectAtIndex:answer])
    {
        purpose.text = @"很好！You scored.";
        goodAnswer++;
        actualScore += 10;
    }
    else
    {
        // Show the good answer in green
        if (answerOne.titleLabel.text == rightAnswer)
        {
            [answerOne setHidden:NO];
            [answerOne setEnabled:NO];
            answerOne.titleLabel.textColor = [UIColor greenColor];
        }
        else if (answerTwo.titleLabel.text == rightAnswer)
        {
            [answerTwo setHidden:NO];
            [answerTwo setEnabled:NO];
            answerTwo.titleLabel.textColor = [UIColor greenColor];
        }
        else if (answerThree.titleLabel.text == rightAnswer)
        {
            [answerThree setHidden:NO];
            [answerThree setEnabled:NO];
            answerThree.titleLabel.textColor = [UIColor greenColor];
        }
        else
        {
            [answerFour setHidden:NO];
            [answerFour setEnabled:NO];
            answerFour.titleLabel.textColor = [UIColor greenColor];
        }
        purpose.text = @"That's wrong, too bad...";
        actualScore -= 2;
    }
    [self updateScore];
}

-(void) updateScore
{
    // Update score label
    myScore.text = [[NSString alloc] initWithFormat:@"Score : %i", actualScore];
    // Give a break
    restTime = 3;
    isResting = YES;
}

- (void)viewDidUnload
{
    [self setPurpose:nil];
    [self setQuestion:nil];
    [self setAnswerOne:nil];
    [self setAnswerTwo:nil];
    [self setAnswerThree:nil];
    [self setAnswerFour:nil];
    [self setMyScore:nil];
    [self setTimeLeft:nil];
    [self setNbQuestion:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)selectOne:(id)sender {
    [answerOne setHidden:NO];
    [answerOne setEnabled:NO];
	[answerTwo setHidden:YES];
	[answerThree setHidden:YES];
	[answerFour setHidden:YES];
    [self checkAnswer:one];
}

- (IBAction)selectTwo:(id)sender {
    [answerOne setHidden:YES];
	[answerTwo setHidden:NO];
    [answerTwo setEnabled:NO];
	[answerThree setHidden:YES];
	[answerFour setHidden:YES];
    [self checkAnswer:two];
}

- (IBAction)selectThree:(id)sender {
    [answerOne setHidden:YES];
	[answerTwo setHidden:YES];
	[answerThree setHidden:NO];
    [answerThree setEnabled:NO];
	[answerFour setHidden:YES];
    [self checkAnswer:three];
}

- (IBAction)selectFour:(id)sender {
    [answerOne setHidden:YES];
	[answerTwo setHidden:YES];
	[answerThree setHidden:YES];
	[answerFour setHidden:NO];
    [answerFour setEnabled:NO];
    [self checkAnswer:four];
}

@end
