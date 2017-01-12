//
//  TestViewController.m
//  Demo
//
//  Created by zhengfeng on 16/11/4.
//
//

#import "TestViewController.h"
#import "MBProgressHUD.h"
#import "FShowViewController.h"

@interface TestViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) NSArray * drawTypes;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    UIImage *image = [UIImage imageNamed:@"login_1"];
    UIImageView * iv = [[UIImageView alloc] initWithImage: image];
    iv.frame = CGRectMake(0, 0, 30, 30);
    iv.center = self.view.center;
    iv.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:iv];
    self.tableView.rowHeight = 60;
    self.tableView.tableFooterView = [UIView new];
    self.drawTypes = @[@{@"CoreGraphics":@"DrawView"}, @{@"UIBezierPath":@"BezierView"}];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.drawTypes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellId = @[@"Basic",@"Value1",@"Value2",@"Subtitle"][0];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:10];
    cell.textLabel.text = [self.drawTypes[indexPath.row] allKeys].firstObject;
    return cell;
}

#pragma mark - UITableViewDataSource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSString *classStr = [self.drawTypes[indexPath.row] allValues].firstObject;
    UIView *showView = [[NSClassFromString(classStr) alloc] init];
    showView.frame = self.view.bounds;
    FShowViewController *vc = (FShowViewController *)self.navigationController.topViewController;
    vc.showView = showView;
    vc.title = [self.drawTypes[indexPath.row] allKeys].firstObject;
}


- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(nullable id)sender
{
    return YES;
}
@end