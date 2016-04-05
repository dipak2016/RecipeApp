//
//  RecepieViewController.m
//  RecipeApp
//
//  Created by Tops on 3/21/16.
//  Copyright (c) 2016 Tops. All rights reserved.
//

#import "RecepieViewController.h"

@interface RecepieViewController ()

@end

@implementation RecepieViewController
@synthesize tbl_vw,cat_id;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    arr_recepie=[[NSArray alloc]init];
    NSString *st_format=[NSString stringWithFormat:@"http://parth2016-001-site1.btempurl.com/webservice.asmx/JsonCrud3SelectRecipe?c_id=%@",cat_id];
    NSURL *url=[NSURL URLWithString:st_format];
    NSData *data=[NSData dataWithContentsOfURL:url];
    arr_recepie=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    tbl_vw.dataSource=self;
    tbl_vw.delegate=self;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arr_recepie.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=nil;
    cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    cell.textLabel.text=[[arr_recepie objectAtIndex:indexPath.row]objectForKey:@"res_nm"];
    cell.detailTextLabel.text=[[arr_recepie objectAtIndex:indexPath.row]objectForKey:@"res_desc"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
