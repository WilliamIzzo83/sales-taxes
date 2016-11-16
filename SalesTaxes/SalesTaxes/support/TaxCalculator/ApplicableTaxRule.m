//
//  TaxCalculatorRule.m
//  SalesTaxes
//
//  Created by William Izzo on 15/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import "ApplicableTaxRule.h"

@implementation ApplicableTaxRule

- (instancetype)initWithIdentifier:(NSString*)identifier
                     andPercentage:(NSDecimalNumber*)percentage {
    self = [super init];
    self->_identifier = [identifier copy];
    self->_percentage = [percentage copy];
    return self;
}

- (NSDecimalNumber*)applicableTaxToPrice:(NSDecimalNumber *)price {
    
    NSDecimalNumberHandler *handler =
    [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain
                                                           scale:2
                                                raiseOnExactness:NO
                                                 raiseOnOverflow:NO
                                                raiseOnUnderflow:NO
                                             raiseOnDivideByZero:NO];
    
    return [price decimalNumberByMultiplyingBy:self.percentage
                                  withBehavior:handler];
}

@end
