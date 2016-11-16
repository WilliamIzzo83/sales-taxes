//
//  ApplicableTaxTest.m
//  SalesTaxes
//
//  Created by William Izzo on 16/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TaxCalculator.h"
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
      [[TaxCalculatorItem alloc] initWithPrice:[[NSDecimalNumber alloc] initWithDouble:12.49]
                                 andProperties:@[@"books"]],
      [[TaxCalculatorItem alloc] initWithPrice:[[NSDecimalNumber alloc] initWithDouble:14.99]
                                 andProperties:@[@"music"]],
      [[TaxCalculatorItem alloc] initWithPrice:[[NSDecimalNumber alloc] initWithInt:0.85]
                                 andProperties:@[@"food"]]
      ];
    
    self.mockItemsInput1TaxAmountResults = (NSArray<NSDecimalNumber*>*)
    @[
      [[NSDecimalNumber alloc] initWithDouble:0.00],
      [[NSDecimalNumber alloc] initWithDouble:1.5],
      [[NSDecimalNumber alloc] initWithDouble:0.00]
      ];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testApplicableTaxRule {

    ApplicableTaxRule* taxRule = [[ApplicableTaxRule alloc]
                                  initWithIdentifier:@""
                                  andPercentage:[[NSDecimalNumber alloc] initWithFloat:0.2]];
    
    NSDecimalNumber* applicableTax =
    [taxRule applicableTaxToPrice:[[NSDecimalNumber alloc] initWithFloat:100.0]];
    
    
    XCTAssert([applicableTax isEqualToNumber:@(20.0)], @"Applicable tax rule test failed");
}

- (void)testBaseApplicableTax {
    ApplicableTaxRule* defaultRule = [[ApplicableTaxRule alloc]
                                    initWithIdentifier:@"default"
                                    andPercentage:[[NSDecimalNumber alloc] initWithDouble:0.1]];

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
