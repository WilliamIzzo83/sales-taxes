//
//  TaxCalculatorResult.h
//  SalesTaxes
//
//  Created by William Izzo on 15/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Defines an object storing the result of a TaxCalculator computation.
 * @par It has the original price, the price with taxes and the amount of
 * taxes applied.
 */
@interface TaxCalculatorResult : NSObject
- (instancetype)initWithOriginalPrice:(NSDecimalNumber*)originalPrice
                           taxedPrice:(NSDecimalNumber*)taxedPrice
                          taxesAmount:(NSDecimalNumber*)taxesAmount;

/// Original item price.
@property (readonly, nonatomic) NSDecimalNumber* originalPrice;
/// Price with taxes.
@property (readonly, nonatomic) NSDecimalNumber* taxedPrice;
/// Applicable taxes amount.
@property (readonly, nonatomic) NSDecimalNumber* taxesAmount;
@end
