//
//  ViewController.m
//  Sample
//
//  Created by Mac Mini1 on 22/06/15.
//  Copyright (c) 2015 Mac Mini1. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#define SYSTEM_VERSION                              ([[UIDevice currentDevice] systemVersion])
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([SYSTEM_VERSION compare:v options:NSNumericSearch] != NSOrderedAscending)
#define IS_IOS8_OR_ABOVE                            (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0"))
@interface ViewController ()
@property (strong, nonatomic) CustomCell *customCell;

@end

@implementation ViewController
@synthesize mArray,mTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    mArray = [[NSMutableArray alloc]init];
  //  mTableView.estimatedRowHeight = 100;
    mTableView.rowHeight = UITableViewAutomaticDimension;
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    
   /*  NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"http://api.kivaws.org/v1/loans/search.json?status=fundraising"] completionHandler:^(NSData *data,NSURLResponse *response,NSError *error){
       
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
       
        mArray = [json objectForKey:@"loans"];
         NSLog(@"json dict is :%@",mArray);
               
        dispatch_async(dispatch_get_main_queue(), ^{
           
            [self.mTableView reloadData];
            if ([[NSThread currentThread] isMainThread]){
                NSLog(@"In main thread--completion handler");
            }
            else{
                NSLog(@"Not in main thread--completion handler");
            }
        });

    }];
    [dataTask resume];*/
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"SourceData" ofType:@"plist"];
    mArray = [NSMutableArray arrayWithContentsOfFile:filePath];
    NSLog(@"mArray : %@",mArray);
    mTableView.estimatedRowHeight = 44;
    mTableView.rowHeight = UITableViewAutomaticDimension;
    
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    
    
    [self.mTableView reloadData];
    
    
   // compare two NSArray
    NSArray *arr1 = [[NSArray alloc]initWithObjects:@"aa",@"bb",@"cc",nil];
    NSArray *arr2 = [[NSArray alloc]initWithObjects:@"aa",@"cc",@"bb",nil];
    
    arr1 = [arr1 sortedArrayUsingSelector:@selector(compare:)];
    arr2 = [arr2 sortedArrayUsingSelector:@selector(compare:)];
    if ([arr1 isEqualToArray:arr2]) {
        
        NSLog(@"both are same");
    }
    else{
        
        NSLog(@"both are different");
    }
    
    NSSet *set1 = [NSSet setWithArray:arr1];
    NSSet *set2 = [NSSet setWithArray:arr2];
    if ([set1 isEqual:set2]) {
        
        NSLog(@"Equals");
        
    }
    else{
        
        NSLog(@"Not equals");
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  //  [self configureCell:_stubCell atIndexPath:indexPath];
    //[_stubCell layoutSubviews];
   
    
    if(!_customCell) {
        
        _customCell = [self.mTableView dequeueReusableCellWithIdentifier:@"simpleCell"];
    }

    [self configureCell:_customCell atIndexPath:indexPath];
   // [_customCell updateConstraintsIfNeeded];
   // [_customCell layoutIfNeeded];
   //[_customCell layoutIfNeeded];
     // [_customCell layoutSubviews];
    CGFloat height = [_customCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
   
    return height + 1;// Add 1.0f for the cell separator height
}


-(void)configureCell:(CustomCell*)cell atIndexPath:(NSIndexPath*)indexPath{
    
 //  cell.nameLabel.text = [[mArray objectAtIndex:indexPath.row] objectForKey:@"use"];
      cell.nameLabel.text = [self.mArray objectAtIndex:indexPath.row];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [mArray count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *simpleIdentifier = @"simpleCell";
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleIdentifier];
 
    /*if (cell==nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleIdentifier];
     
    }*/
    [self configureCell:cell atIndexPath:indexPath];
    
//   cell.nameLabel.text = [[mArray objectAtIndex:indexPath.row] objectForKey:@"use"];
  //  cell.activityLabel.text = [[mArray objectAtIndex:indexPath.row] objectForKey:@"activity"];
   return cell;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
