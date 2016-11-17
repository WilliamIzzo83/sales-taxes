//
//  ProductBasketTest.m
//  SalesTaxes
//
//  Created by William Izzo on 17/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ProductBasket.h"
#import "TestsUtils.h"

@interface ProductBasketTest : XCTestCase

@end

@implementation ProductBasketTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

/// Tests that insering one object for each type works
- (void)testSingleInsert {
    NSArray<TaxCalculatorItem*>* items = [TestsUtils firstInputData].items;
    ProductBasket* basket = [[ProductBasket alloc] init];
    
    for (TaxCalculatorItem* item in items) {
        [basket addItem:item];
    }
    
    NSUInteger count = basket.productCount;
    NSUInteger expectedCount = items.count;
    
    XCTAssert(count == expectedCount,
              @"!!! Basket count(%@) doesn't match expectation(%@)",
              @(count), @(expectedCount));
    
    
    NSArray<TaxCalculatorItem*>* itemsInBasket = basket.allProducts;
    for (TaxCalculatorItem* item in items) {
        XCTAssert([itemsInBasket containsObject:item],
                  @"Item(%@) not found in basket",
                  item.name);
    }
}

/// Tests that inserting products with arbitrary quantity for each kind, works
- (void)testMultipleInsert {
    NSArray<TaxCalculatorItem*>* items = [TestsUtils firstInputData].items;
    ProductBasket* basket = [[ProductBasket alloc] init];
    
    for (TaxCalculatorItem* item in items) {
        [basket addItem:item withQuantity:2];
    }
    
    NSUInteger count = basket.productCount;
    NSUInteger expectedCount = items.count * 2;
    
    XCTAssert(count == expectedCount,
              @"!!! Basket count(%@) doesn't match expectation(%@)",
              @(count), @(expectedCount));
}



@end
