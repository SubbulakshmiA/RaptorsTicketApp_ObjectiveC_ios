//
//  History.h
//  RaptorsTicketApp
//
//  Created by user243757 on 9/29/23.
//

#import "Items.h"

NS_ASSUME_NONNULL_BEGIN

@interface History : Items
@property (nonatomic) NSDate *dateOfPurchase;
- (instancetype)initWithPurchaseItems:(NSString *)title andTotalCost:(float) totalCost andQnt:(int)qnt andDate :(NSDate *)dateOfPurchase;

@end

NS_ASSUME_NONNULL_END
