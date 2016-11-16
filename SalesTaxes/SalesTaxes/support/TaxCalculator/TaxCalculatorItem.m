//
//  TaxCalculatorItem.m
//  SalesTaxes
//
//  Created by William Izzo on 15/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import "TaxCalculatorItem.h"

@implementation TaxCalculatorItem
- (instancetype)initWithPrice:(NSDecimalNumber*)price
                andProperties:(TaxCalculatorItemProperties*)properties {
    self = [super init];
    self->_price = [price copy];
    self->_properties = [NSArray arrayWithArray:properties];
    return self;
}
@end