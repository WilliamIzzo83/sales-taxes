//
//  TaxCalculatorRule.m
//  SalesTaxes
//
//  Created by William Izzo on 15/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import "ApplicableTaxRule.h"

NSExceptionName const kApplicableTaxRuleExcPercentageInterval =
@"com.wizzo.salestaxes.exc.applicabletaxrule.percentageinterval";

@implementation ApplicableTaxRule

- (instancetype)initWithIdentifier:(NSString*)identifier
                     andPercentage:(NSDecimalNumber*)percentage {
    self = [super init];
    
    NSComparisonResult lowerComparison = [percentage compare:@(0.0)];
    NSComparisonResult upperComparison = [percentage compare:@(1.0)];
    
    if (lowerComparison == NSOrderedAscending || upperComparison == NSOrderedDescending) {
        NSString* reasonString =
        [NSString stringWithFormat:@"Percentage value(%@) was out of interval [0...1]",
         percentage];
        
        NSException* exception =
        [[NSException alloc] initWithName:kApplicableTaxRuleExcPercentageInterval
                                   reason:reasonString
                                 userInfo:nil];
        
        @throw exception;
        return nil;
    }
    
    
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
