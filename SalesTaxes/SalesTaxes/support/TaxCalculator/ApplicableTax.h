//
//  ApplicableTax.h
//  SalesTaxes
//
//  Created by William Izzo on 16/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApplicableTaxRule.h"
#import "TaxCalculatorItem.h"

/// Type defining an array of rules used by TaxCalculator
typedef NSArray<ApplicableTaxRule*> TaxCalculatorRules;

/**
 * Defines an interface for an applicable tax, used by TaxCalculator.
 * An applicable tax is defined by a name and a set of tax rules.
 * Each rule define the applicable tax for a specific item.
 */
@interface ApplicableTax : NSObject
/**
 * Initializes the ApplicableTax instance.
 * @param identifier Tax identifier (e.g. IVA, VAT, ecc)
 * @param rules Tax rules defining the amount of tax to apply to a certain item.
 */
- (instancetype)initWithIdentifier:(NSString*)identifier
                       andTaxRules:(TaxCalculatorRules*)rules;

/**
 * Computes the applicable tax amount for a specific item.
 * @par In order to do so the ApplicableTax instance scans through its rules
 * to find the correct one, based on item properties, and then abide to it.
 * @note If no suitable rule is found the ApplicableTax falls back to the default
 * rule. The default rule is the first one found in TaxCalculatorRules.
 * @note If no rules exists, the function will returns zero as the applicable
 * amount of tax for item.
 * @param item Item for which compute the applicable tax amount.
 * @return Applicable tax amount for specified item.
 */
- (NSDecimalNumber*)applicableTaxAmountForItem:(TaxCalculatorItem*)item;

/// Tax identifier
@property (readonly, nonatomic) NSString* identifier;
/// Tax rules
@property (readonly, nonatomic) TaxCalculatorRules* rules;
@end
