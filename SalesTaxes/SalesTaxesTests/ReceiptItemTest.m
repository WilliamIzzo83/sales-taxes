//
//  ReceiptItemTest.m
//  SalesTaxes
//
//  Created by William Izzo on 17/11/16.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ReceiptItem.h"
@interface ReceiptItemTest : XCTestCase
- (void)expectationTestWithItem:(ReceiptItem*)item
            withExpectedSummary:(NSString*)summary
       expectedPriceBeforeTaxes:(NSDecimalNumber*)priceBeforeTaxes
        expectedPriceAfterTaxes:(NSDecimalNumber*)priceAfterTaxes
            expectedTaxesAmount:(NSDecimalNumber*)taxesAmount;
@end

@implementation ReceiptItemTest


- (void)expectationTestWithItem:(ReceiptItem*)item
            withExpectedSummary:(NSString*)summary
       expectedPriceBeforeTaxes:(NSDecimalNumber*)priceBeforeTaxes
        expectedPriceAfterTaxes:(NSDecimalNumber*)priceAfterTaxes
            expectedTaxesAmount:(NSDecimalNumber*)taxesAmount {
    
    XCTAssert([item.summary isEqualToString:summary],
              @"!!! Error: item summary(%@) doesn't meet expectation(%@)",
              item.summary,
              summary);
    
    XCTAssert([item.priceBeforeTaxes isEqual:priceBeforeTaxes],
              @"!!! Error: item price before taxes(%@) doesn't meet expectation(%@)",
              item.priceBeforeTaxes,
              priceBeforeTaxes);
    
    XCTAssert([item.priceAfterTaxes isEqual:priceAfterTaxes],
              @"!!! Error: item price after taxes(%@) doesn't meet expectation(%@)",
              item.priceAfterTaxes,
              priceAfterTaxes);
    
    XCTAssert([item.taxesAmount isEqual:taxesAmount],
              @"!!! Error: item taxes amount(%@) doesn't meet expectation(%@)",
              item.taxesAmount,
              taxesAmount);
    
}


- (void)testInstance {
    NSString* string = @"summary";
    NSDecimalNumber* zero = [NSDecimalNumber zero];
    NSDecimalNumber* one = [NSDecimalNumber one];
    NSDecimalNumber* two = [NSDecimalNumber decimalNumberWithMantissa:2
                                                             exponent:1
                                                           isNegative:NO];
    
    
    ReceiptItem* item = [[ReceiptItem alloc] initWithSummary:string
                                            priceBeforeTaxes:zero
                                             priceAfterTaxes:one
                                                 taxesAmount:two];
    
    [self expectationTestWithItem:item
              withExpectedSummary:string
         expectedPriceBeforeTaxes:zero
          expectedPriceAfterTaxes:one
              expectedTaxesAmount:two];
}

- (void)testCopy {
    NSString* string = @"summary";
    NSDecimalNumber* zero = [NSDecimalNumber zero];
    NSDecimalNumber* one = [NSDecimalNumber one];
    NSDecimalNumber* two = [NSDecimalNumber decimalNumberWithMantissa:2
                                                             exponent:1
                                                           isNegative:NO];
    
    ReceiptItem* item = [[ReceiptItem alloc] initWithSummary:string
                                            priceBeforeTaxes:zero
                                             priceAfterTaxes:one
                                                 taxesAmount:two];
    
    ReceiptItem* copied = [item copy];
    
    [self expectationTestWithItem:copied
              withExpectedSummary:item.summary
         expectedPriceBeforeTaxes:item.priceBeforeTaxes
          expectedPriceAfterTaxes:item.priceAfterTaxes
              expectedTaxesAmount:item.taxesAmount];
    
}

@end
