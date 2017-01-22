

#import "RoundedButtonWithStroke.h"

@implementation RoundedButtonWithStroke

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.borderWidth = 0.1f;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
	// Drawing code

	self.layer.cornerRadius = self.cornerRadius;
	self.clipsToBounds = YES;
	self.layer.borderWidth = self.borderWidth;
}

-(void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
//	if (highlighted) {
//
//		[UIView animateWithDuration:0.2 animations:^{
//
//			//[self setBackgroundColor:[UIColor colorWithRed:27.0/255.0 green:27.0/255.0 blue:27.0/255.0 alpha:1.0]];
//
//		}];
//
//
//	} else {
//
//		[UIView animateWithDuration:0.2 animations:^{
//
//			//[self setBackgroundColor:[UIColor colorWithRed:27.0/255.0 green:27.0/255.0 blue:27.0/255.0 alpha:0.8]];
//
//		}];
//
//	}
}


@end
