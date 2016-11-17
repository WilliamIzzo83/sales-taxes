//
//  Receipt.h
//  SalesTaxes
//
//  Created by William Izzo on 17/11/16.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReceiptItem.h"

typedef NSArray<ReceiptItem*> ReceiptItemsArray;
/**
 * A receipt built by ReceiptGenerator.
 * It holds an entry for each item, plus an entry with the receipt total.
 */
@interface Receipt : NSObject
- (instancetype)initWithReceiptItems:(ReceiptItemsArray*)items
                            andTotal:(ReceiptItem*)total;
@property (readonly, nonatomic) ReceiptItemsArray* items;
@property (readonly, nonatomic) ReceiptItem* total;
@end
