//
//  ViewController.m
//  BrowserPhotos
//
//  Created by Liandi on 2019/1/16.
//  Copyright © 2019年 Liandi. All rights reserved.
//

#import "ViewController.h"
#import "RepairBrowserPhotosViewController.h"

@interface ViewController ()
@property(nonatomic,strong) RepairBrowserPhotosViewController *BrowserPhotos;
@property(nonatomic,strong) NSArray *netImages;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.netImages = @[@"http://img4.duitang.com/uploads/item/201508/11/20150811220329_XyZAv.png",
                           @"http://img5q.duitang.com/uploads/item/201507/22/20150722145119_hJnyP.jpeg",];
    self.netImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"img-food1"], [UIImage imageNamed:@"img-food2"], [UIImage imageNamed:@"img-food3"], nil];
}

- (IBAction)clickOn:(id)sender {
    self.BrowserPhotos = [[RepairBrowserPhotosViewController alloc]initWithImageArray:self.netImages currentIndex:0];
    [self presentViewController:self.BrowserPhotos animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
