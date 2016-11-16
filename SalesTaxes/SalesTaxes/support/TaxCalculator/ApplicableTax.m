//
//  ApplicableTax.m
//  SalesTaxes
//
//  Created by William Izzo on 16/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import "ApplicableTax.h"

@interface ApplicableTax()
- (ApplicableTaxRule*)suitableTaxRuleForItem:(TaxCalculatorItem*)item;
@end

@implementation ApplicableTax
- (instancetype)initWithIdentifier:(NSString*)identifier
                       andTaxRules:(TaxCalculatorRules*)rules {
    self = [super init];
    self->_identifier = [identifier copy];
    self->_rules = [NSArray arrayWithArray:rules];
    return self;
}

- (ApplicableTaxRule*)suitableTaxRuleForItem:(TaxCalculatorItem*)item {
    NSArray* itemProperties = item.properties;
    __block ApplicableTaxRule* rule = nil;
    
    [self.rules enumerateObjectsUsingBlock:^(ApplicableTaxRule * _Nonnull obj,
                                             NSUInteger idx,
                                             BOOL * _Nonnull stop) {
        if ([itemProperties containsObject:obj.identifier]) {
            rule = obj;
            *stop = YES;
        }
    }];
    
    if (rule != nil) {
        return rule;
    }
    
    return self.rules.firstObject;
}

- (NSDecimalNumber*)applicableTaxAmountForItem:(TaxCalculatorItem*)item {
    ApplicableTaxRule* rule = [self suitableTaxRuleForItem:item];
    if (rule == nil) {
        return [NSDecimalNumber zero];
    }
    
    return [rule applicableTaxToPrice:item.price];
}
@end
