//
//  SubCateViewController.h
//  RecipeApp
//
//  Created by Tops on 3/21/16.
//  Copyright (c) 2016 Tops. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecepieViewController.h"
@interface SubCateViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *arr_sub_cat;
}
@property(retain,nonatomic)NSString *cat_id;
@property (weak, nonatomic) IBOutlet UITableView *tbl_vw;

@end
