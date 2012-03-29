//
//  LearningChineseDatabaseViewController.m
//  iLearnChinese
//
//  Created by jean-laurent louis on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LearningChineseDatabaseViewController.h"
#import "Word.h"

@implementation LearningChineseDatabaseViewController
@synthesize fetchedResultsController = __fetchedResultsController;
@synthesize managedObjectContext = __managedObjectContext;
@synthesize selectedWord = _selectedWord;
@synthesize delegate = _delegate;
/*
@synthesize chineseLabel = _chineseLabel;
@synthesize englishLabel = _englishLabel;
@synthesize pinyinLabel = _pinyinLabel;
*/

-(void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)setupFetchedResultsController
{
    // 1 - Decide what Entity you want
    NSString *entityName = @"Word"; // Put your entity name here
    NSLog(@"Setting up a Fetched Results Controller for the Entity named %@", entityName);
    
    // 2 - Request that Entity
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
    
    // 3 - Filter it if you want
    //request.predicate = [NSPredicate predicateWithFormat:@"Word.english = Blah"];
    
    // 4 - Sort it if you want
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"english"
                                                                                     ascending:YES
                                                                                      selector:@selector(localizedCaseInsensitiveCompare:)]];
    // 5 - Fetch it
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:self.managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
    [self performFetch];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupFetchedResultsController];
}

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
    Word *word = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = word.english;
    /*
    _chineseLabel.text = word.chinese;
    [cell.contentView addSubview:_chineseLabel];
    _englishLabel.text = word.english;
    [cell.contentView addSubview:_englishLabel];
    _pinyinLabel.text = word.pinyin;
    [cell.contentView addSubview:_pinyinLabel];
    */
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"Add Word Segue"])
	{
        NSLog(@"Setting database as a delegate of Addword");
        
        LearningChineseAddWordToDatabaseViewController *addWord = segue.destinationViewController;
        addWord.delegate = self;
        addWord.managedObjectContext = self.managedObjectContext;
	}
    
    
    if ([segue.identifier isEqualToString:@"Add Word Segue"])
	{
        NSLog(@"Setting database as a delegate of addwords");
        
        LearningChineseAddWordToDatabaseViewController *addWord = segue.destinationViewController;
        addWord.delegate = self;
        addWord.managedObjectContext = self.managedObjectContext;
	}
    else if ([segue.identifier isEqualToString:@"Word Detail Segue"])
    {
        LearningChineseWordDetailViewController *wordDetail = segue.destinationViewController;
        wordDetail.delegate = self;
        wordDetail.managedObjectContext = self.managedObjectContext;
        
        // Store selected Role in selectedRole property
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        self.selectedWord = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        NSLog(@"Passing selected role (%@) to RoleDetailTVC", self.selectedWord.english);
        wordDetail.word = self.selectedWord;
    }
    else {
        NSLog(@"Unidentified Segue Attempted!");
    }
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.tableView beginUpdates]; // Avoid  NSInternalInconsistencyException
        
        // Delete the role object that was swiped
        Word *wordToDelete = [self.fetchedResultsController objectAtIndexPath:indexPath];
        NSLog(@"Deleting (%@)", wordToDelete.english);
        [self.managedObjectContext deleteObject:wordToDelete];
        [self.managedObjectContext save:nil];
        
        // Delete the (now empty) row on the table
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self performFetch];
        
        [self.tableView endUpdates];
    }
}

- (void)saveButtonWasTapped:(LearningChineseAddWordToDatabaseViewController *)controller
{
    // do something here like refreshing the table or whatever
    // close the delegated view
    [controller.navigationController popViewControllerAnimated:YES];
}

- (void)saveButtonWasTappedEdit:(LearningChineseWordDetailViewController *)controller
{
    // do something here like refreshing the table or whatever
    
    // close the delegated view
    [controller.navigationController popViewControllerAnimated:YES];    
}
- (void)viewDidUnload {
    /*
    [self setChineseLabel:nil];
    [self setEnglishLabel:nil];
    [self setPinyinLabel:nil];
    */
    [super viewDidUnload];
}
@end
