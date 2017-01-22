//
//  Chip.h
//  OfflineGame
//
//  Created by Nisarg Mehta on 1/7/17.
//  Copyright © 2017 Open Source. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ChipValue)
{
    ChipValueOne,
    ChipValueFive,
    ChipValueTen,
    ChipValueTwentyFive,
    ChipValueHundred
};

@interface Chip : NSObject

@property (nonatomic, assign) ChipValue value;
@property (nonatomic, readonly) NSNumber *chipWorth;

- (instancetype)initWithValue:(ChipValue)value;
- (NSComparisonResult)compare:(Chip *)other;

// color for value

@end
