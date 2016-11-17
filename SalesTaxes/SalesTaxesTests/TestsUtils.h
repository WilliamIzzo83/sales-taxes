//
//  TestsUtils.h
//  SalesTaxes
//
//  Created by William Izzo on 17/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaxCalculator.h"

@interface TaxCalculatorTestData : NSObject
- (instancetype)initWithItems:(NSArray<TaxCalculatorItem*>*)items
           andExpectedResults:(NSArray<TaxCalculatorResult*>*)results;

@property (readonly, nonatomic) NSArray<TaxCalculatorItem*>* items;
@property (readonly, nonatomic) NSArray<TaxCalculatorResult*>* result;
@end



@interface TestsUtils : NSObject
+ (ApplicableTax*)baseTax;
+ (ApplicableTax*)importTax;
+ (TaxCalculator*)calculator;
+ (TaxCalculatorTestData*)firstInputData;
+ (TaxCalculatorTestData*)secondInputData;
+ (TaxCalculatorTestData*)thirdInputData;
@end

FOUNDATION_EXTERN
NSDecimalNumber* dec(NSUInteger mantissa, short exp, BOOL neg);
