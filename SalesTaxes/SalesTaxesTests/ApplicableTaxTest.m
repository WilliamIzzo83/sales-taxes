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
    self.mockItemsInput1 = (NSArray<TaxCalculatorItem*>*)
    @[
      [[TaxCalculatorItem alloc] initWithPrice:dec(1249, -2, NO)
                                 andProperties:@[@"books"]],
      [[TaxCalculatorItem alloc] initWithPrice:dec(1499, -2, NO)
                                 andProperties:@[@"music"]],
      [[TaxCalculatorItem alloc] initWithPrice:dec(85, -2, NO)
                                 andProperties:@[@"food"]]
      ];
    
    self.mockItemsInput1TaxAmountResults = (NSArray<NSDecimalNumber*>*)
    @[
      dec(0, 0, NO),
      dec(15, -1, NO),
      dec(0, 0, NO)
      ];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testApplicableTaxRule {

    ApplicableTaxRule* taxRule = [[ApplicableTaxRule alloc]
                                  initWithIdentifier:@""
                                  andPercentage:dec(2, -1, NO)];
    
    NSDecimalNumber* applicableTax =
    [taxRule applicableTaxToPrice:dec(1, 2, NO)];
    
    
    XCTAssert([applicableTax isEqualToNumber:dec(2, 1, NO)], @"Applicable tax rule test failed");
}

- (void)testBaseApplicableTax {
    ApplicableTaxRule* defaultRule = [[ApplicableTaxRule alloc]
                                    initWithIdentifier:@"default"
                                    andPercentage:dec(1, -1, NO)];

    ApplicableTaxRule* booksRule = [[ApplicableTaxRule alloc]
                                    initWithIdentifier:@"books"
                                    andPercentage:[NSDecimalNumber zero]];
    ApplicableTaxRule* foodRule = [[ApplicableTaxRule alloc]
                                    initWithIdentifier:@"food"
                                    andPercentage:[NSDecimalNumber zero]];
    
    TaxCalculatorRules* rules = @[defaultRule, booksRule, foodRule];
    
    ApplicableTax* tax = [[ApplicableTax alloc]
                          initWithIdentifier:@"base"
                          andTaxRules:rules];
    
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
