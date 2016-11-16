//
//  TaxCalculator.m
//  SalesTaxes
//
//  Created by William Izzo on 15/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import "TaxCalculator.h"

@interface TaxCalculator()
@property (strong, nonatomic) TaxCalculatorRules* rules;
@end

@implementation TaxCalculator
- (instancetype)initWithRules:(TaxCalculatorRules *)rules {
    self = [super init];
    self->_rules = [TaxCalculatorRules arrayWithArray:rules];
    return self;
}

- (TaxCalculatorResult*)computeTaxesOnItem:(TaxCalculatorItem *)item {
    
    
    __block NSDecimalNumber* totalTaxesAmount = [NSDecimalNumber zero];
    
    // A rule is applicable if item properties contains rule identifier.
    [self.rules enumerateObjectsUsingBlock:^(ApplicableTaxRule * _Nonnull obj,
                                             NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (![item.properties containsObject:obj.identifier]) {
            return;
        }
        
        NSDecimalNumber* taxAmount = [obj applicableTaxToPrice:item.price];
        
        totalTaxesAmount = [taxAmount decimalNumberByAdding:totalTaxesAmount];
    }];
    
    
    NSDecimalNumber *taxedPrice = [totalTaxesAmount
                                   decimalNumberByAdding:item.price];
    
    return [[TaxCalculatorResult alloc] initWithOriginalPrice:item.price
                                                   taxedPrice:taxedPrice
                                                  taxesAmount:totalTaxesAmount];
}
@end
