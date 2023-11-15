//
//  PurchaseHistory.h
//  RaptorsTicketApp
//
//  Created by user243757 on 9/29/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PurchaseHistory : NSObject


@property(nonatomic)NSString   *title;

@property(nonatomic)int   qnt;

@property(nonatomic)float   totalCost;

@property (nonatomic,strong) NSDate *dateOfPurchase;

- (instancetype)initWithPurchaseItems:(NSString *)title andTotalCost:(float) totalCost andQnt:(int)qnt andDate :(NSDate *)dateOfPurchase;

@end

NS_ASSUME_NONNULL_END
