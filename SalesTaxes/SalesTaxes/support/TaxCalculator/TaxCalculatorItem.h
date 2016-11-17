//
//  TaxCalculatorItem.h
//  SalesTaxes
//
//  Created by William Izzo on 15/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

/// Type defining an array of properties
typedef NSArray<NSString*> TaxCalculatorItemProperties;
/**
 * Defines an object on which tax calculator applies taxes.
 * @par An item is defined with a price and a set of properties. Those 
 * properties are used by TaxCalculator to determine which rule to use to
 * determine the amount of applicable taxes.
 */
@interface TaxCalculatorItem : NSObject

- (instancetype)initWithName:(NSString*)name
                       price:(NSDecimalNumber*)price
               andProperties:(TaxCalculatorItemProperties*)properties;

/// Item's name
@property (readonly, nonatomic) NSString* name;
/// Item's price
@property (readonly, nonatomic) NSDecimalNumber* price;
/// Item's properties
@property (readonly, nonatomic) TaxCalculatorItemProperties* properties;
@end

NS_ASSUME_NONNULL_END
