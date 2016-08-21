//
//  AppDelegate.m
//  BitwiseOperations
//
//  Created by EnzoF on 19.08.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "Student.h"

@interface AppDelegate ()

@property (nonatomic, strong) NSMutableArray *mArrayStudents;
@property (nonatomic, strong) NSMutableArray *mArrayGumStudents;
@property (nonatomic, strong) NSMutableArray *mArrayTechStudents;
@property (nonatomic, assign) NSInteger quantityProgrammers;


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor cyanColor];
    [self.window makeKeyAndVisible];
    
    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = navC;
    
    
    for (int allObj = 0; allObj < 10; allObj++)
    {
        Student *studentObj = [[Student alloc] init];
        studentObj.subjectType =    [self randomStudentSubjectType:StudentSubjectMath]       |
                                    [self randomStudentSubjectType:StudentSubjectGeography]  |
                                    [self randomStudentSubjectType:StudentSubjectLiterature] |
                                    [self randomStudentSubjectType:StudentSubjectHistory]    |
                                    [self randomStudentSubjectType:StudentSubjectPhysics]    |
                                    [self randomStudentSubjectType:StudentSubjectBiology]    |
                                    [self randomStudentSubjectType:StudentSubjectPhilosophy] |
                                    [self randomStudentSubjectType:StudentSubjectProgramming]|
                                    [self randomStudentSubjectType:StudentSubjectArt]        |
                                    [self randomStudentSubjectType:StudentSubjectGeometry]   |
                                    [self randomStudentSubjectType:StudentSubjectEconomy];
        
        [self.mArrayStudents addObject:studentObj];
        NSLog(@"%@",[studentObj description]);
    
    }
    
    
    for (Student *currentStudObj in self.mArrayStudents)
    {
        int tech = 337; //0101010001;
        int gum = 558;  //1010101110;
        if(currentStudObj.subjectType & StudentSubjectProgramming)
        {
            self.quantityProgrammers++;
        }
        if((currentStudObj.subjectType & tech) > (currentStudObj.subjectType & gum))
        {
            [self.mArrayTechStudents addObject: currentStudObj];
        }
        else
        {
            [self.mArrayGumStudents addObject: currentStudObj];
        }
    }
    NSLog(@"Студенты-технари:\n");
    for (Student *currentTechStudent in self.mArrayTechStudents) {
        NSLog(@"%@\n",currentTechStudent.firstName);
    }
    
    NSLog(@"Студенты-гумманитарии:\n");
    for (Student *currentGumStudent in self.mArrayGumStudents) {
        NSLog(@"%@\n",currentGumStudent.firstName);
    }
    
    NSLog(@"Кол-во студентов-программистов:%lu",self.quantityProgrammers);
    
    
    
    for (Student *currentStudentObj in self.mArrayStudents)
    {
        if(currentStudentObj.subjectType & StudentSubjectBiology)
        {
            currentStudentObj.subjectType =  currentStudentObj.subjectType & 2031; //11111101111
            NSLog(@"У студента %@ отменили уроки биологии",currentStudentObj.firstName);
        }
    }
    NSInteger randomNumber = arc4random();
    NSLog(@"Число %lu в двоичной системе исчисления:%@", randomNumber,[self bitwiseStringOfNumber:randomNumber]);
    
    return YES;
}

#pragma mark -Metods-
-(StudentSubjectType)randomStudentSubjectType:(StudentSubjectType)type{

    return arc4random() % 2 ? type : 0;
}

#pragma mark -Initialization-
- (NSMutableArray*)mArrayStudents{
    if(!_mArrayStudents)
    {
        _mArrayStudents = [[NSMutableArray alloc] init];
    }
    return _mArrayStudents;
}

- (NSMutableArray*)mArrayGumStudents{
    if(!_mArrayGumStudents)
    {
        _mArrayGumStudents = [[NSMutableArray alloc] init];
    }
    return _mArrayGumStudents;
}
- (NSMutableArray*)mArrayTechStudents{
    if(!_mArrayTechStudents)
    {
        _mArrayTechStudents = [[NSMutableArray alloc] init];
    }
    return _mArrayTechStudents;
}



- (NSString*)bitwiseStringOfNumber:(NSInteger)number{
    NSMutableString *mBitwiseString;
//    NSInteger currentNumber;
//    currentNumber = number;
    while(number >= 1)
    {
        if(!mBitwiseString)
        {
            mBitwiseString = [[NSMutableString alloc] init];
        }
        if(number % 2)
        {
          [mBitwiseString insertString:@"1" atIndex:0];
        }
        else
        {
          [mBitwiseString insertString:@"0" atIndex:0];
        }
        number = number/2;
    }
    
    NSString *bitwiseString = [[NSString alloc] initWithString:mBitwiseString];
    return bitwiseString;
}

@end
