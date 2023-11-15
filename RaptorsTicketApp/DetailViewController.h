//
//  DetailViewController.h
//  RaptorsTicketApp
//
//  Created by user243757 on 9/30/23.
//

#import <UIKit/UIKit.h>
#import "Store.h"
NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController
@property (nonatomic) Store *detailStoreObj;
@property (nonatomic) int rowSelected;

@end

NS_ASSUME_NONNULL_END
