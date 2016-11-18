//
//  DecimalSupport.m
//  SalesTaxes
//
//  Created by William Izzo on 18/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import "DecimalSupport.h"

NSDecimalNumber* dec(NSUInteger mantissa, short exp, BOOL neg) {
    return [[NSDecimalNumber alloc] initWithMantissa:mantissa
                                            exponent:exp
                                          isNegative:neg];
}
