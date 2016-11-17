//
//  ReceiptGenerator.h
//  SalesTaxes
//
//  Created by William Izzo on 17/11/16.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Receipt.h"
#import "TaxCalculator.h"
#import "ProductBasket.h"

/**
 * Defines an object that can be used to generate a receipt given
 * a basket of product as input
 */
@interface ReceiptGenerator : NSObject
/**
 * Generates a receipt from items in basket.
 * @param basket The basket containing the items.
 * @param taxCalculator Tax calculator defining taxes and rules to be applied 
 * on items.
 */
+ (Receipt*)generateReceiptFromItemsInBasket:(ProductBasket*)basket
                           withTaxCalculator:(TaxCalculator*)taxCalculator;
@end
