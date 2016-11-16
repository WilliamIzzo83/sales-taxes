//
//  Product.h
//  SalesTaxes
//
//  Created by William Izzo on 15/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * Defines a model representing a product.
 */
@interface Product : NSObject
- (instancetype)initWithTitle:(NSString*)title
                        price:(NSDecimalNumber*)price
                         type:(NSString*)type
                   isImported:(BOOL)imported;

@property (readonly, nonatomic) NSString* title;
@property (readonly, nonatomic) NSDecimalNumber* price;
@property (readonly, nonatomic) NSString* type;
@property (readonly, nonatomic, getter=isImported) BOOL imported;
@end

NS_ASSUME_NONNULL_END
