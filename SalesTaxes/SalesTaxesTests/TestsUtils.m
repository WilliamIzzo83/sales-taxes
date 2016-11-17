//
//  TestsUtils.m
//  SalesTaxes
//
//  Created by William Izzo on 17/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import "TestsUtils.h"
NSDecimalNumber* dec(NSUInteger mantissa, short exp, BOOL neg) {
    return [[NSDecimalNumber alloc] initWithMantissa:mantissa
                                            exponent:exp
                                          isNegative:neg];
}

@implementation TaxCalculatorTestData

- (instancetype)initWithItems:(NSArray<TaxCalculatorItem*>*)items
           andExpectedResults:(NSArray<TaxCalculatorResult*>*)results {
    self = [super init];
    self->_items = [NSArray<TaxCalculatorItem*> arrayWithArray:items];
    self->_result = [NSArray<TaxCalculatorResult*> arrayWithArray:results];
    return self;
}

@end

@implementation TestsUtils
+ (ApplicableTax*)baseTax {
    ApplicableTaxRule* defaultRule = [[ApplicableTaxRule alloc]
                                      initWithIdentifier:@"default"
                                      andPercentage:dec(1, -1, NO)];
    
    ApplicableTaxRule* booksRule = [[ApplicableTaxRule alloc]
                                    initWithIdentifier:@"books"
                                    andPercentage:dec(0, 0, NO)];
    ApplicableTaxRule* foodRule = [[ApplicableTaxRule alloc]
                                   initWithIdentifier:@"food"
                                   andPercentage:dec(0, 0, NO)];
    ApplicableTaxRule* medicalRule = [[ApplicableTaxRule alloc]
                                      initWithIdentifier:@"medical"
                                      andPercentage:dec(0, 0, NO)];
    
    TaxCalculatorRules* rules = @[defaultRule,
                                  booksRule,
                                  foodRule,
                                  medicalRule];
    
    return [[ApplicableTax alloc] initWithIdentifier:@"base" andTaxRules:rules];
}

+ (ApplicableTax*)importTax {
    ApplicableTaxRule* defaultRule =
    [[ApplicableTaxRule alloc] initWithIdentifier:@"default"
                                    andPercentage:dec(0,0,NO)];
    
    ApplicableTaxRule* importRule =
    [[ApplicableTaxRule alloc] initWithIdentifier:@"import"
                                    andPercentage:dec(5,-2,NO)];
    
    TaxCalculatorRules* rules = @[defaultRule, importRule];
    
    return [[ApplicableTax alloc] initWithIdentifier:@"import"
                                         andTaxRules:rules];
}

+ (TaxCalculator*)calculator {
    TaxCalculatorApplicableTaxes* taxes = @[[self baseTax],
                                            [self importTax]];
    
    return [[TaxCalculator alloc] initWithApplicableTaxes:taxes];
}

+ (TaxCalculatorTestData*)firstInputData {
    NSArray<TaxCalculatorItem*>* items = (NSArray<TaxCalculatorItem*>*)
    @[
      [[TaxCalculatorItem alloc] initWithName:@"book"
                                        price:dec(1249, -2, NO)
                                andProperties:@[@"books"]],
      [[TaxCalculatorItem alloc] initWithName:@"music cd"
                                        price:dec(1499, -2, NO)
                                andProperties:@[@"music"]],
      [[TaxCalculatorItem alloc] initWithName:@"chocolate"
                                        price:dec(85, -2, NO)
                                andProperties:@[@"food"]]
      ];
    
    
    NSArray<TaxCalculatorResult*>* results = (NSArray<TaxCalculatorResult*>*)
    @[[[TaxCalculatorResult alloc] initWithOriginalPrice:dec(1249, -2, NO)
                                              taxedPrice:dec(1249, -2, NO)
                                             taxesAmount:dec(0, 0, NO)],
      [[TaxCalculatorResult alloc] initWithOriginalPrice:dec(1499, -2, NO)
                                              taxedPrice:dec(1649, -2, NO)
                                             taxesAmount:dec(15, -1, NO)],
      [[TaxCalculatorResult alloc] initWithOriginalPrice:dec(85, -2, NO)
                                              taxedPrice:dec(85, -2, NO)
                                             taxesAmount:dec(0, 0, NO)]
      
      ];
    
    
    return [[TaxCalculatorTestData alloc] initWithItems:items
                                     andExpectedResults:results];
}

+ (TaxCalculatorTestData*)secondInputData {
    NSArray<TaxCalculatorItem*>* items = (NSArray<TaxCalculatorItem*>*)
    @[
      [[TaxCalculatorItem alloc] initWithName:@"imported chocolate box"
                                        price:dec(10, 0, NO)
                                andProperties:@[@"food", @"import"]],
      [[TaxCalculatorItem alloc] initWithName:@"imported perfume"
                                        price:dec(4750, -2, NO)
                                andProperties:@[@"perfume", @"import"]]
      ];
    
    
    NSArray<TaxCalculatorResult*>* results = (NSArray<TaxCalculatorResult*>*)
    @[[[TaxCalculatorResult alloc] initWithOriginalPrice:dec(1000, -2, NO)
                                              taxedPrice:dec(1050, -2, NO)
                                             taxesAmount:dec(50, -2, NO)],
      [[TaxCalculatorResult alloc] initWithOriginalPrice:dec(4750, -2, NO)
                                              taxedPrice:dec(5465, -2, NO)
                                             taxesAmount:dec(715, -2, NO)]
      
      ];
    
    
    return [[TaxCalculatorTestData alloc] initWithItems:items
                                     andExpectedResults:results];
}

+ (TaxCalculatorTestData*)thirdInputData {
    NSArray<TaxCalculatorItem*>* items = (NSArray<TaxCalculatorItem*>*)
    @[
      [[TaxCalculatorItem alloc] initWithName:@"imported perfume"
                                        price:dec(2799, -2, NO)
                                andProperties:@[@"perfume", @"import"]],
      [[TaxCalculatorItem alloc] initWithName:@"perfume"
                                        price:dec(1899, -2, NO)
                                andProperties:@[@"perfume"]],
      [[TaxCalculatorItem alloc] initWithName:@"medicine"
                                        price:dec(975, -2, NO)
                                andProperties:@[@"medical"]],
      [[TaxCalculatorItem alloc] initWithName:@"imported chocolate box"
                                        price:dec(1125, -2, NO)
                                andProperties:@[@"food", @"import"]]
      ];
    
    
    NSArray<TaxCalculatorResult*>* results = (NSArray<TaxCalculatorResult*>*)
    @[[[TaxCalculatorResult alloc] initWithOriginalPrice:dec(2799, -2, NO)
                                              taxedPrice:dec(3219, -2, NO)
                                             taxesAmount:dec(42, -1, NO)],
      [[TaxCalculatorResult alloc] initWithOriginalPrice:dec(1899, -2, NO)
                                              taxedPrice:dec(2089, -2, NO)
                                             taxesAmount:dec(19, -1, NO)],
      [[TaxCalculatorResult alloc] initWithOriginalPrice:dec(975, -2, NO)
                                              taxedPrice:dec(975, -2, NO)
                                             taxesAmount:dec(0, 0, NO)],
      [[TaxCalculatorResult alloc] initWithOriginalPrice:dec(1125, -2, NO)
                                              taxedPrice:dec(1185, -2, NO)
                                             taxesAmount:dec(6, -1, NO)]
      
      ];
    
    return [[TaxCalculatorTestData alloc] initWithItems:items
                                     andExpectedResults:results];
}

@end
