//
//  TaxCalculatorTest.m
//  SalesTaxes
//
//  Created by William Izzo on 16/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TaxCalculator.h"
#import "TestsUtils.h"

@interface TaxCalculatorTest : XCTestCase
@end

@implementation TaxCalculatorTest


- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

/// Tests tax calculator results correctness
- (void)testTaxCalculator {
    TaxCalculator* taxCalc = [TestsUtils calculator];
    NSArray<TaxCalculatorTestData*>* dataSet =
    @[[TestsUtils firstInputData],
      [TestsUtils secondInputData],
      [TestsUtils thirdInputData]
      ];
    
    for (TaxCalculatorTestData* testData in dataSet) {
        NSArray<TaxCalculatorItem*>* testItems = testData.items;
        NSArray<TaxCalculatorResult*>* results = testData.result;
        
        for (NSUInteger itmIdx = 0; itmIdx < testItems.count; ++itmIdx) {
            TaxCalculatorItem* item = testItems[itmIdx];
            TaxCalculatorResult* expectedResult = results[itmIdx];
            
            TaxCalculatorResult* result = [taxCalc computeTaxesOnItem:item];
            BOOL testPassed = [result isEqual:expectedResult];
            XCTAssert(testPassed, @"\n\n!!! TaxCalculator test failed\n\nExpected result:%@\n\nComputed result:%@\n\n", expectedResult, result);
            
            
        }
    }
}


@end
