//
//  Deck.h
//  OfflineGame
//
//  Created by Nisarg Mehta on 1/7/17.
//  Copyright © 2017 Open Source. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Card;

@interface Deck : NSObject

@property (nonatomic, strong) NSMutableArray *cards;
@property (readonly) BOOL isEmpty;

- (void)shuffle;

- (Card *)drawCard;

@end
