//
//  BasketDetailViewController.m
//  SalesTaxes
//
//  Created by William Izzo on 18/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import "BasketDetailViewController.h"
#import "TaxCalculator.h"
#import "ReceiptGenerator.h"
#import "DecimalSupport.h"

@interface BasketDetailViewController ()
/// Sets up a sample tax calculator 
+ (TaxCalculator*)sampleTaxCalculator;
- (void)displayReceipt:(Receipt*)receipt;
@property (weak, nonatomic) IBOutlet UILabel *receiptTextView;
@end

@implementation BasketDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.delegate == nil) {
        return;
    }
    
    if (![self.delegate
          respondsToSelector:@selector(productBasketForDetailViewController:)]) {
        return;
    }
    
    ProductBasket* basket = [self.delegate
                             productBasketForDetailViewController:self];
    
    TaxCalculator* taxCalc = [BasketDetailViewController sampleTaxCalculator];
    
    
    Receipt* receipt =
    [ReceiptGenerator generateReceiptFromItemsInBasket:basket
                                     withTaxCalculator:taxCalc];
    
    [self displayReceipt:receipt];
}

- (void)displayReceipt:(Receipt *)receipt {
    NSMutableString* receiptString = [[NSMutableString alloc] init];
    
    for (ReceiptItem* rptItem in receipt.items) {
        [receiptString appendFormat:@"%@ : %@\n",
         rptItem.summary,
         rptItem.priceAfterTaxes];
    }
    [receiptString appendString:@"\n"];
    [receiptString appendFormat:@"Sales Taxes: %@\n", receipt.total.taxesAmount];
    [receiptString appendFormat:@"Total: %@", receipt.total.priceAfterTaxes];
    
    self.receiptTextView.text = receiptString;
}

#pragma mark - Tax calculator setup
+ (TaxCalculator*)sampleTaxCalculator {
    ApplicableTaxRule* defBaseRule = [[ApplicableTaxRule alloc]
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
    
    ApplicableTaxRule* defImportRule =
    [[ApplicableTaxRule alloc] initWithIdentifier:@"default"
                                    andPercentage:dec(0,0,NO)];
    
    ApplicableTaxRule* importRule =
    [[ApplicableTaxRule alloc] initWithIdentifier:@"import"
                                    andPercentage:dec(5,-2,NO)];
    
    TaxCalculatorRules* importRules = @[defImportRule, importRule];
    
    TaxCalculatorRules* baseTaxRules = @[defBaseRule,
                                         booksRule,
                                         foodRule,
                                         medicalRule];
    
    ApplicableTax* baseTax = [[ApplicableTax alloc] initWithIdentifier:@"base"
                                                             andTaxRules:baseTaxRules];
    
    ApplicableTax* importTax = [[ApplicableTax alloc] initWithIdentifier:@"import"
                                                             andTaxRules:importRules];
    
    TaxCalculatorApplicableTaxes* taxes = @[baseTax,
                                            importTax];
    
    return [[TaxCalculator alloc] initWithApplicableTaxes:taxes];
}




@end
