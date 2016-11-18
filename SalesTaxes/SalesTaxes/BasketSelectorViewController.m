//
//  ViewController.m
//  SalesTaxes
//
//  Created by William Izzo on 15/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import "BasketSelectorViewController.h"
#import "ProductBasket.h"
#import "DecimalSupport.h"
#import "BasketDetailViewController.h"

@interface BasketSelectorViewController ()<UITableViewDataSource,
UITableViewDelegate,
BasketDetailViewControllerDelegate>

- (void)registerTableViewCellTemplate;
+ (NSArray<ProductBasket*>*)sampleData;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray<ProductBasket*>* data;
@property (weak, nonatomic) ProductBasket* selectedBasket;
@end

@implementation BasketSelectorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self registerTableViewCellTemplate];
    self.data = [BasketSelectorViewController sampleData];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)registerTableViewCellTemplate {
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"basket_cell"];
}

#pragma mark - table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell* cell =
    [tableView dequeueReusableCellWithIdentifier:@"basket_cell"
                                    forIndexPath:indexPath];
    
    
    NSUInteger basketItemCount = self.data[indexPath.row].productCount;
    
    cell.textLabel.text = [NSString stringWithFormat:@"Basket #%@",
                           @(indexPath.row)];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ items",
                                 @(basketItemCount)];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if(![segue.destinationViewController
         isKindOfClass:[BasketDetailViewController class]]) {
        return;
    }
    
    BasketDetailViewController* detailVC =
    (BasketDetailViewController*)segue.destinationViewController;
    
    detailVC.delegate = self;
}

#pragma mark - basket detail delegate -
- (ProductBasket*)productBasketForDetailViewController:(BasketDetailViewController *)controller {
    return self.selectedBasket;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedBasket = self.data[indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0;
}
#pragma mark - mock up sample data definition
+ (NSArray<ProductBasket*>*)sampleData {
    NSArray<TaxCalculatorItem*>* firstBasketItems = (NSArray<TaxCalculatorItem*>*)
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
    
    NSArray<TaxCalculatorItem*>* secondBasketItems = (NSArray<TaxCalculatorItem*>*)
    @[
      [[TaxCalculatorItem alloc] initWithName:@"imported chocolate box"
                                        price:dec(10, 0, NO)
                                andProperties:@[@"food", @"import"]],
      [[TaxCalculatorItem alloc] initWithName:@"imported perfume"
                                        price:dec(4750, -2, NO)
                                andProperties:@[@"perfume", @"import"]]
      ];
    
    NSArray<TaxCalculatorItem*>* thirdBasketItems = (NSArray<TaxCalculatorItem*>*)
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
    
    NSArray<NSArray<TaxCalculatorItem*>*>* basketItems = @[firstBasketItems,
                                                           secondBasketItems,
                                                           thirdBasketItems];
    
    NSMutableArray<ProductBasket*>* baskets = [NSMutableArray<ProductBasket*>
                                               array];
    
    for (NSArray<TaxCalculatorItem*>* items in basketItems) {
        ProductBasket* basket = [[ProductBasket alloc] init];
        for (TaxCalculatorItem* item in items) {
            [basket addItem:item];
        }
        [baskets addObject:basket];
    }
    
    
    return [NSArray<ProductBasket*> arrayWithArray:baskets];
}

@end
