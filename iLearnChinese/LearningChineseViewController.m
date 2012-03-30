//
//  LearningChineseViewController.m
//  iLearnChinese
//
//  Created by jean-laurent louis on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LearningChineseViewController.h"
#import "LearningChineseGameTwoViewController.h"

@interface LearningChineseViewController ()

@end

@implementation LearningChineseViewController
@synthesize managedObjectContext = _managedObjectContext;


- (void)addWordToDBWithEnglish:(NSString *)english 
                    chinese:(NSString *)chinese 
                     pinyin:(NSString *)pinyin
{
    Word *word = [NSEntityDescription insertNewObjectForEntityForName:@"Word"
                                               inManagedObjectContext:self.managedObjectContext];
    [word setEnglish:english];
    [word setPinyin:pinyin];
    [word setChinese:chinese];
    [word setAddByUser:[NSNumber numberWithBool:NO]];
    [self.managedObjectContext save:nil];
}

-(void)loadDefaultDatabase
{
    /* These words are from the book:
       Experiencing Chinese (Traveling in China) */
    // Lesson 1
    [self addWordToDBWithEnglish:@"Please" chinese:@"请" pinyin:@"qǐng"];
    [self addWordToDBWithEnglish:@"Show" chinese:@"出示" pinyin:@"chūshì"];
    [self addWordToDBWithEnglish:@"Entry Card" chinese:@"入境卡" pinyin:@"rùjìngkǎ"];
    [self addWordToDBWithEnglish:@"Plane Ticket" chinese:@"机票" pinyin:@"jīpiào"];
    [self addWordToDBWithEnglish:@"Boarding Pass" chinese:@"登记卡" pinyin:@"dēngjīkǎ"];
    [self addWordToDBWithEnglish:@"Your" chinese:@"您的" pinyin:@"nínde"];
    [self addWordToDBWithEnglish:@"Police" chinese:@"警察" pinyin:@"jǐngchá"];
    [self addWordToDBWithEnglish:@"Information" chinese:@"问询处" pinyin:@"wènxùnchù"];
    
    // Lesson 2
    [self addWordToDBWithEnglish:@"I" chinese:@"我" pinyin:@"qǐng"];
    [self addWordToDBWithEnglish:@"Come" chinese:@"来" pinyin:@"chūshì"];
    [self addWordToDBWithEnglish:@"China" chinese:@"中国" pinyin:@"rùjìngkǎ"];
    [self addWordToDBWithEnglish:@"Travel" chinese:@"旅游" pinyin:@"lǚyóu"];
    [self addWordToDBWithEnglish:@"Purpose" chinese:@"目的" pinyin:@"mùdì"];
    [self addWordToDBWithEnglish:@"Be" chinese:@"是" pinyin:@"shì"];
    [self addWordToDBWithEnglish:@"Study" chinese:@"学习" pinyin:@"xuéxí"];
    [self addWordToDBWithEnglish:@"Work" chinese:@"工作" pinyin:@"gōngzuò"];
    [self addWordToDBWithEnglish:@"Do business" chinese:@"经商" pinyin:@"jīngshāng"];
    
    // Lesson 3
    [self addWordToDBWithEnglish:@"Open" chinese:@"打开" pinyin:@"dǎkāi"];
    [self addWordToDBWithEnglish:@"Suitcase" chinese:@"箱子" pinyin:@"xiāngzi"];
    [self addWordToDBWithEnglish:@"OK" chinese:@"好的" pinyin:@"hǎode"];
    [self addWordToDBWithEnglish:@"Backpack" chinese:@"背包" pinyin:@"bēibāo"];
    [self addWordToDBWithEnglish:@"Luggage" chinese:@"行李" pinyin:@"xíngli"];
    [self addWordToDBWithEnglish:@"Bag" chinese:@"袋子" pinyin:@"dàizi"];
    [self addWordToDBWithEnglish:@"Exit" chinese:@"出口" pinyin:@"chūkǒu"];
    [self addWordToDBWithEnglish:@"Entrance" chinese:@"入口" pinyin:@"rùkǒu"];
    [self addWordToDBWithEnglish:@"Timetable" chinese:@"时间表" pinyin:@"shíjiānbiǎo"];
    [self addWordToDBWithEnglish:@"Arrival" chinese:@"抵达" pinyin:@"dǐdá"];
    [self addWordToDBWithEnglish:@"Departure" chinese:@"出发" pinyin:@"chūfā"];
    
    // Lesson 4
    [self addWordToDBWithEnglish:@"This" chinese:@"这个" pinyin:@"zhège"];
    [self addWordToDBWithEnglish:@"Need" chinese:@"需要" pinyin:@"xūyào"];
    [self addWordToDBWithEnglish:@"Declaration" chinese:@"申报" pinyin:@"shēnbào"];
    [self addWordToDBWithEnglish:@"Yes / No ?" chinese:@"吗" pinyin:@"ma"];
    [self addWordToDBWithEnglish:@"Not" chinese:@"不" pinyin:@"bù"];
    [self addWordToDBWithEnglish:@"Camera" chinese:@"相机" pinyin:@"xiàngjī"];
    [self addWordToDBWithEnglish:@"Books" chinese:@"书" pinyin:@"shū"];
    [self addWordToDBWithEnglish:@"CD" chinese:@"光盘" pinyin:@"guāngpán"];
    
    // Lesson 5
    [self addWordToDBWithEnglish:@"Animals" chinese:@"动物" pinyin:@"dòngwù"];
    [self addWordToDBWithEnglish:@"Can" chinese:@"可以" pinyin:@"kěyǐ"];
    [self addWordToDBWithEnglish:@"Sorry" chinese:@"对不起" pinyin:@"duìbuqǐ"];
    [self addWordToDBWithEnglish:@"Fruits" chinese:@"水果" pinyin:@"shuǐguǒ"];
    [self addWordToDBWithEnglish:@"Meat products" chinese:@"肉制品" pinyin:@"ròuzhìpǐn"];
    [self addWordToDBWithEnglish:@"Plants" chinese:@"植物" pinyin:@"zhíwù"];
}

- (void)checkDatabase
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Word" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *myDB = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (![myDB count])
    {
        NSLog(@"LOADING DEFAULT DATABASE");
        //[fileManager copyItemAtPath:defaultStorePath toPath:storePath error:NULL];
        [self loadDefaultDatabase];
    }
    else
    {
        NSLog(@"The database is not empty.");
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self checkDatabase];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (BOOL)isChineseKeyboardActivated
{
    [[NSUserDefaults standardUserDefaults] synchronize];
    NSDictionary* defaults = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
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

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=//Settings/Keyboard/Keyboards"]];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PushDatabase"])
    {
        LearningChineseDatabaseViewController *words = segue.destinationViewController;
        words.managedObjectContext = self.managedObjectContext;
    }
    else if ([segue.identifier isEqualToString:@"PushGameOne"])
    {
        LearningChineseGameOneViewController *words = segue.destinationViewController;
        words.managedObjectContext = self.managedObjectContext;
    }
    else if ([segue.identifier isEqualToString:@"PushGameTwo"])
    {
        LearningChineseGameTwoViewController *words = segue.destinationViewController;
        words.managedObjectContext = self.managedObjectContext;
    }
}
- (IBAction)game2Button:(id)sender
{
    bool isLaunchable = [self isChineseKeyboardActivated];
    if (!isLaunchable)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Chinese keyboard not activated" message:@"You need to activate the 'Chinese-Simplified (Handwriting)' keyboard to play this game. Would you like to activate this keyboard ?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes",nil];
        [alert show];
    }
    else
    {
        [self performSegueWithIdentifier:@"PushGameTwo" sender:sender];
    }
}
@end
