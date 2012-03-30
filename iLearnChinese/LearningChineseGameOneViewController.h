//
//  LearningChineseGameOneViewController.h
//  iLearnChinese
//
//  Created by jean-laurent louis on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LearningChineseGameOneViewController : UIViewController
{
    // Question number
    NSInteger one;
    NSInteger two;
    NSInteger three;
    NSInteger four;
    NSInteger right;
    
    // Score
    NSInteger actualScore;
    NSInteger nbQuestions;
    NSInteger goodAnswer;
    
    // Timer
    NSInteger time;
    NSInteger restTime;
    BOOL isResting;
    NSTimer *timer;
    
    // A supprimer sur la vraie version
    NSArray *myDB;
    NSInteger countDB;
    
    NSString *rightAnswer;
}

// use for the DB
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (weak, nonatomic) IBOutlet UILabel *purpose;
@property (weak, nonatomic) IBOutlet UILabel *question;
@property (weak, nonatomic) IBOutlet UIButton *answerOne;
@property (weak, nonatomic) IBOutlet UIButton *answerTwo;
@property (weak, nonatomic) IBOutlet UIButton *answerThree;
@property (weak, nonatomic) IBOutlet UIButton *answerFour;
@property (weak, nonatomic) IBOutlet UILabel *myScore;
@property (weak, nonatomic) IBOutlet UILabel *timeLeft;
@property (weak, nonatomic) IBOutlet UILabel *nbQuestion;

- (IBAction)selectOne:(id)sender;
- (IBAction)selectTwo:(id)sender;
- (IBAction)selectThree:(id)sender;
- (IBAction)selectFour:(id)sender;


- (void) checkAnswer:(NSInteger)answer;
- (void) saveScore;
- (void) loadDB;
- (void) loadQuestion;
- (void) updateScore;
- (void) countDown;
- (void) resetGame;

@end
