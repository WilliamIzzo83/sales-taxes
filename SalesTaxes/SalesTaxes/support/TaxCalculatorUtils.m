//
//  TaxCalculatorUtils.m
//  SalesTaxes
//
//  Created by William Izzo on 17/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import "TaxCalculatorUtils.h"

@implementation TaxCalculatorUtils
+ (NSDecimalNumber*)roundUpDecimal:(NSDecimalNumber*)taxAmount
                         toNearest:(NSDecimalNumber*)nearest {
    
    
    
    NSDecimalNumber* ratio = [taxAmount decimalNumberByDividingBy:nearest];
    
    NSDecimalNumberHandler *nearestHndl =
    [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundUp
                                                           scale:0
                                                raiseOnExactness:NO
                                                 raiseOnOverflow:NO
                                                raiseOnUnderflow:NO
                                             raiseOnDivideByZero:NO];
    
    NSDecimalNumber* nearestInt =
    [ratio decimalNumberByRoundingAccordingToBehavior:nearestHndl];
    
    NSDecimalNumber* result =
    [nearest decimalNumberByMultiplyingBy:nearestInt];

    return result;    
}
@end
