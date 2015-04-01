//
//  ViewController.m
//  spotifyTable
//
//  Created by Robin Malhotra on 01/04/15.
//  Copyright (c) 2015 BatmanAndRobin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) NSMutableArray *data;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 330)];
    [img setContentMode:UIViewContentModeScaleAspectFill];
    [img setTag:2];
    [img setImage:[UIImage imageNamed:@"sda"]];
    [self.view addSubview:img];
    self.data=[[NSMutableArray alloc]init];
    for (int i=0; i<30; i++)
    {
        [self.data addObject:[NSString stringWithFormat:@"asddfad %d",i]];
    }
    
    UITableView *table=[[UITableView alloc]initWithFrame:CGRectMake(0, 80, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    [self.view addSubview:table];
    [table setDataSource:self];
    [table setDelegate:self];
    [table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [table setBackgroundColor:[UIColor clearColor]];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }
    else
    {
        return [self.data count];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        return 250;
    }
    else
    {
        return 40;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];


    }
    
    if (indexPath.section==0)
    {
        cell.backgroundColor=[UIColor clearColor];
        [cell.textLabel setText:@""];
    }
    else
    {
        [cell.textLabel setText:[self.data objectAtIndex:indexPath.row]];
        [cell setBackgroundColor:[UIColor greenColor]];
        [cell.textLabel setText:[self.data objectAtIndex:indexPath.row]];
        
    }
    
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIImageView *img=(UIImageView *)[self.view viewWithTag:2];

    CGFloat y=-scrollView.contentOffset.y;
    if (y>0)
    {
        [img setFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame)+y*CGRectGetWidth(self.view.frame)/330,y+330 )];
        [img setCenter:CGPointMake(self.view.center.x, img.center.y)];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
