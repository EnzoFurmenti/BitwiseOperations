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
    // Override point for customization after application launch.
    return YES;
}

#pragma mark -Metods-
-(StudentSubjectType)randomStudentSubjectType:(StudentSubjectType)type{

    return arc4random() % 2 ? type : 0;
}

@end
