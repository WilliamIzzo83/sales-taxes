//
//  TaxCalculator.h
//  SalesTaxes
//
//  Created by William Izzo on 15/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApplicableTax.h"
#import "TaxCalculatorItem.h"
#import "TaxCalculatorResult.h"

typedef NSArray<ApplicableTax*> TaxCalculatorApplicableTaxes;


/**
 * Defines an object capable of apply taxes on a given price.
 * @par In order to support different kind of taxes, it is possible to
 * define a set of applicable taxes. TaxCalculator will then apply each tax to
 * the item.
 */
@interface TaxCalculator : NSObject
/**
 * Initializes the tax calculator.
 * @param applicableTaxes An array of applicable taxes.
 * @return TaxCalculator instance.
 */
- (instancetype)initWithApplicableTaxes:(TaxCalculatorApplicableTaxes*)applicableTaxes
NS_DESIGNATED_INITIALIZER;
/**
 * Computes taxes for a specific item.
 * @note For each ApplicableTax the computation will use the first tax rule as
 * ßdefault.
 * @param item Item subject to computation.
 * @return TaxCalculatorResult instance, containing computation's results.
 */
- (TaxCalculatorResult*)computeTaxesOnItem:(TaxCalculatorItem*)item;
@end
