//
//  ReceiptItem.m
//  SalesTaxes
//
//  Created by William Izzo on 17/11/16.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import "ReceiptItem.h"

@implementation ReceiptItem
- (instancetype)initWithSummary:(NSString*)summary
               priceBeforeTaxes:(NSDecimalNumber*)priceBeforeTaxes
                priceAfterTaxes:(NSDecimalNumber*)priceAfterTaxes
                    taxesAmount:(NSDecimalNumber*)taxesAmount {
    self = [super init];
    self->_summary = [summary copy];
    self->_priceBeforeTaxes = [priceBeforeTaxes copy];
    self->_priceAfterTaxes = [priceAfterTaxes copy];
    self->_taxesAmount = [taxesAmount copy];
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    return [[ReceiptItem alloc] initWithSummary:_summary
                               priceBeforeTaxes:_priceBeforeTaxes
                                priceAfterTaxes:_priceAfterTaxes
                                    taxesAmount:_taxesAmount];
}

- (NSString*)description {
    return [NSString stringWithFormat:@"rcpt-item: %@, %@, %@, %@",
            self->_summary,
            self->_priceBeforeTaxes,
            self->_priceAfterTaxes,
            self->_taxesAmount];
}
@end
