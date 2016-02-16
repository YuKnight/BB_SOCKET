//
//  LoginViewController.m
//  BBProject
//
//  Created by qthd on 16/1/18.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#import "LoginViewController.h"
#import "ApolloTReqCommonLogin.h"
#import "ApolloTRespPackage.h"
#import "ApolloTRespCommonLogin.h"

#import "ZLPhotoPickerBrowserViewController.h"
#import "UIImage+ZLPhotoLib.h"
#import "UIButton+WebCache.h"

#import "MJRefresh.h"


@interface LoginViewController () <ZLPhotoPickerBrowserViewControllerDataSource, ZLPhotoPickerBrowserViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *assets;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation LoginViewController

- (NSMutableArray *)assets
{
    if (!_assets)
    {
        _assets = [NSMutableArray arrayWithArray:@[@"http://imgsrc.baidu.com/forum/w%3D580/sign=515dae6de7dde711e7d243fe97eecef4/6c236b600c3387446fc73114530fd9f9d72aa05b.jpg",
                                                   @"http://imgsrc.baidu.com/forum/w%3D580/sign=1875d6474334970a47731027a5cbd1c0/51e876094b36acaf9e7b88947ed98d1000e99cc2.jpg",
                                                   @"http://imgsrc.baidu.com/forum/w%3D580/sign=67ef9ea341166d223877159c76230945/e2f7f736afc3793138419f41e9c4b74543a911b7.jpg",
                                                   @"http://imgsrc.baidu.com/forum/w%3D580/sign=a18485594e086e066aa83f4332087b5a/4a110924ab18972bcd1a19a2e4cd7b899e510ab8.jpg",
                                                   @"http://imgsrc.baidu.com/forum/w%3D580/sign=42d17a169058d109c4e3a9bae159ccd0/61f5b2119313b07e550549600ed7912397dd8c21.jpg"]];
    }
    
    return _assets;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
//    //test MJRefresh
//    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H)];
//    scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        NSLog(@"11111");
//        [scrollView.mj_header endRefreshing];
//    }];
//    
//    scrollView.mj_footer = [MJRefreshAutoStateFooter footerWithRefreshingBlock:^{
//        NSLog(@"222222");
//        [scrollView.mj_footer endRefreshing];
//    }];
//    
//    [self.view addSubview:scrollView];
    
//    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H)];
//    tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        NSLog(@"11111");
//        [tableView.mj_header endRefreshing];
//    }];
    
//    tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//        NSLog(@"222222");
//        [tableView.mj_footer endRefreshing];
//    }];
//    [self.view addSubview:tableView];
    
    
    
    
    //test ZLPhotoLib
//    // 这个属性不能少
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    
//    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H - 128)];
//    _scrollView.backgroundColor = [UIColor redColor];
//    _scrollView.showsHorizontalScrollIndicator = NO;
//    [self.view addSubview:_scrollView];
//
//    // 属性scrollView
//    [self reloadScrollView];
    
//    //test http
//    NSString *password = @"123123";
//    
//    ApolloTReqCommonLogin *request = [[ApolloTReqCommonLogin alloc] init];
//    request.jce_sAccount = @"13534220007";
//    request.jce_sPwd = [password passwordEncrypt];
//    request.jce_sDeviceID = [NSString stringWithNewGUID];
//    request.jce_apnsToken = nil;
//    request.jce_loginType = 0;
//    request.jce_nick = @"";
//    request.jce_sTrdAccount = @"13534220007";
//    request.jce_phonetype = [UIDevice currentDevice].model;
//    request.jce_sTrdPhoto = nil;
//    request.jce_sGender = nil;
//    
//    NSData *requestData = [request packageByCommand:1];
//    BBHttpManager.delegate = self; //设置代理
//    [BBHttpManager sendHttpRequestWithUrlString:URL_ROOT_LOGIN requestData:requestData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 刷新ScrollView
- (void)reloadScrollView
{
//    // 先移除，后添加
//    [[self.scrollView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSUInteger column = 3; //列数
    NSUInteger assetCount = self.assets.count + 1; //加一是为了有个添加button
    CGFloat size = SCREEN_W / column; //button尺寸
    
    for (NSInteger i = 0; i < assetCount; i++)
    {
        NSInteger row = i / column;
        NSInteger col = i % column;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.imageView.contentMode = UIViewContentModeScaleAspectFill;
        button.frame = CGRectMake(size * col, size * row, size, size);
        
        //设置button
        if (i == self.assets.count)
        { //最后一个Button
            [button setImage:[UIImage ml_imageFromBundleNamed:@"iconfont-tianjia"] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(photoSelecte) forControlEvents:UIControlEventTouchUpInside];
        }
        else
        {
            if ([[self.assets objectAtIndex:i] isKindOfClass:[ZLPhotoAssets class]])
            { //如果是本地ZLPhotoAssets就从本地取，否则从网络取
                [button setImage:[self.assets[i] thumbImage] forState:UIControlStateNormal];
            }
            else
            {
                [button sd_setImageWithURL:[NSURL URLWithString:self.assets[i % (self.assets.count)]] forState:UIControlStateNormal];
            }
            button.tag = i;
            [button addTarget:self action:@selector(tapBrowser:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        [self.scrollView addSubview:button];
    }
    
    self.scrollView.contentSize = CGSizeMake(SCREEN_W, CGRectGetMaxY([[self.scrollView.subviews lastObject] frame]));
}

#pragma mark - 选择图片
- (void)photoSelecte
{
    ZLPhotoPickerViewController *photoPickerViewController = [[ZLPhotoPickerViewController alloc] init];
    photoPickerViewController.maxCount = 9;
    photoPickerViewController.status = PickerViewShowStatusCameraRoll;
    photoPickerViewController.callBack = ^(NSArray *status){
        [self.assets addObjectsFromArray:status];
        [self reloadScrollView];
    };
    
    [photoPickerViewController showPickerVc:self];
}

- (void)tapBrowser:(UIButton *)button
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:button.tag inSection:0];
    // 图片游览器
    ZLPhotoPickerBrowserViewController *pickerBrowser = [[ZLPhotoPickerBrowserViewController alloc] init];
    // 淡入淡出效果
     pickerBrowser.status = UIViewAnimationAnimationStatusFade;
    // pickerBrowser.toView = button;
    // 数据源/delegate
    pickerBrowser.delegate = self;
    pickerBrowser.dataSource = self;
    // 当前选中的值
    pickerBrowser.currentIndexPath = [NSIndexPath indexPathForItem:indexPath.row inSection:0];
    // 展示控制器
    [pickerBrowser showPickerVc:self];
}

#pragma mark - <ZLPhotoPickerBrowserViewControllerDataSource>
- (NSInteger)numberOfSectionInPhotosInPickerBrowser:(ZLPhotoPickerBrowserViewController *)pickerBrowser
{
    return 1;
}

- (NSInteger)photoBrowser:(ZLPhotoPickerBrowserViewController *)photoBrowser numberOfItemsInSection:(NSUInteger)section
{
    return self.assets.count;
}

#pragma mark - 每个组展示什么图片,需要包装下ZLPhotoPickerBrowserPhoto
- (ZLPhotoPickerBrowserPhoto *) photoBrowser:(ZLPhotoPickerBrowserViewController *)pickerBrowser photoAtIndexPath:(NSIndexPath *)indexPath
{
    ZLPhotoAssets *photoAssets = [self.assets objectAtIndex:indexPath.row];
    // 包装下imageObj 成 ZLPhotoPickerBrowserPhoto 传给数据源
    ZLPhotoPickerBrowserPhoto *photo = [ZLPhotoPickerBrowserPhoto photoAnyImageObjWith:photoAssets];
    
    UIButton *button = self.scrollView.subviews[indexPath.row];
    photo.toView = button.imageView;
    photo.thumbImage = button.imageView.image; //缩略图
    
    return photo;
}

//- (void)BBHttpRequestSuccess:(HttpResponse *)response
//{
//    DDLogInfo(@"response == %d", [response getStatus]);
//    ApolloTRespPackage *jcePackageResponse = [[ApolloTRespPackage alloc] init];
//    ApolloTRespCommonLogin *jceResponse = [[ApolloTRespCommonLogin alloc] init];
//    
//    [jcePackageResponse fromData:[response getData]];
//    int loginResult = [jceResponse unpackageFromData:[response getData]];
//    if (loginResult == HTTP_RESULT_SUCCEED)
//    {
//        DDLogInfo(@"jceResponse.jce_sDotNetIPPort = %@", jceResponse.jce_sDotNetIPPort);
//        DDLogInfo(@"[jceResponse.jce_uid intValue] == %d", [jceResponse.jce_uid intValue]);
//    }
//}
//
//- (void)BBHttpRequestFailure:(NSError *)error
//{
//    DDLogInfo(@"error == %@", error);
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
