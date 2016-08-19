//
//  Student.h
//  BitwiseOperations
//
//  Created by EnzoF on 19.08.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    StudentSubjectMath            = 1 <<  0,
    StudentSubjectGeography       = 1 <<  1,
    StudentSubjectLiterature      = 1 <<  2,
    StudentSubjectHistory         = 1 <<  3,
    StudentSubjectBiology         = 1 <<  4,
    StudentSubjectPhysics         = 1 <<  5,
    StudentSubjectPhilosophy      = 1 <<  6,
    StudentSubjectProgramming     = 1 <<  7,
    StudentSubjectArt             = 1 <<  8,
    StudentSubjectGeometry        = 1 <<  9,
    StudentSubjectEconomy         = 1 <<  10
}StudentSubjectType;

@interface Student : NSObject
@property (nonatomic, assign) StudentSubjectType subjectType;
@property (nonatomic, strong) NSString *firstName;

- (NSString*) description;

@end
