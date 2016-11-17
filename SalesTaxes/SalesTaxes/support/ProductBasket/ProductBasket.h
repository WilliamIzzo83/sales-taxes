//
//  ProductBasket.h
//  SalesTaxes
//
//  Created by William Izzo on 17/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaxCalculatorItem.h"

// TODO: it is quite a waste to use an array of the same product.
// A simple class holding the item and a count will do.
/// A type defining an array of the same product.
typedef NSMutableArray<TaxCalculatorItem*> ProductBucket;

/**
 * Interface that allow to insert/remove items into a basket of items.
 * The basket subdivides items in buckets, so that is easy to have aggregates
 */
@interface ProductBasket : NSObject
/**
 * Adds an item to the basket
 * @param item The item to add
 */
- (void)addItem:(TaxCalculatorItem*)item;
/**
 * Adds an item to basket, with a user selected quantity.
 * @param item The item to add
 * @param quantity The quantity to add
 */
- (void)addItem:(TaxCalculatorItem*)item withQuantity:(NSUInteger)quantity;
/**
 * Removes an item from the basket
 * @param item Item to remove
 */
- (void)removeItem:(TaxCalculatorItem*)item;

/**
 * Removes all items with a specific name
 * @param name Name of the items to remove
 */
- (void)removeItemsWithName:(NSString*)name;

/**
 * Removes all items from the basket
 */
- (void)removeAllItems;

/// Number of products in basket
@property(readonly, nonatomic) NSUInteger productCount;

/// Current buckets in basket
@property (readonly, nonatomic) NSArray<ProductBucket*>* buckets;

/// Plain items in basket
@property (readonly, nonatomic) NSArray<TaxCalculatorItem*>* allProducts;
@end
