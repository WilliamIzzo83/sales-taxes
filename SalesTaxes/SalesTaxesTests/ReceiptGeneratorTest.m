//
//  ReceiptGeneratorTest.m
//  SalesTaxes
//
//  Created by William Izzo on 17/11/16.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ReceiptGenerator.h"
#import "TestsUtils.h"

@interface ReceiptGeneratorTest : XCTestCase
- (void)expectationTestWithReceiptItem:(ReceiptItem*)item
                     andExpectedResult:(TaxCalculatorResult*)expectedResult;
@end

@implementation ReceiptGeneratorTest


- (void)testReceiptGeneration {
    
    NSArray<TaxCalculatorTestData*>* dataSet = @[[TestsUtils firstInputData],
                                                 [TestsUtils secondInputData],
                                                 [TestsUtils thirdInputData]];

    TaxCalculator* taxCalc = [TestsUtils calculator];
    ProductBasket* basket = [[ProductBasket alloc] init];
    
    for (TaxCalculatorTestData* testData in dataSet) {
        [basket removeAllItems];
        
        NSLog(@"Testing dataset #%@", @([dataSet indexOfObject:testData]));

        NSArray<TaxCalculatorItem*>* items = testData.items;
        for (TaxCalculatorItem* item in items) {
            [basket addItem:item];
        }

        Receipt* receipt =
        [ReceiptGenerator generateReceiptFromItemsInBasket:basket
                                         withTaxCalculator:taxCalc];
        
        
        [self expectationTestWithReceiptItem:receipt.total
                           andExpectedResult:testData.totalResult];
    }
}

- (void)expectationTestWithReceiptItem:(ReceiptItem *)item
                     andExpectedResult:(TaxCalculatorResult *)expectedResult {
    
    TaxCalculatorResult* result =
    [[TaxCalculatorResult alloc] initWithOriginalPrice:item.priceBeforeTaxes
                                            taxedPrice:item.priceAfterTaxes
                                           taxesAmount:item.taxesAmount];
    
    BOOL testPassed = [result isEqual:expectedResult];
    XCTAssert(testPassed,
              @"\n\n!!! Receipt generation test failed\n\nExpected result:%@\n\nComputed result:%@\n\n",
              expectedResult,
              result);
}

@end
