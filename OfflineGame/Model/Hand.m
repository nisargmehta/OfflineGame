//
//  Hand.m
//  OfflineGame
//
//  Created by Nisarg Mehta on 1/7/17.
//  Copyright © 2017 Open Source. All rights reserved.
//

#import "Hand.h"
#import "Deck.h"

@implementation Hand

- (instancetype)init {
  return [self initWithCards:@[]];
}

- (instancetype)initWithCards:(NSArray *)cards {
  self = [super init];
  if (self) {
    self.cards = [cards mutableCopy];
  }
  return self;
}

- (NSUInteger)drawCards:(NSUInteger)numCards
               fromDeck:(Deck *)deck
{
  NSUInteger numDrawn = 0;
  while (!deck.isEmpty && numDrawn < numCards) {
    [self.cards addObject:[deck drawCard]];
    numDrawn++;
  }
  return numDrawn;
}

- (NSString *)description {
  return [self.cards componentsJoinedByString:@", "];
}

- (BOOL)isEqual:(id)object {
  if (![object isKindOfClass:[Hand class]]) {
    return NO;
  }
  Hand *other = (Hand *)object;
  if (self.cards.count != other.cards.count) {
    return NO;
  }
  for (int i = 0; i < self.cards.count; i++) {
    if (![self.cards[i] isEqual:other.cards[i]]) {
      return NO;
    }
  }
  return YES;
}

@end
