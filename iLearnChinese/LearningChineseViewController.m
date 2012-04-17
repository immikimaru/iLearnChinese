//
//  LearningChineseViewController.m
//  iLearnChinese
//
//  Created by jean-laurent louis on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LearningChineseViewController.h"
#import "LearningChineseDatabaseViewController.h"
#import "LearningChineseHighScoreViewController.h"
#import "LearningChineseGameOneViewController.h"
#import "LearningChineseGameTwoViewController.h"
#import "User.h"

@interface LearningChineseViewController ()

@end

@implementation LearningChineseViewController
@synthesize dico = _dico;
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
       Experiencing Chinese (Traveling in China) 
       /!\ The chinese word must be from less than 4 character for the tone war*/
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
    [self addWordToDBWithEnglish:@"I" chinese:@"我" pinyin:@"wǒ"];
    [self addWordToDBWithEnglish:@"Come" chinese:@"来" pinyin:@"lái"];
    [self addWordToDBWithEnglish:@"China" chinese:@"中国" pinyin:@"zhōngguó"];
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
    
    // Lesson 6
    [self addWordToDBWithEnglish:@"Excuse me" chinese:@"请问" pinyin:@"qǐngwèn"];
    [self addWordToDBWithEnglish:@"Where" chinese:@"在哪儿" pinyin:@"zàinǎ'er"];
    [self addWordToDBWithEnglish:@"Get" chinese:@"取" pinyin:@"qǔ"];
    [self addWordToDBWithEnglish:@"Baggage" chinese:@"行李" pinyin:@"xínglǐ"];
    [self addWordToDBWithEnglish:@"Perform" chinese:@"办理" pinyin:@"bànlǐ"];
    [self addWordToDBWithEnglish:@"Boarding" chinese:@"登机" pinyin:@"dēngjī"];
    [self addWordToDBWithEnglish:@"Procedure" chinese:@"手续" pinyin:@"shǒuxù"];
    [self addWordToDBWithEnglish:@"Customs" chinese:@"海关" pinyin:@"hǎiguān"];
    [self addWordToDBWithEnglish:@"Check" chinese:@"托运" pinyin:@"tuōyùn"];
    
    // Lesson 7
    [self addWordToDBWithEnglish:@"Look for" chinese:@"找" pinyin:@"zhǎo"];
    [self addWordToDBWithEnglish:@"To" chinese:@"到了" pinyin:@"dàole"];
    [self addWordToDBWithEnglish:@"Do not" chinese:@"别" pinyin:@"bié"];
    [self addWordToDBWithEnglish:@"Anxious" chinese:@"着急" pinyin:@"zhāojí"];
    [self addWordToDBWithEnglish:@"Again" chinese:@"再" pinyin:@"zài"];
    [self addWordToDBWithEnglish:@"Looking" chinese:@"找找" pinyin:@"zhǎozhao"];
    [self addWordToDBWithEnglish:@"Passport" chinese:@"护照" pinyin:@"hùzhào"];
    [self addWordToDBWithEnglish:@"Bag" chinese:@"包" pinyin:@"bāo"];
    [self addWordToDBWithEnglish:@"Wallet" chinese:@"钱包" pinyin:@"qiánbāo"];
    
    // Lesson 8
    [self addWordToDBWithEnglish:@"Thank you" chinese:@"谢谢" pinyin:@"xièxie"];
    [self addWordToDBWithEnglish:@"Help" chinese:@"帮助" pinyin:@"bāngzhù"];
    [self addWordToDBWithEnglish:@"You're welcome" chinese:@"不客气" pinyin:@"bùkèqì"];
    [self addWordToDBWithEnglish:@"Introduction" chinese:@"介绍" pinyin:@"jièshào"];
    [self addWordToDBWithEnglish:@"Recommendation" chinese:@"推荐" pinyin:@"tuījiàn"];
    [self addWordToDBWithEnglish:@"Concern" chinese:@"关心" pinyin:@"guānxīn"];
    
    // Lesson 9
    [self addWordToDBWithEnglish:@"Join" chinese:@"接" pinyin:@"jiē"];
    [self addWordToDBWithEnglish:@"You're welcome" chinese:@"不用谢" pinyin:@"bùyòngxiè"];
    [self addWordToDBWithEnglish:@"See off" chinese:@"送" pinyin:@"sòng"];
    [self addWordToDBWithEnglish:@"See" chinese:@"看" pinyin:@"kàn"];
    [self addWordToDBWithEnglish:@"Accompany" chinese:@"陪" pinyin:@"péi"];
    
    // Lesson 10
    [self addWordToDBWithEnglish:@"Airplane" chinese:@"飞机" pinyin:@"fēijī"];
    [self addWordToDBWithEnglish:@"What" chinese:@"什么" pinyin:@"shénme"];
    [self addWordToDBWithEnglish:@"Time" chinese:@"时候" pinyin:@"shíhou"];
    [self addWordToDBWithEnglish:@"Take off" chinese:@"起飞" pinyin:@"qǐfēi"];
    [self addWordToDBWithEnglish:@"Now" chinese:@"现在" pinyin:@"xiànzài"];
    [self addWordToDBWithEnglish:@"Still" chinese:@"还" pinyin:@"hái"];
    [self addWordToDBWithEnglish:@"Know" chinese:@"知道" pinyin:@"zhīdào"];
    [self addWordToDBWithEnglish:@"Listen" chinese:@"听" pinyin:@"tīng"];
    [self addWordToDBWithEnglish:@"Broadcast" chinese:@"广播" pinyin:@"guǎngbò"];
    [self addWordToDBWithEnglish:@"Message" chinese:@"通知" pinyin:@"tōngzhī"];
    [self addWordToDBWithEnglish:@"Arrive" chinese:@"到达" pinyin:@"dàodá"];
    [self addWordToDBWithEnglish:@"Land" chinese:@"降落" pinyin:@"jiàngluò"];
    [self addWordToDBWithEnglish:@"Land" chinese:@"着陆" pinyin:@"zhuólù"];
    
    // Lesson 11
    [self addWordToDBWithEnglish:@"Wish" chinese:@"祝" pinyin:@"zhù"];
    [self addWordToDBWithEnglish:@"Pleasant" chinese:@"愉快" pinyin:@"yúkuài"];
    [self addWordToDBWithEnglish:@"Trip" chinese:@"旅途" pinyin:@"lǚtú"];
    [self addWordToDBWithEnglish:@"Good bye" chinese:@"再见" pinyin:@"zàijiàn"];
    [self addWordToDBWithEnglish:@"Good journey" chinese:@"一路平安" pinyin:@"yīlùpíng'ān"];
    [self addWordToDBWithEnglish:@"Good humor" chinese:@"心情愉快" pinyin:@"xīngqíngyúkuài"];
    [self addWordToDBWithEnglish:@"Good luck" chinese:@"好运" pinyin:@"hǎoyùn"];
    
    // Lesson 12
    [self addWordToDBWithEnglish:@"Airport bus station" chinese:@"机场大巴" pinyin:@"jīchǎngdàbā"];
    [self addWordToDBWithEnglish:@"Go straight" chinese:@"往前走" pinyin:@"wǎngqiánzǒu"];
    [self addWordToDBWithEnglish:@"Turn left" chinese:@"往左拐" pinyin:@"wǎngzuǒguǎi"];
    [self addWordToDBWithEnglish:@"Parking Lot" chinese:@"停车场" pinyin:@"tíngchēchǎng"];
    
    // Lesson 13
    [self addWordToDBWithEnglish:@"Go" chinese:@"去" pinyin:@"qù"];
    [self addWordToDBWithEnglish:@"Peking" chinese:@"北京" pinyin:@"běijīng"];
    [self addWordToDBWithEnglish:@"University" chinese:@"大学" pinyin:@"dàxué"];
    [self addWordToDBWithEnglish:@"Get off" chinese:@"下车" pinyin:@"xiàchē"];
    [self addWordToDBWithEnglish:@"Tsinghua" chinese:@"清华" pinyin:@"qīnghuá"];
    [self addWordToDBWithEnglish:@"Fudan" chinese:@"复旦" pinyin:@"fùdàn"];
    [self addWordToDBWithEnglish:@"Jinan" chinese:@"暨南" pinyin:@"jìnán"];
    
    // Lesson 14
    [self addWordToDBWithEnglish:@"Which" chinese:@"几" pinyin:@"jǐ"];
    [self addWordToDBWithEnglish:@"Bus" chinese:@"路" pinyin:@"lù"];
    [self addWordToDBWithEnglish:@"And" chinese:@"和" pinyin:@"hé"];
    [self addWordToDBWithEnglish:@"Both" chinese:@"都" pinyin:@"dōu"];
    [self addWordToDBWithEnglish:@"One" chinese:@"一" pinyin:@"yī"];
    [self addWordToDBWithEnglish:@"Two" chinese:@"二" pinyin:@"èr"];
    [self addWordToDBWithEnglish:@"Four" chinese:@"四" pinyin:@"sì"];
    [self addWordToDBWithEnglish:@"Ten" chinese:@"十" pinyin:@"shí"];
    [self addWordToDBWithEnglish:@"Five" chinese:@"五" pinyin:@"wǔ"];
    [self addWordToDBWithEnglish:@"Forbidden City" chinese:@"故宫" pinyin:@"gùgōng"];
    [self addWordToDBWithEnglish:@"Temple of Heaven" chinese:@"天坛" pinyin:@"tiāntán"];
    [self addWordToDBWithEnglish:@"Lama Temple" chinese:@"雍和宫" pinyin:@"yōnghégōng"];
    
    // Lesson 16
    [self addWordToDBWithEnglish:@"Go straight" chinese:@"一直走" pinyin:@"yìzhízǒu"];
    [self addWordToDBWithEnglish:@"Turn right" chinese:@"往右拐" pinyin:@"wǎngyòuguǎi"];
    [self addWordToDBWithEnglish:@"How" chinese:@"怎么走" pinyin:@"zěnmezǒu"];
    
    // Lesson 17
    [self addWordToDBWithEnglish:@"Nearby" chinese:@"附近" pinyin:@"fùjìn"];
    [self addWordToDBWithEnglish:@"Toilet" chinese:@"卫生间" pinyin:@"weìshēngjiān"];
    [self addWordToDBWithEnglish:@"Cybercafe" chinese:@"网吧" pinyin:@"wǎngbā"];
    //[self addWordToDBWithEnglish:@"ATM" chinese:@"自动取款机" pinyin:@"zìdòngqǔkuǎjī"];
    [self addWordToDBWithEnglish:@"Petrol Station" chinese:@"加油站" pinyin:@"jiāyóuzhàn"];
    
    // Lesson 18
    [self addWordToDBWithEnglish:@"Master" chinese:@"师傅" pinyin:@"shīfu"];
    [self addWordToDBWithEnglish:@"How much" chinese:@"多少钱" pinyin:@"duōshaoqián"];
    [self addWordToDBWithEnglish:@"Kuai" chinese:@"块" pinyin:@"kuài"];
    [self addWordToDBWithEnglish:@"Train station" chinese:@"火车站" pinyin:@"huǒchēzhàn"];
    
    // Lesson 19
    [self addWordToDBWithEnglish:@"Yuanmingyuan" chinese:@"圆明园" pinyin:@"yuánmíngyuán"];
    [self addWordToDBWithEnglish:@"The nearest" chinese:@"最近" pinyin:@"zuìjìn"];
    [self addWordToDBWithEnglish:@"Subway station" chinese:@"地铁站" pinyin:@"dìtiězhàn"];
    [self addWordToDBWithEnglish:@"Cinema" chinese:@"电影院" pinyin:@"diànyǐngyuàn"];
    
    // Lesson 20
    [self addWordToDBWithEnglish:@"Here" chinese:@"在这儿" pinyin:@"zàizhèr"];
    [self addWordToDBWithEnglish:@"Stop for a while" chinese:@"听一下" pinyin:@"tíngyíxià"];
    [self addWordToDBWithEnglish:@"Trunk" chinese:@"后备箱" pinyin:@"hòubèixiāng"];
    [self addWordToDBWithEnglish:@"Wait for me" chinese:@"等我" pinyin:@"děngwǒ"];
    [self addWordToDBWithEnglish:@"A while" chinese:@"一会儿" pinyin:@"yíhuìr"];
    [self addWordToDBWithEnglish:@"Give change" chinese:@"找零钱" pinyin:@"zhǎolíngqián"];
    
    // Lesson 21
    [self addWordToDBWithEnglish:@"Single room" chinese:@"单人间" pinyin:@"dānrénjiān"];
    [self addWordToDBWithEnglish:@"Standard room" chinese:@"标准间" pinyin:@"biāozhǔnjiān"];
    [self addWordToDBWithEnglish:@"Suite" chinese:@"套房" pinyin:@"tàofáng"];
    [self addWordToDBWithEnglish:@"Empty" chinese:@"空" pinyin:@"kōng"];
    
    // Lesson 22
    [self addWordToDBWithEnglish:@"Common Room" chinese:@"普通间" pinyin:@"pǔtōngjiān"];
    [self addWordToDBWithEnglish:@"Bed" chinese:@"床位" pinyin:@"chuángwèi"];
    [self addWordToDBWithEnglish:@"Six" chinese:@"六" pinyin:@"liù"];
    [self addWordToDBWithEnglish:@"Three" chinese:@"三" pinyin:@"sān"];
    [self addWordToDBWithEnglish:@"Hundred" chinese:@"百" pinyin:@"bǎi"];
    
    // Lesson 23
    [self addWordToDBWithEnglish:@"Night" chinese:@"晚上" pinyin:@"wǎnshang"];
    [self addWordToDBWithEnglish:@"Two days" chinese:@"两天" pinyin:@"liǎngtiān"];
    [self addWordToDBWithEnglish:@"Week" chinese:@"一个星期" pinyin:@"xīngqí"];
    [self addWordToDBWithEnglish:@"Half a year" chinese:@"半年" pinyin:@"bànnián"];
    
    
    // Lesson 24
    [self addWordToDBWithEnglish:@"Tickets" chinese:@"门票" pinyin:@"ménpiào"];
    [self addWordToDBWithEnglish:@"Clothes" chinese:@"衣服" pinyin:@"yīfú"];
    [self addWordToDBWithEnglish:@"Discount" chinese:@"打折" pinyin:@"dǎzhé"];
    [self addWordToDBWithEnglish:@"20%% off" chinese:@"打八折" pinyin:@"dǎbāzhé"];
    [self addWordToDBWithEnglish:@"How much is the discount ?" chinese:@"打几折" pinyin:@"dǎjǐzhé"];
    
    // Lesson 25
    [self addWordToDBWithEnglish:@"Try" chinese:@"试试" pinyin:@"shìshi"];
    [self addWordToDBWithEnglish:@"Hot water" chinese:@"热水" pinyin:@"rèshuǐ"];
    [self addWordToDBWithEnglish:@"Music" chinese:@"音乐" pinyin:@"yīnyuè"];
    [self addWordToDBWithEnglish:@"Rest" chinese:@"休息" pinyin:@"xiūxí"];
    [self addWordToDBWithEnglish:@"Now" chinese:@"先" pinyin:@"xiān"];
    [self addWordToDBWithEnglish:@"Have a look" chinese:@"看看" pinyin:@"kànkan"];
    
    // Lesson 26
    [self addWordToDBWithEnglish:@"Ticket" chinese:@"车票" pinyin:@"chēpiào"];
    [self addWordToDBWithEnglish:@"Seat" chinese:@"座位" pinyin:@"zuòwèi"];
    [self addWordToDBWithEnglish:@"Feast" chinese:@"酒席" pinyin:@"jiǔxí"];
    [self addWordToDBWithEnglish:@"Reserve" chinese:@"预订" pinyin:@"yùdìng"];
    [self addWordToDBWithEnglish:@"Room" chinese:@"房间" pinyin:@"fángjiān"];
    [self addWordToDBWithEnglish:@"Just a minute" chinese:@"稍等" pinyin:@"shāoděng"];
    [self addWordToDBWithEnglish:@"Three days ago" chinese:@"三天前" pinyin:@"sāntiānqián"];
    
    // Lesson 27
    [self addWordToDBWithEnglish:@"Fill in a form" chinese:@"填表" pinyin:@"tiánbiǎo"];
    [self addWordToDBWithEnglish:@"Signature" chinese:@"签字" pinyin:@"qiānzì"];
    [self addWordToDBWithEnglish:@"Invoicing" chinese:@"开发票" pinyin:@"kāifāpiào"];
    [self addWordToDBWithEnglish:@"Place a deposit" chinese:@"交押金" pinyin:@"jiāoyājīn"];
    
    // Lesson 28
    [self addWordToDBWithEnglish:@"Hold on to" chinese:@"収￼好" pinyin:@"shōuhǎo"];
    [self addWordToDBWithEnglish:@"Deposit" chinese:@"押金" pinyin:@"yājīn"];
    [self addWordToDBWithEnglish:@"Receipt" chinese:@"收据" pinyin:@"shōujū"];
    
    // Lesson 29
    [self addWordToDBWithEnglish:@"Make a phone call" chinese:@"打电话" pinyin:@"dǎdiànhuà"];
    [self addWordToDBWithEnglish:@"Internet" chinese:@"上网" pinyin:@"shàngwǎng"];
    [self addWordToDBWithEnglish:@"Wash" chinese:@"洗" pinyin:@"xǐ"];
    [self addWordToDBWithEnglish:@"Check out" chinese:@"退房" pinyin:@"tuìfáng"];
    [self addWordToDBWithEnglish:@"Check" chinese:@"查房" pinyin:@"cháfáng"];
    
    // Lesson 30 
    [self addWordToDBWithEnglish:@"International" chinese:@"国际" pinyin:@"guójì"];
    [self addWordToDBWithEnglish:@"Play" chinese:@"能打" pinyin:@"néngdǎ"];
    [self addWordToDBWithEnglish:@"Smoking" chinese:@"抽烟" pinyin:@"chōuyān"];
    
    //
    [self addWordToDBWithEnglish:@"Gate" chinese:@"门口" pinyin:@"ménkǒu"];

    //[self addWordToDBWithEnglish:@"" chinese:@"" pinyin:@""];
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
        [self loadDefaultDatabase];
    }
    else
    {
        NSLog(@"The database is not empty.");
    }
}

- (void)checkUser
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *myDB = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (![myDB count])
    {
        NSLog(@"LOADING DEFAULT USER");
        
        User *user = [NSEntityDescription insertNewObjectForEntityForName:@"User"
                                                   inManagedObjectContext:self.managedObjectContext];
        
        [user setName:@"Default"];
        [self.managedObjectContext save:nil];
    }
    else
    {
        NSLog(@"USER EXIST.");
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Background.png"]]];
    [self checkDatabase];
    [self checkUser];
}

- (void)viewDidUnload
{
    [self setDico:nil];
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
    else if ([segue.identifier isEqualToString:@"PushHighscore"])
    {
        LearningChineseHighScoreViewController *scores = segue.destinationViewController;
        scores.managedObjectContext = self.managedObjectContext;        
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
    else if ([segue.identifier isEqualToString:@"PushGameThree"])
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
        NSComparisonResult order = [[UIDevice currentDevice].systemVersion compare: @"5.1" options: NSNumericSearch];
        if (order == NSOrderedSame || order == NSOrderedDescending) {
            // OS version >= 5.1
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Chinese keyboard not activated" message:@"You need to activate the 'Chinese-Simplified (Handwriting)' keyboard to Go to General > Settings > Keyboard > International Keyboards." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
        } else {
            // OS version < 5.1
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Chinese keyboard not activated" message:@"You need to activate the 'Chinese-Simplified (Handwriting)' keyboard to play this game. Would you like to activate this keyboard ?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes",nil];
            [alert show];
        }
    }
    else
    {
        [self performSegueWithIdentifier:@"PushGameTwo" sender:sender];
    }
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    [super viewWillAppear:animated];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

@end
