//
//  Store.m
//  RaptorsTicketApp
//
//  Created by user248645 on 9/28/23.
//

#import "Store.h"
# import "Items.h"
#import "History.h"

@interface Store()
@property(nonatomic) NSMutableArray *inventory;

@end

@implementation Store

-(NSMutableArray *) inventory{
    if(_inventory==nil)
    {
        _inventory= [[NSMutableArray alloc]initWithObjects:
                     [[Items alloc]initWithItems:@"Balcony level ticket " andValue:1170 andQnt:12],
                     [[Items alloc]initWithItems:@"Lower  level ticket " andValue:10434 andQnt:20],
                     [[Items alloc]initWithItems:@"CourtSide  ticket " andValue:27777 andQnt:15],nil];
        
    }
    return _inventory;
}
-(NSMutableArray *)purchasedItemsList{
    if(_purchasedItemsList == nil){
        _purchasedItemsList = [[NSMutableArray alloc]init];
    }
    return _purchasedItemsList;
}

//
-(History *)purchasedItems{
    if(_purchasedItems == nil){
        _purchasedItems = [[History alloc]init];
    }
    return _purchasedItems;
}

-(double)totalCost:(int) rowSelected : (int)quantity{
    double tc = 0.0;
      Items *itemObj = [self.inventory objectAtIndex:rowSelected];
    tc = ((itemObj.value))*quantity;

    return tc;
}
-(NSString *)titleForTheSelectedRow :(int)row {
    Items *itemObj = [self.inventory objectAtIndex:row];
     
     return [NSString stringWithFormat:@"%@ qnt:%d value:%.2f$",itemObj.title,itemObj.qnt,itemObj.value];
}
-(NSString *)titleToDisplayInLable :(int)row {
    Items *itemObj = [self.inventory objectAtIndex:row];
     
     return [NSString stringWithFormat:@"%@",itemObj.title];
}

-(void)updateQnt :(int)rowSelected : (int)quantity{
    Items *itemObj = [self.inventory objectAtIndex:rowSelected];
    if(itemObj.qnt >= quantity){
        itemObj.qnt = itemObj.qnt - quantity;
        self.checkQnt = YES;
        
    }else{
        //        itemObj.qnt = itemObj.qnt;
        self.checkQnt = NO;
    }
}
    
-(void)addingIntoPurchaseHistory :(int)rowSelected withQuantity:(int)quantity{

    NSDate *currentDate = [NSDate date];
    
    Items *itemObj = [self.inventory objectAtIndex:rowSelected];
    double tc = [self totalCost:(int)rowSelected :(int)quantity];
    History *purchaseObj = [[History alloc]initWithPurchaseItems:(itemObj.title) andTotalCost:tc andQnt:quantity andDate:currentDate];
    [self.purchasedItemsList addObject:purchaseObj];
    
    NSLog(@"purchase hist %@  %.2f %d" ,purchaseObj.title,purchaseObj.value,purchaseObj.qnt);
    NSLog(@"purchasedItemsList count %d", (int)self.purchasedItemsList.count);
    }

-(NSString *)accessHistoryItemTitle :(int)rowSelected{
    History *purchaseObj =  [self.purchasedItemsList objectAtIndex:rowSelected];
    return purchaseObj.title;
    
}
-(int)accessHistoryItemQnt :(int)rowSelected{
    History *purchaseObj =  [self.purchasedItemsList objectAtIndex:rowSelected];
    return purchaseObj.qnt;
    
}
-(double)accessHistoryItemCost :(int)rowSelected{
    History *purchaseObj =  [self.purchasedItemsList objectAtIndex:rowSelected];
    return purchaseObj.value;
    
}
-(NSDate*)accessHistoryItemDate :(int)rowSelected{
    History *purchaseObj =  [self.purchasedItemsList objectAtIndex:rowSelected];
    return purchaseObj.dateOfPurchase ;
    
}
-(int)numOfRowsInPurchaseHistoryList{
    int n = (int) self.purchasedItemsList.count ;
    NSLog(@"nn in store %d",n);
    return  n;
}

-(void)resetInventoryQuantity :(int)qnt :(int)rowSelected{
    Items *itemObj = [self.inventory objectAtIndex:rowSelected];
    itemObj.qnt = qnt;
    
}
-(void)resetInventoryAmount :(double)value :(int)rowSelected{
    Items *itemObj = [self.inventory objectAtIndex:rowSelected];
    itemObj.value = value;
    
}


@end
