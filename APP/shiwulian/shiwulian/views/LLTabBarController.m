//
//  LLTabBarController.m
//  shiwulian
//
//  Created by lin zoup on 2/26/16.
//  Copyright © 2016 shiwulian. All rights reserved.
//

#import "LLTabBarController.h"

@interface LLTabBarController () {
    NSMutableArray *buttons;
    int curSelectedIndex;
//    NSArray *viewControllers;
    UINavigationController *currentController;
}

@property (nonatomic, strong) NSArray *viewControllers;

@end

@implementation LLTabBarController

-(instancetype)init {
    self = [super init];
    if (self) {
        [self createSubViews];
    }
    return self;
}

-(void)createSubViews {
    
    UIViewController *c1 = [[UIViewController alloc] init];
    c1.view.backgroundColor = [UIColor redColor];
    c1.tabBarItem.title = @"主页";
    
    UIViewController *c2 = [[UIViewController alloc] init];
    c2.view.backgroundColor = [UIColor yellowColor];
    c2.tabBarItem.title = @"动态";
    
    UIViewController *c3 = [[UIViewController alloc] init];
    c3.view.backgroundColor = [UIColor greenColor];
    c3.tabBarItem.title = @"我的";
    
    //    self.viewControllers = @[c1,c2,c3];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建三个导航视图
    UINavigationController *nag1 = [[UINavigationController alloc] initWithRootViewController:c1];
    [self addChildViewController:nag1];
    nag1.view.frame = CGRectMake(0, 0, 200, 200);
    UINavigationController *nag2 = [[UINavigationController alloc] initWithRootViewController:c2];
    [self addChildViewController:nag2];
    nag2.view.frame = CGRectMake(0, 0, 200, 200);
    UINavigationController *nag3 = [[UINavigationController alloc] initWithRootViewController:c3];
    [self addChildViewController:nag3];
    nag3.view.frame = CGRectMake(0, 0, 200, 200);
    
    self.viewControllers = @[nag1,nag2,nag3];
    [self.view addSubview:nag1.view];
    [nag1 didMoveToParentViewController:self];
    currentController = nag1;
    
    //创建三个按钮
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(20, 600, 50, 30)];
    v1.backgroundColor = [UIColor yellowColor];
    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(150, 600, 50, 30)];
    v2.backgroundColor = [UIColor purpleColor];
    UIView *v3 = [[UIView alloc] initWithFrame:CGRectMake(300, 600, 50, 30)];
    v3.backgroundColor = [UIColor blackColor];
    [self.view addSubview:v1];
    [self.view addSubview:v2];
    [self.view addSubview:v3];
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(switch1:)];
    tap1.numberOfTouchesRequired = 1;
    tap1.numberOfTapsRequired = 1;
    [v1 addGestureRecognizer:tap1];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(switch2:)];
    tap2.numberOfTouchesRequired = 1;
    tap2.numberOfTapsRequired = 1;
    [v2 addGestureRecognizer:tap2];
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(switch3:)];
    tap3.numberOfTouchesRequired = 1;
    tap3.numberOfTapsRequired = 1;
    [v3 addGestureRecognizer:tap3];
    
    
    //test button
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(200, 400, 100, 50)];
//    btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(200, 400, 100, 50);
    [btn addTarget:self action:@selector(pushBtn) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor blueColor];
//    btn.userInteractionEnabled = YES;
    [self.view addSubview:btn];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  
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

-(void)switch1:(UITapGestureRecognizer *)sender {
    UINavigationController *n0 = [self.childViewControllers objectAtIndex:0];
    if (n0 != currentController) {
        [self transitionFromViewController:currentController toViewController:n0 duration:0.1 options:UIViewAnimationOptionTransitionNone animations:nil completion:nil];
        currentController = n0;
    }
    
}
-(void)switch2:(UITapGestureRecognizer *)sender {
    UINavigationController *n1 = [self.childViewControllers objectAtIndex:1];
    if (n1 != currentController) {
        [self transitionFromViewController:currentController toViewController:n1 duration:0.1 options:UIViewAnimationOptionTransitionNone animations:nil completion:nil];
        currentController = n1;
        
    } else {
        NSLog(@"###########refresh views");
    }
}
-(void)switch3:(UITapGestureRecognizer *)sender {
    UINavigationController *n2 = [self.childViewControllers objectAtIndex:2];
    if (n2 != currentController) {
        [self transitionFromViewController:currentController toViewController:n2 duration:0.1 options:UIViewAnimationOptionTransitionNone animations:nil completion:nil];
        currentController = n2;
    }
}

-(void)pushBtn {
    //push a new controller
    UIViewController *newView = [[UIViewController alloc] init];
    newView.view.backgroundColor = [UIColor blackColor];
    [currentController pushViewController:newView animated:YES];
}

@end
