//
//  TaxCalculatorResult.m
//  SalesTaxes
//
//  Created by William Izzo on 15/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import "TaxCalculatorResult.h"

@implementation TaxCalculatorResult
- (instancetype)initWithOriginalPrice:(NSDecimalNumber *)originalPrice
                           taxedPrice:(NSDecimalNumber *)taxedPrice
                          taxesAmount:(NSDecimalNumber *)taxesAmount {
    self = [super init];
    self->_originalPrice = [originalPrice copy];
    self->_taxedPrice = [taxedPrice copy];
    self->_taxesAmount = [taxesAmount copy];
    return self;
}

- (BOOL)isEqual:(id)object {
    if (![object isKindOfClass:[TaxCalculatorResult class]]) {
        return NO;
    }
    
    TaxCalculatorResult* other = (TaxCalculatorResult*)other;
    
    return [self.originalPrice isEqual:other.originalPrice] &&
    [self.taxedPrice isEqual:other.taxedPrice] &&
    [self.taxesAmount isEqual:other.taxesAmount];
}
@end
