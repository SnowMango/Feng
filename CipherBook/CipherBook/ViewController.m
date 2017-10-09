//
//  ViewController.m
//  CipherBook
//
//  Created by zhengfeng on 2017/9/25.
//  Copyright © 2017年 zhengfeng. All rights reserved.
//

#import "ViewController.h"
#import "ZFCipher.h"

typedef enum : NSUInteger {
    NetworkNone,
    Network2G,
    Network3G,
    Network4G,
    NetworkLTE,
    NetworkWIFI
} ZFNetwork;
ZFNetwork ZFNetworkType(void);

#import "ZFCipherView.h"
@interface ViewController ()

@property (nonatomic, strong) ZFCipherView *clipherView;

@end

@implementation ViewController
- (IBAction)changeStyle:(UISegmentedControl*)sender {
    self.clipherView.style = sender.selectedSegmentIndex;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)testShow
{
    NSMutableArray *temp = [NSMutableArray array];
    for (int i = 0; i < 30; i++) {
        ZFCipher * obj = [[ZFCipher alloc] init];
        obj.title = @(i+1).stringValue;
        [temp addObject:obj];
    }
    self.clipherView = [[ZFCipherView alloc] initWithFrame:self.view.bounds];
    self.clipherView.items = temp;
    [self.view addSubview:self.clipherView];
    [self.clipherView reloadData];
    [self.view sendSubviewToBack:self.clipherView];
}


@end

ZFNetwork ZFNetworkType(void){
    NSArray *subviews = [[[[UIApplication sharedApplication] valueForKey:@"statusBar"] valueForKey:@"foregroundView"]subviews];
    id dataNetworkItemView = nil;

    for (id subview in subviews) {
        if([subview isKindOfClass:[NSClassFromString(@"UIStatusBarDataNetworkItemView") class]])
        {
            dataNetworkItemView = subview;
            break;
        }
    }
    ZFNetwork network = [[dataNetworkItemView valueForKey:@"dataNetworkType"] integerValue];
    return network;
}


