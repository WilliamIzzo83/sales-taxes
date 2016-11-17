//
//  Receipt.m
//  SalesTaxes
//
//  Created by William Izzo on 17/11/16.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import "Receipt.h"

@interface Receipt() {
    ReceiptItemsArray* items_;
}
@end

@implementation Receipt
@dynamic items;

- (instancetype)initWithReceiptItems:(ReceiptItemsArray*)items
                            andTotal:(ReceiptItem *)total{
    self = [super init];
    self->items_ = [[ReceiptItemsArray alloc] initWithArray:items copyItems:YES];
    self->_total = [total copy];
    return self;
}

- (ReceiptItemsArray*)items {
    return [[ReceiptItemsArray alloc] initWithArray:self->items_ copyItems:YES];
}

- (NSString*)description {
    NSArray* all = [self->items_ arrayByAddingObject:self->_total];
    return [all description];
}
@end
