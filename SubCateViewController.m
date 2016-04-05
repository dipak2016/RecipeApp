//
//  SubCateViewController.m
//  RecipeApp
//
//  Created by Tops on 3/21/16.
//  Copyright (c) 2016 Tops. All rights reserved.
//

#import "SubCateViewController.h"

@interface SubCateViewController ()

@end

@implementation SubCateViewController
@synthesize tbl_vw,cat_id;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    arr_sub_cat=[[NSArray alloc]init];
    NSString *st_format=[NSString stringWithFormat:@"http://parth2016-001-site1.btempurl.com/webservice.asmx/JsonCrud2SubCategory?c_id=%@",cat_id];
    NSURL *url=[NSURL URLWithString:st_format];
    NSData *data=[NSData dataWithContentsOfURL:url];
    arr_sub_cat=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    tbl_vw.dataSource=self;
    tbl_vw.delegate=self;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arr_sub_cat.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=nil;
    cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text=[[arr_sub_cat objectAtIndex:indexPath.row]objectForKey:@"sub_nm"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecepieViewController *rec=[self.storyboard instantiateViewControllerWithIdentifier:@"RecepieViewController"];
    rec.cat_id=[[arr_sub_cat objectAtIndex:indexPath.row]objectForKey:@"sub_id"];
    [self.navigationController pushViewController:rec animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
