

#import "RoundedViewWithStroke.h"

@implementation RoundedViewWithStroke

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code

	self.layer.cornerRadius = self.cornerRadius;
	self.clipsToBounds = YES;
	self.layer.borderWidth = 0.1;
//	self.layer.borderColor = [[UIColor colorWithWhite:1.0 alpha:0.2] CGColor];

}



@end
