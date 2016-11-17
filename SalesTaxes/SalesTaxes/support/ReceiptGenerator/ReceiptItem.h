//
//  ReceiptItem.h
//  SalesTaxes
//
//  Created by William Izzo on 17/11/16.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * A receipt item holds a summary, a price before tax, a price after
 * taxes and total tax amount.
 */
@interface ReceiptItem : NSObject<NSCopying>
- (instancetype)initWithSummary:(NSString*)summary
               priceBeforeTaxes:(NSDecimalNumber*)priceBeforeTaxes
                priceAfterTaxes:(NSDecimalNumber*)priceAfterTaxes
                    taxesAmount:(NSDecimalNumber*)taxesAmount;

/// A summary describing what the entry is about.
@property (readonly, nonatomic) NSString* summary;
/// The price before taxes application.
@property (readonly, nonatomic) NSDecimalNumber* priceBeforeTaxes;
/// The price after taxes application.
@property (readonly, nonatomic) NSDecimalNumber* priceAfterTaxes;
/// The total taxes amount.
@property (readonly, nonatomic) NSDecimalNumber* taxesAmount;
@end
