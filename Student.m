//
//  Student.m
//  BitwiseOperations
//
//  Created by EnzoF on 19.08.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "Student.h"

static NSString *firstNames[] = {
    @"Милена",
    @"Инна",
    @"Богдан",
    @"Анатолий",
    @"Тимофей",
    @"Родион",
    @"Альбина",
    @"Семён",
    @"Глеб",
    @"Вячеслав",
    @"Алла",
    @"Василиса",
    @"Анжелика",
    @"Марат",
    @"Владислав",
    @"Ярослав",
    @"Маргарита",
    @"Матвей",
    @"Тимур",
    @"Виталий",
    @"Степан"
};
static int firstNameCount = 21;


@implementation Student



#pragma  mark -Initialization-

- (instancetype)init{
    self = [super init];
    if(self)
    {
        self.firstName = firstNames[arc4random() % firstNameCount];
    }
    return self;
}



#pragma  mark -Metods-
- (NSString*)answerType:(StudentSubjectType) type{
    return self.subjectType & type ? @"yes" : @"no";
}
- (NSString*) description {
    return [NSString stringWithFormat:@"\nStudent %@ studies:\n"
                                        "Math = %@\n"
                                        "Geography = %@\n"
                                        "Literature = %@\n"
                                        "History = %@\n"
                                        "Biology = %@\n"
                                        "Physics = %@\n"
                                        "Philosophy = %@\n"
                                        "Programming = %@\n"
                                        "Art = %@\n"
                                        "Geometry = %@\n"
                                        "Economy = %@\n",
                                        self.firstName,
                                        [self answerType:StudentSubjectMath],
                                        [self answerType:StudentSubjectGeography],
                                        [self answerType:StudentSubjectLiterature],
                                        [self answerType:StudentSubjectHistory],
                                        [self answerType:StudentSubjectBiology],
                                        [self answerType:StudentSubjectPhysics],
                                        [self answerType:StudentSubjectPhilosophy],
                                        [self answerType:StudentSubjectProgramming],
                                        [self answerType:StudentSubjectArt],
                                        [self answerType:StudentSubjectGeometry],
                                        [self answerType:StudentSubjectEconomy]
                                                        ];
}

@end
