//
//  Store.h
//  RaptorsTicketApp
//
//  Created by user248645 on 9/28/23.
//

#import <Foundation/Foundation.h>
#import "History.h"

NS_ASSUME_NONNULL_BEGIN

@interface Store : NSObject

@property (nonatomic) bool checkQnt;
@property (nonatomic) History *purchasedItems;
@property (nonatomic,strong) NSDate* dateOfPurchase;
@property (nonatomic) NSMutableArray * purchasedItemsList;

-(void) addingIntoPurchaseHistory :(int)rowSelected withQuantity:(int)quantity;
-(void)updateQnt :(int)rowSelected : (int)quantity;
-(NSString *)accessHistoryItemTitle :(int)rowSelected;
-(int)accessHistoryItemQnt :(int)rowSelected;
-(int)numOfRowsInPurchaseHistoryList;
-(double)totalCost:(int) rowSelected :(int)quantity;
-(NSString *)titleForTheSelectedRow :(int)row ;
-(NSString *)titleToDisplayInLable :(int)row ;

-(double)accessHistoryItemCost :(int)rowSelected;
-(NSDate*)accessHistoryItemDate :(int)rowSelected;
-(void)resetInventoryAmount :(double)value :(int)rowSelected;
-(void)resetInventoryQuantity :(int)qnt :(int)rowSelected;
@end

NS_ASSUME_NONNULL_END
