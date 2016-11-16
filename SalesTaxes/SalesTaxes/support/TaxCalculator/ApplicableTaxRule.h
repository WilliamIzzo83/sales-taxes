//
//  TaxCalculatorRule.h
//  SalesTaxes
//
//  Created by William Izzo on 15/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * Defines a rule used from TaxCalculator while computing the amount of
 * taxes to be applied to a specific price.
 * @par The rule is defined by an identifier and a percentage.
 */
@interface ApplicableTaxRule : NSObject

/**
 * Initializes a TaxCalculatorRule object.
 * @note Throws an exception if percentage range is invalid.
 * @param identifier Rule identifier.
 * @param percentage to apply to price. Percentage is expresed in range 0..1
 * @return TaxCalculatorRule object.
 */
- (instancetype)initWithIdentifier:(NSString*)identifier
                     andPercentage:(NSDecimalNumber*)percentage;

/**
 * Returns the amount of applicable taxes to the price.
 * @par Output value is rounded to the 2nd decimal value.
 * @param price Price on which apply the tax percentage.
 * @return Amount of taxes applicable to the price.
 */
- (NSDecimalNumber*)applicableTaxToPrice:(NSDecimalNumber*)price;

/// Rule identifier
@property (readonly, nonatomic) NSString* identifier;
/// Tax percentage applicable.
@property (readonly, nonatomic) NSDecimalNumber* percentage;
@end

NS_ASSUME_NONNULL_END
