//
//  TestsUtils.h
//  SalesTaxes
//
//  Created by William Izzo on 17/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaxCalculator.h"
#import "DecimalSupport.h"
/**
 * Object that holds a test data set with relative verification data
 * to be used while testing TaxCalculator and ReceiptGenerator
 */
@interface TaxCalculatorTestData : NSObject
- (instancetype)initWithItems:(NSArray<TaxCalculatorItem*>*)items
              expectedResults:(NSArray<TaxCalculatorResult*>*)results
                     andTotal:(TaxCalculatorResult*)totalResult;

/// Items to test
@property (readonly, nonatomic) NSArray<TaxCalculatorItem*>* items;
/// Expected result for each item expected from TaxCalculator.
@property (readonly, nonatomic) NSArray<TaxCalculatorResult*>* result;
/// Sum of all items data, used to test ReceiptGenerator total.
@property (readonly, nonatomic) TaxCalculatorResult* totalResult;
@end



@interface TestsUtils : NSObject
+ (ApplicableTax*)baseTax;
+ (ApplicableTax*)importTax;
+ (TaxCalculator*)calculator;
+ (TaxCalculatorTestData*)firstInputData;
+ (TaxCalculatorTestData*)secondInputData;
+ (TaxCalculatorTestData*)thirdInputData;
@end


