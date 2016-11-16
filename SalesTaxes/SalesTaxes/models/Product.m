//
//  Product.m
//  SalesTaxes
//
//  Created by William Izzo on 15/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import "Product.h"

@implementation Product
- (instancetype)initWithTitle:(NSString *)title
                        price:(NSDecimalNumber *)price
                         type:(NSString *)type
                   isImported:(BOOL)imported {
    self = [super init];
    
    self->_title = [title copy];
    self->_price = [price copy];
    self->_type = [type copy];
    self->_imported = imported;
    
    return self;
}
@end
