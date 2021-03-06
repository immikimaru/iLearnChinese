//
//  LearningChineseGameTwoViewController.h
//  iLearnChinese
//
//  Created by jean-laurent louis on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LearningChineseGameTwoViewController : UIViewController
<UITextFieldDelegate>
{
    NSInteger actualScore;
    NSInteger nbQuestions;
    NSInteger goodAnswer;
    
    NSInteger time;
    NSInteger restTime;
    BOOL isResting;
    NSTimer *timer;
    
    NSInteger rightAnswer;
    //NSString *rightAnswer;
    
    NSArray *myDB;
    NSInteger countDB;
}
// use for the DB
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (weak, nonatomic) IBOutlet UILabel *purpose;
@property (weak, nonatomic) IBOutlet UILabel *nbQuestion;
@property (weak, nonatomic) IBOutlet UILabel *question;
@property (weak, nonatomic) IBOutlet UILabel *myScore;
@property (weak, nonatomic) IBOutlet UILabel *timeLeft;
@property (weak, nonatomic) IBOutlet UITextField *answerField;

- (IBAction)valideAnswer:(id)sender;
- (void) saveScore;
- (void) loadDB;
- (void) loadQuestion;
- (void) updateScore;
- (void) countDown;
- (void) resetGame;

@end
