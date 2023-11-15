//
//  Items.h
//  RaptorsTicketApp
//
//  Created by user248645 on 9/28/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Items : NSObject

@property(nonatomic)NSString   *title;

@property(nonatomic)int   qnt;

@property(nonatomic)float   value;

- (instancetype)initWithItems:(NSString *)title andValue:(float) value andQnt:(int)qnt;


@end

NS_ASSUME_NONNULL_END
