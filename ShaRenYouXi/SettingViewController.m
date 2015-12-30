//
//  SettingViewController.m
//  ShaRenYouXi
//
//  Created by 李旗 on 15/12/24.
//  Copyright © 2015年 李旗. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingTabelViewCell.h"
#import "CreatCollectionViewCell.h"
#import "ChangeCollectionViewCell.h"
#import "Random.h"
#import "CreatView.h"
//static NSString * const reuseIdentifier = @"Cell";

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    UIImageView *background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"beijing1"]];
    background.frame = self.view.frame;
    [self.view addSubview:background];
    alert_view = [[CreatView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:alert_view];
    alert_view.hidden = YES;    
    [self creat_tabel_view];
  UIButton *button_return =   [self button_with_image:CGRectMake(10, 40, 50, 20) :@selector(button_return) :@"<返回"];
    button_return.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [self label_with_title:@"天黑请闭眼" :CGRectMake(self.view.frame.size.width/3,30,120,30)];


}
-(void)creat_tabel_view   //创建tabelview
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, (self.view.frame.size.height/5)*2) style:UITableViewStyleGrouped];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    arr_kill_game = [[NSArray alloc]initWithObjects:@"人        数:",@"杀手人数:",@"警察人数:",@"村民人数:", nil];
    [self button_with_image:CGRectMake(self.view.frame.size.width/3, (self.view.frame.size.height/5)*2+20, self.view.frame.size.width/3, 40) :@selector(button_pressed) :@"创建游戏"];

}
-(UIButton *)button_with_image :(CGRect)frame :(SEL)button_pressed :(NSString *)title
{
    UIButton *button = [[UIButton alloc]initWithFrame:frame];
    [button addTarget:self action:button_pressed forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor colorWithRed:26/255.0 green:163/255.0 blue:163/255.0 alpha:1.0];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:24];
    button.layer.borderWidth = 1.0;
    button.layer.borderColor = [UIColor colorWithRed:220/255.0 green:65/255.0 blue:20/255.0 alpha:1.0].CGColor;
    button.layer.cornerRadius = 10.0;
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    return  button;
}
-(void)button_return  //返回按钮
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)button_pressed   //创建游戏按钮
{

    int total = [total_number intValue]; //总人数
    count = [[NSMutableArray alloc]initWithCapacity:0];
    for (int i = total; i > 0; i --)
    {
        NSNumber *number = [NSNumber numberWithInt:i];
        [count addObject:number];//创建1-总人数的为元素的数组
    }
    random_arr = [Random product_random_number_array:count];//产生随机数
    int killer = [killer_number intValue];
    int police = [police_number intValue];
    int civilian = [civilian_number intValue];
    image_arr= [[NSMutableArray alloc]initWithCapacity:0];
    for (int j= 0; j<killer; j++) {
        [image_arr addObject:@"killer"];
    }
    for (int k = 0; k< police; k++) {
        [image_arr addObject:@"police"];
    }
    for (int m = 0; m <civilian; m++) {
        [image_arr addObject:@"civilian"];
    }//根据填写的人数，把相应数量的图片放进数组
    NSMutableDictionary  *dic_image;
    image_dic = [[NSMutableDictionary alloc]initWithCapacity:0];
    for (int n = 1; n < total+1; n++) {
          dic_image = [[NSMutableDictionary alloc]initWithObjectsAndKeys:[image_arr objectAtIndex:n-1],[NSNumber numberWithInt:n],nil];
        
        [image_dic addEntriesFromDictionary:dic_image];
    }//把图片数组和数字一一对应放进字典
    [collection removeFromSuperview];//要把上一次创建的collection先删除掉再创建
    [self creat_collection];
    [self init_image_arr];
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

-(UILabel *)label_with_title :(NSString *)title :(CGRect)frame
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = title;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:24];
    [self.view addSubview:label];
    return label;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return [arr_kill_game count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIndentifier = @"Cell";
    
    
    SettingTabelViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIndentifier];
    if(cell == nil)
    {
        cell = [[SettingTabelViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellWithIndentifier];
        
    }
    
    NSUInteger row = [indexPath row];
    
    cell.textLabel.text = [arr_kill_game objectAtIndex:row];
//    cell.textLabel.textColor = [UIColor colorWithRed:220/255.0 green:65/255.0 blue:20/255.0 alpha:1.0];
    cell.textLabel.textColor =  [UIColor whiteColor];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:20];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.backgroundColor = [UIColor clearColor];
    cell.text_field.tag = row;//text_field的标签
    [cell.text_field addTarget:self action:@selector(textFieldWithText :) forControlEvents:UIControlEventEditingChanged];//text_field编辑时的事件
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
    
}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}//设置头标题的高度

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

-(void)textFieldWithText :(UITextField *)textField
{
    switch (textField.tag)
    {
        case 0:
            total_number = textField.text;
            break;
        case 1:
            killer_number = textField.text;
        case 2:
            police_number = textField.text;
        case 3:
            civilian_number = textField.text;

        default:
            break;
    }
}//根据标签获取text_field的内容



-(void)creat_collection
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;//滚动方向
    flowLayout.minimumLineSpacing = 50;//行间距(最小值)
    flowLayout.minimumInteritemSpacing = 15;//item间距(最小值)
    
    flowLayout.sectionInset = UIEdgeInsetsMake(5, 20, 20, 20);//设置section的边距
    collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, (self.view.frame.size.height/5)*2+64, self.view.frame.size.width, (self.view.frame.size.height/5)*3-64) collectionViewLayout:flowLayout];
    collection.backgroundColor = [UIColor clearColor];
    collection.delegate = self;
    collection.dataSource = self;
    [self.view addSubview:collection];
    for (int i = 0; i<random_arr.count; i ++)
    {
        [collection registerClass:[CreatCollectionViewCell class] forCellWithReuseIdentifier:[NSString stringWithFormat:@"%d",i]];
    }
    //CollectionViewCell的重用会导致cell内容重复引起bug，所以每个cell注册不同的标识可以避免这点
  
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return random_arr.count;
}
-(void)init_image_arr
{
    init_image = [[NSMutableArray alloc]initWithCapacity:0];
    for (int i = 0; i < random_arr.count; i ++) {
        [init_image addObject:@"yikan"];
    }

}//创建看过牌之后的图片的数组

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
     NSUInteger row = [indexPath row];

     CreatCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: [NSString stringWithFormat:@"%d",row] forIndexPath:indexPath];

   
    NSString *random_str = [NSString stringWithFormat:@"%@",[random_arr objectAtIndex:row]];
    cell.textlabel.text = random_str;
    cell.imageView.image = [UIImage imageNamed:[image_dic objectForKey:[random_arr objectAtIndex:row]]];//图片为随机数组在row上的数对应的图片
    cell.backgroundColor = [UIColor clearColor];
    cell.top_image_view.image = [UIImage imageNamed:@"pai"];//用pai图放在最上

  
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width/4 ,80);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;//点击item的事件
{
    UIImage *row_image = [UIImage imageNamed:[image_dic objectForKey:[random_arr objectAtIndex:indexPath.row]]];
   
    alert_view.imageview.image = row_image;//imageview需要作为属性才能改变，如果不是属性显示的只能是一个 不能改变
    alert_view.hidden = NO;
    [self.view bringSubviewToFront:alert_view];
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];//获取点击的当前cell
    UIImageView *after_did = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"yikan"]];
    after_did.frame = CGRectMake(10 , 10, 80, 80);
//    cell.top_image_view.image = [UIImage imageNamed:@"yikan"];
 
    [cell addSubview:after_did];//cell替换已看的图片
}


@end
