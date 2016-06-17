//
//  ViewController.h
//  Sample
//
//  Created by Mac Mini1 on 22/06/15.
//  Copyright (c) 2015 Mac Mini1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *mArray;

@property(nonatomic,weak)IBOutlet UITableView *mTableView;

@end

