//
//  Items.m
//  RaptorsTicketApp
//
//  Created by user248645 on 9/28/23.
//

#import "Items.h"

@implementation Items


- (instancetype)initWithItems:(NSString *)title andValue:(float) value andQnt:(int)qnt
{
    self = [super init];
    if (self) {
        self.title=title;
        self.value= value;
        self.qnt=qnt;
        
    }
    
    
    return self;
}


@end
