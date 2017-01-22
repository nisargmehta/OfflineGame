//
//  TexasHoldemDealer.h
//  OfflineGame
//
//  Created by Nisarg Mehta on 1/7/17.
//  Copyright © 2017 Open Source. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Deck, Hand;

@interface TexasHoldemDealer : NSObject

@property (readonly) Deck *deck;
@property (readonly) Hand *board;

- (void)dealToPlayers:(NSArray *)players;

- (void)flop;
- (void)turn;
- (void)river;

@end
