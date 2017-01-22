//
//  BetPot.h
//  OfflineGame
//
//  Created by Nisarg Mehta on 1/7/17.
//  Copyright © 2017 Open Source. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Chip;

@interface BetPot : NSObject

@property (nonatomic, strong) NSMutableArray *chips;
@property (readonly) BOOL isEmpty;

- (NSNumber*)totalValue;

@end
