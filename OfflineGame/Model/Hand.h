//
//  Hand.h
//  OfflineGame
//
//  Created by Nisarg Mehta on 1/7/17.
//  Copyright © 2017 Open Source. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Deck;

@interface Hand : NSObject

@property (nonatomic, strong) NSMutableArray *cards;

- (instancetype)initWithCards:(NSArray *)cards;

// returns number of cards that were drawn
- (NSUInteger)drawCards:(NSUInteger)numCards
               fromDeck:(Deck *)deck;

@end
