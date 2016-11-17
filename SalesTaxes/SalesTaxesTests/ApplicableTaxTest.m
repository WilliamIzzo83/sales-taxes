//
//  ApplicableTaxTest.m
//  SalesTaxes
//
//  Created by William Izzo on 16/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TaxCalculator.h"
#import "TestsUtils.h"

@interface ApplicableTaxTest : XCTestCase
@property (strong, nonatomic) NSArray<TaxCalculatorItem*>* mockItemsInput1;
@property (strong, nonatomic) NSArray<NSDecimalNumber*>* mockItemsInput1TaxAmountResults;
@property (strong, nonatomic) NSArray<NSDecimalNumber*>* mockItemsInput1Results;
@end

@implementation ApplicableTaxTest

- (void)setUp {
    [super setUp];
    self.mockItemsInput1 = [TestsUtils firstInputData].items;
    
    self.mockItemsInput1TaxAmountResults = (NSArray<NSDecimalNumber*>*)
    @[
      dec(0, 0, NO),
      dec(15, -1, NO),
      dec(0, 0, NO)
      ];
}

/// Tests that applicable tax rule computes the amount correctly
- (void)testApplicableTaxRule {

    ApplicableTaxRule* taxRule = [[ApplicableTaxRule alloc]
                                  initWithIdentifier:@""
                                  andPercentage:dec(2, -1, NO)];
    
    NSDecimalNumber* applicableTax =
    [taxRule applicableTaxToPrice:dec(1, 2, NO)];
    
    
    XCTAssert([applicableTax isEqualToNumber:dec(2, 1, NO)], @"Applicable tax rule test failed");
}

/// Tests that tax apply the right rule, based on item properties
- (void)testBaseApplicableTax {
    
    ApplicableTax* tax = [TestsUtils baseTax];
    
    for (NSUInteger itemIdx = 0; itemIdx < self.mockItemsInput1.count; ++itemIdx) {
        TaxCalculatorItem* item = self.mockItemsInput1[itemIdx];
        NSDecimalNumber* expectedTaxAmount = self.mockItemsInput1TaxAmountResults[itemIdx];
        
        NSDecimalNumber* taxAmount = [tax applicableTaxAmountForItem:item];
        
        BOOL expectationMet = [taxAmount isEqual:expectedTaxAmount];
        XCTAssert(expectationMet, @"!!! Tax amount computation failed\n\nItem:\nprice: %@\nproperties: %@\n\nExpected tax amount: %@\nComputed tax amount: %@",
                  item.price,
                  item.properties,
                  expectedTaxAmount,
                  taxAmount);
        
    }
}
@end
