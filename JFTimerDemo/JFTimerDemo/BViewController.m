//
//  BViewController.m
//  JFTimerDemo
//
//  Created by 李继峰 on 2019/3/18.
//  Copyright © 2019 sss. All rights reserved.
//
//1.定时器不准问题
// 定时器默认创建出来在runloop的default模式下，当滑动scroolview时，runloop 的模式发生变化为tracking模式，模式只能同时存在一种，所以就导致了定时器不走。
//2.解决
//办法1：把定时器加到 tracking模式或者 common模式（主线程耗时操作时，定时器不准）
//方法2: 把定时器放在子线程里 子线程需要手动开启runloop（定时器会精准些）




#import "BViewController.h"
//#import "NSTimer+JFCrazy.h"
#import "NSTimer+JFReallyCrazy.h"

@interface BViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,assign) NSInteger time;

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.time = 0;
    [self.view addSubview:self.tableView];


    //1 主线程生效
    [self addTimer];
    
    //2 子线程
    NSThread *thred = [[NSThread alloc]initWithTarget:self selector:@selector(addTimer) object:nil];
    [thred start];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
}

- (void)backAction{

//    [self.timer invalidate];
//    self.timer = nil;
 
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addTimer{
    
//    子
//    [self.timer fire];
    
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] run];
    
    //主
    __weak typeof(self) weakSelf = self;
//    self.timer = [NSTimer jf_scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull t) {
//        __strong typeof(weakSelf) strongSelf = weakSelf;
//        [strongSelf timerAction];
//    }];
    
//    if (@available(iOS 10.0, *)) {
//        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//            [weakSelf timerAction];
//        }];
//    } else {
        // Fallback on earlier versions
       self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES blockTimer:^(NSTimer * _Nonnull t) {
            [weakSelf timerAction];
        }];
//    }
//    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
    
}

- (void)longTimeAction{
    
    for (int i = 0; i < 100000; i ++) {
        
        @autoreleasepool {
            
            NSString *filePath = [[NSBundle mainBundle]pathForResource:@"bj.jpg" ofType:nil];
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfFile:filePath]];
        }
        
    }
}

//- (NSTimer *)timer{
//    __weak typeof(self) weakSelf = self;
//    if (!_timer) {
//
//    }
//    return _timer;
//}

- (void)timerAction{
    
    self.time ++;
    if (self.time == 5) {
//        [self performSelectorOnMainThread:@selector(longTimeAction) withObject:nil waitUntilDone:NO];
    }
    NSLog(@"-----%ld",self.time);
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 375, 667) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor lightGrayColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 40;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ddd"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ddd"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"section == %ld row == %ld",indexPath.section,indexPath.row];
    
    return cell;
}

- (void)dealloc{

    NSLog(@"BController 销毁了");
}

@end
