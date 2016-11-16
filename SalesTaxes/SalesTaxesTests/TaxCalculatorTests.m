//
//  TaxCalculatorTests.m
//  SalesTaxes
//
//  Created by William Izzo on 16/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TaxCalculator.h"
@interface TaxCalculatorTests : XCTestCase

@end

@implementation TaxCalculatorTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
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
@end
