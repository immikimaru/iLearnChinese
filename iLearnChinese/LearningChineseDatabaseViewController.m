//
//  LearningChineseDatabaseViewController.m
//  iLearnChinese
//
//  Created by jean-laurent louis on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LearningChineseDatabaseViewController.h"

@implementation LearningChineseDatabaseViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Words Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"Add Word Segue"])
	{
        NSLog(@"Setting database as a delegate of Addword");
        
        LearningChineseAddWordToDatabaseViewController *addWord = segue.destinationViewController;
        addWord.delegate = self;
	}
}

- (void)saveButtonWasTapped:(LearningChineseAddWordToDatabaseViewController *)controller
{
    // do something here like refreshing the table or whatever
    
    // close the delegated view
    [controller.navigationController popViewControllerAnimated:YES];
}

@end
