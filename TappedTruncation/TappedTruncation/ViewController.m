//
//  ViewController.m
//  TappedTruncation
//
//  Created by zhuke on 2018/8/8.
//  Copyright © 2018年 zhuke. All rights reserved.
//

#import "ViewController.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "XHDescNode.h"

@interface ViewController () <ASTableDelegate, ASTableDataSource>

@property (nonatomic, strong) ASTableNode *tableNode;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableNode = [[ASTableNode alloc] initWithStyle:UITableViewStylePlain];
    _tableNode.backgroundColor = [UIColor whiteColor];
    _tableNode.delegate = self;
    _tableNode.dataSource = self;
    _tableNode.frame = self.view.bounds;
    
    _tableNode.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    _tableNode.view.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubnode:_tableNode];
}
#pragma mark - ASTableDelegate, ASTableDataSource
- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    XHDescNode2 *node = [[XHDescNode2 alloc] initWithDesc:self.descModel];
    XHDescNode *node = [[XHDescNode alloc] init];
    return ^{
        return node;
    };
}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}


@end
