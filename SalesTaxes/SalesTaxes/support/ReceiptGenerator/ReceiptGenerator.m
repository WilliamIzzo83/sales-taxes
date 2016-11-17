//
//  ReceiptGenerator.m
//  SalesTaxes
//
//  Created by William Izzo on 17/11/16.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import "ReceiptGenerator.h"

@implementation ReceiptGenerator

+ (Receipt*)generateReceiptFromItemsInBasket:(ProductBasket*)basket
                           withTaxCalculator:(TaxCalculator*)taxCalculator {
    
    
    NSDecimalNumber* totalBtPrice = [NSDecimalNumber zero];
    NSDecimalNumber* totalAtPrice = [NSDecimalNumber zero];
    NSDecimalNumber* totalTAmount = [NSDecimalNumber zero];
    
    NSMutableArray<ReceiptItem*>* receiptItems =
    [NSMutableArray<ReceiptItem*> array];
    
    // The idea here is to generate a receipt item per bucket.
    for(ProductBucket* bucket in basket.buckets) {
        TaxCalculatorItem* item = bucket.firstObject;
        NSUInteger itemCount = bucket.count;
        assert(itemCount > 0);
        
        TaxCalculatorResult* result =
        [taxCalculator computeTaxesOnItem:item];
        
        NSString* itemDesc = [NSString stringWithFormat:@"%@ %@",
                              @(itemCount), item.name];
        
        NSDecimalNumber* btPrice = result.originalPrice;
        NSDecimalNumber* atPrice = result.taxedPrice;
        NSDecimalNumber* tAmount = result.taxesAmount;
        
        if (itemCount > 1) {
            NSDecimalNumber* multiplier =
            [NSDecimalNumber decimalNumberWithMantissa:itemCount
                                              exponent:1
                                            isNegative:NO];
            
            btPrice = [btPrice decimalNumberByMultiplyingBy:multiplier];
            atPrice = [atPrice decimalNumberByMultiplyingBy:multiplier];
            tAmount = [tAmount decimalNumberByMultiplyingBy:multiplier];
        }
        
        totalBtPrice = [totalBtPrice decimalNumberByAdding:btPrice];
        totalAtPrice = [totalAtPrice decimalNumberByAdding:atPrice];
        totalTAmount = [totalTAmount decimalNumberByAdding:tAmount];
        
        ReceiptItem* rcptItem =
        [[ReceiptItem alloc] initWithSummary:itemDesc
                            priceBeforeTaxes:btPrice
                             priceAfterTaxes:atPrice
                                 taxesAmount:tAmount];
        
        [receiptItems addObject:rcptItem];
    }
    
    
    ReceiptItem* totalItem =
    [[ReceiptItem alloc] initWithSummary:@"total"
                        priceBeforeTaxes:totalBtPrice
                         priceAfterTaxes:totalAtPrice
                             taxesAmount:totalTAmount];
    
    ReceiptItemsArray* rcptItems = [ReceiptItemsArray
                                    arrayWithArray:receiptItems];
    
    Receipt* receipt = [[Receipt alloc] initWithReceiptItems:rcptItems
                                                    andTotal:totalItem];
    
    return receipt;
}

@end
