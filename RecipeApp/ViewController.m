//
//  ViewController.m
//  RecipeApp
//
//  Created by Tops on 3/21/16.
//  Copyright (c) 2016 Tops. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tbl_vw;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    arr_category=[[NSArray alloc]init];
    NSURL *url=[NSURL URLWithString:@"http://parth2016-001-site1.btempurl.com/webservice.asmx/JsonCrud1Category"];
    NSData *data=[NSData dataWithContentsOfURL:url];
    arr_category=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    tbl_vw.dataSource=self;
    tbl_vw.delegate=self;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arr_category.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=nil;
    cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text=[[arr_category objectAtIndex:indexPath.row]objectForKey:@"cat_nm"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SubCateViewController *sub=[self.storyboard instantiateViewControllerWithIdentifier:@"SubCateViewController"];
    sub.cat_id=[[arr_category objectAtIndex:indexPath.row]objectForKey:@"cat_id"];
    [self.navigationController pushViewController:sub animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
