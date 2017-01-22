//
//  Chip.m
//  OfflineGame
//
//  Created by Nisarg Mehta on 1/7/17.
//  Copyright © 2017 Open Source. All rights reserved.
//

#import "Chip.h"

@implementation Chip

- (instancetype)init {
    return [self initWithValue:ChipValueOne];
}

- (instancetype)initWithValue:(ChipValue)value {
    self = [super init];
    if (self) {
        self.value = value;
    }
    return self;
}

- (NSComparisonResult)compare:(Chip *)other {
    return [@(self.value) compare:@(other.value)];
}

-(NSNumber *)chipWorth {
    switch (self.value) {
        case ChipValueOne:
            return @1;
            break;
        case ChipValueFive:
            return @5;
            break;
        case ChipValueTen:
            return @10;
            break;
        case ChipValueTwentyFive:
            return @25;
            break;
        case ChipValueHundred:
            return @100;
            break;
        default:
            break;
    }
}

@end
