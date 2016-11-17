//
//  TaxCalculator.m
//  SalesTaxes
//
//  Created by William Izzo on 15/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import "TaxCalculator.h"
#import "TaxCalculatorUtils.h"


@interface TaxCalculator()


@property (strong, nonatomic) TaxCalculatorApplicableTaxes* applicableTaxes;
@end

@implementation TaxCalculator

- (instancetype)init {
    self = [self initWithApplicableTaxes:(TaxCalculatorApplicableTaxes*)@[]];
    return self;
}

- (instancetype)initWithApplicableTaxes:(TaxCalculatorApplicableTaxes*)applicableTaxes {
    self = [super init];
    self->_applicableTaxes = [TaxCalculatorApplicableTaxes
                              arrayWithArray:applicableTaxes];
    return self;
}



- (TaxCalculatorResult*)computeTaxesOnItem:(TaxCalculatorItem *)item {
    
    
    __block NSDecimalNumber* totalTaxesAmount = [NSDecimalNumber zero];
    
    
    [self.applicableTaxes enumerateObjectsUsingBlock:
     ^(ApplicableTax * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
         NSDecimalNumber* taxAmount = [obj applicableTaxAmountForItem:item];
         totalTaxesAmount = [taxAmount decimalNumberByAdding:totalTaxesAmount];
    }];
    
    NSDecimalNumber* nearest =
    [[NSDecimalNumber alloc] initWithMantissa:5 exponent:-2 isNegative:NO];
    
    NSDecimalNumber* roundedUpTaxes = [TaxCalculatorUtils roundUpDecimal:totalTaxesAmount toNearest:nearest];
    
    NSDecimalNumber *taxedPrice = [item.price
                                   decimalNumberByAdding:roundedUpTaxes];
    
    return [[TaxCalculatorResult alloc] initWithOriginalPrice:item.price
                                                   taxedPrice:taxedPrice
                                                  taxesAmount:roundedUpTaxes];
}
@end
