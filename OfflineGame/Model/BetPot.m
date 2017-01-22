//
//  BetPot.m
//  OfflineGame
//
//  Created by Nisarg Mehta on 1/7/17.
//  Copyright © 2017 Open Source. All rights reserved.
//

#import "BetPot.h"
#import "Chip.h"

@implementation BetPot

-(NSNumber *)totalValue {
    NSInteger total = 0;
    for(Chip *ch in self.chips) {
        total += [ch.chipWorth integerValue];
    }
    return @(total);
}

@end
