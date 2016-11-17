//
//  ProductBasket.m
//  SalesTaxes
//
//  Created by William Izzo on 17/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import "ProductBasket.h"



@interface ProductBasket()
@property (strong, nonatomic) NSMutableDictionary<NSString*, ProductBucket*>* basket;
@end

@implementation ProductBasket
- (instancetype)init {
    self = [super init];
    self.basket = [NSMutableDictionary<NSString*,ProductBucket*> dictionary];
    return self;
}

- (void)addItem:(TaxCalculatorItem*)item {
    [self addItem:item withQuantity:1];
}

- (void)addItem:(TaxCalculatorItem*)item withQuantity:(NSUInteger)quantity {
    ProductBucket* bucket = self.basket[item.name];
    if (bucket == nil) {
        bucket = [ProductBucket array];
        self.basket[item.name] = bucket;
    }
    
    for(NSUInteger idx = 0; idx < quantity; ++idx) {
      [bucket addObject:item];
    }
}

- (void)removeItem:(TaxCalculatorItem*)item {
    ProductBucket* bucket = self.basket[item.name];
    if (bucket == nil) {
        return;
    }
    
    if (bucket.count == 0) {
        return;
    }
    
    [bucket removeLastObject];
}

- (void)removeItemsWithName:(NSString*)name {
    ProductBucket* bucket = self.basket[name];
    if (bucket == nil) {
        return;
    }
    
    [self.basket removeObjectForKey:name];
}

- (void)removeAllItems {
    [self.basket removeAllObjects];
}

- (NSUInteger)productCount {
    NSUInteger count = 0;
    if (self.basket.allKeys == 0) {
        return 0;
    }
    
    for(ProductBucket* bucket in self.basket.allValues) {
        count+= bucket.count;
    }
    
    return count;
}

- (NSArray<ProductBucket*>*)buckets {
    
    NSArray<ProductBucket*>* products =
    [[NSArray alloc] initWithArray:self.basket.allValues copyItems:YES];
    
    return products;
}

- (NSArray<TaxCalculatorItem*>*)allProducts {
    NSArray<NSString*>* allKeys = self.basket.allKeys;
    NSMutableArray<TaxCalculatorItem*>* allProducts = [NSMutableArray<TaxCalculatorItem*> array];
    
    for (NSString* key in allKeys) {
        ProductBucket* bucket = self.basket[key];
        for (TaxCalculatorItem* item in bucket) {
            [allProducts addObject:[item copy]];
        }
    }
    
    return [NSArray<TaxCalculatorItem*> arrayWithArray:allProducts];
}
@end
