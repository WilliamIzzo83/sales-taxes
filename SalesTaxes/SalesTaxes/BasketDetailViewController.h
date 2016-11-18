//
//  BasketDetailViewController.h
//  SalesTaxes
//
//  Created by William Izzo on 18/11/2016.
//  Copyright © 2016 wizzo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductBasket.h"

@class BasketDetailViewController;

@protocol BasketDetailViewControllerDelegate <NSObject>
@optional
- (ProductBasket*)productBasketForDetailViewController:(BasketDetailViewController*)controller;
@end


@interface BasketDetailViewController : UIViewController
@property (weak, nonatomic) id<BasketDetailViewControllerDelegate> delegate;
@end
