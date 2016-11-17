//
//  TaxCalculatorItem.m
//  SalesTaxes
//
//  Created by William Izzo on 15/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import "TaxCalculatorItem.h"

@implementation TaxCalculatorItem
- (instancetype) initWithName:(NSString *)name
                        price:(NSDecimalNumber *)price
                andProperties:(TaxCalculatorItemProperties *)properties {
    self = [super init];
    self->_name = [name copy];
    self->_price = [price copy];
    self->_properties = [[NSArray alloc] initWithArray:properties copyItems:YES];
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    return [[TaxCalculatorItem alloc] initWithName:self.name
                                             price:self.price
                                     andProperties:self.properties];
}

- (NSString*)description {
    return [NSString stringWithFormat:@"{ %@, %@ - %@ }",
            self.name,
            self.price,
            self.properties];
}

- (BOOL)isEqual:(id)object {
    if (![object isKindOfClass:[TaxCalculatorItem class]]) {
        return NO;
    }
    
    TaxCalculatorItem* other = (TaxCalculatorItem*)object;
    // For the sake of simplicity, item name is used as the key
    return [self.name isEqualToString:other.name];
}
@end
