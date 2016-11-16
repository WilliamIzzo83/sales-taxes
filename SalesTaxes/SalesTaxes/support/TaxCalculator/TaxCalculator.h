//
//  TaxCalculator.h
//  SalesTaxes
//
//  Created by William Izzo on 15/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApplicableTaxRule.h"
#import "TaxCalculatorItem.h"
#import "TaxCalculatorResult.h"

/// Type defining an array of rules used by TaxCalculator
typedef NSArray<ApplicableTaxRule*> TaxCalculatorRules;

/**
 * Defines an object capable of apply taxes on a given price.
 * @par In order to support different kind of taxes, it is possible to
 * define a set of rules that instructs the object about how to modify the given
 * price.
 */
@interface TaxCalculator : NSObject
/**
 * Initializes the tax calculator.
 * @param rules A set of rule used by tax calculator instance.
 * @return TaxCalculator instance.
 */
- (instancetype)initWithRules:(TaxCalculatorRules*)rules;
/**
 * Computes taxes for a specific item.
 * @param item Item subject to computation.
 * @return TaxCalculatorResult instance, containing computation's results.
 */
- (TaxCalculatorResult*)computeTaxesOnItem:(TaxCalculatorItem*)item;
@end
