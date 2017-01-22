//
//  TexasHoldemDealer.m
//  OfflineGame
//
//  Created by Nisarg Mehta on 1/7/17.
//  Copyright © 2017 Open Source. All rights reserved.
//

#import "TexasHoldemDealer.h"
#import "Hand.h"
#import "Deck.h"
#import "TexasHoldemPlayer.h"

@interface TexasHoldemDealer ()

@end

@implementation TexasHoldemDealer

- (instancetype)init {
    self = [super init];
    if (self) {
        _board = [[Hand alloc] init];
        Deck *deck = [[Deck alloc] init];
        [deck shuffle]; // shuffle before using the deck
        _deck = deck;
    }
    return self;
}

-(void)flop {
    [self burnCardAndAddToBoard:3];
}

-(void)turn {
    [self burnCardAndAddToBoard:1];
}

-(void)river {
    [self burnCardAndAddToBoard:1];
}

-(void)burnCardAndAddToBoard:(NSInteger)cardsToAdd {
    [self.deck drawCard]; // burn card
    [self.board drawCards:cardsToAdd fromDeck:self.deck];
}

-(void)dealToPlayers:(NSArray *)players {
    for (TexasHoldemPlayer *player in players) {
        Hand *private = [[Hand alloc] init];
        [private drawCards:2 fromDeck:self.deck];
        player.privateHand = private;
    }
}

@end
