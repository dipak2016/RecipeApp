//
//  ViewController.h
//  RecipeApp
//
//  Created by Tops on 3/21/16.
//  Copyright (c) 2016 Tops. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubCateViewController.h"
@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *arr_category;
}
@property (weak, nonatomic) IBOutlet UITableView *tbl_vw;


@end

