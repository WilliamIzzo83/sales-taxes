//
//  TaxCalculatorUtils.h
//  SalesTaxes
//
//  Created by William Izzo on 17/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaxCalculatorUtils : NSObject
+ (NSDecimalNumber*)roundUpDecimal:(NSDecimalNumber*)taxAmount
                         toNearest:(NSDecimalNumber*)nearest;
@end
