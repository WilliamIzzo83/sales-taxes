//
//  ReceiptTest.m
//  SalesTaxes
//
//  Created by William Izzo on 17/11/16.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Receipt.h"

@interface ReceiptTest : XCTestCase

@end

@implementation ReceiptTest

- (void)testReceiptInstance {
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
    
    static NSUInteger repetition = 10;
    NSMutableArray* items = [NSMutableArray array];
    for (NSUInteger counter = 0; counter < repetition; ++counter) {
        [items addObject:item];
    }
    
    Receipt* testReceipt = [[Receipt alloc] initWithReceiptItems:items
                                                        andTotal:item];
    
    XCTAssert(testReceipt.items != nil,
              @"!!! Error: receipt items not initialized");
    
    XCTAssert(testReceipt.items.count == repetition,
              @"!!! Error: receipt items count(%@) unexpected(%@)",
              @(testReceipt.items.count),
              @(repetition));
    
    XCTAssert(![testReceipt.items containsObject:item],
              @"!!! Error: items access is compromised (a copy should have returned)");
    
    XCTAssert(testReceipt.total != nil,
              @"!!! Error: total item not initialized");
    
    XCTAssert(![testReceipt.total isEqual:item],
              @"!!! Error: total initialization compromised (the contructor should have done a copy)");
}

@end
