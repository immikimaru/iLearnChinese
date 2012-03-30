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
    NSNumber *no = 0;
    [word setEnglish:english];
    [word setPinyin:chinese];
    [word setChinese:pinyin];
    [word setAddByUser:no];
    [self.managedObjectContext save:nil];
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
        
        [self addWordToDBWithEnglish:@"test" chinese:@"test" pinyin:@"test"];
        [self addWordToDBWithEnglish:@"test1" chinese:@"test1" pinyin:@"test1"];
        [self addWordToDBWithEnglish:@"test2" chinese:@"test2" pinyin:@"test2"];
    }
    else
    {
        NSLog(@"The database already exist");
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
