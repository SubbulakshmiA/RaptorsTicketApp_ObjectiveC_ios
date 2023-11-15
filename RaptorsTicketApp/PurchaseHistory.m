//
//  PurchaseHistory.m
//  RaptorsTicketApp
//
//  Created by user243757 on 9/29/23.
//

#import "PurchaseHistory.h"

@implementation PurchaseHistory

- (instancetype)initWithPurchaseItems:(NSString *)title andTotalCost:(float) totalCost andQnt:(int)qnt andDate :(NSDate *)dateOfPurchase{
    self = [super init];
    
       
    if (self) {
        self.title=title;
        self.totalCost= totalCost;
        self.qnt=qnt;
        self.dateOfPurchase = dateOfPurchase;
        
    
    }
     return self;
}


@end
