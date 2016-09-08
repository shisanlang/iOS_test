//
//  ViewController.m
//  ppt
//
//  Created by 十三郎 on 16/9/5.
//  Copyright © 2016年 QianHai. All rights reserved.
//

#import "ViewController.h"
#import "PPT2ImageController.h"


@interface ViewController () <QLPreviewControllerDelegate,QLPreviewControllerDataSource,UIDocumentInteractionControllerDelegate> {
    NSMutableArray * samplepdf;
    
//    UIImageView * imageV1;
//    UIImageView * imageV2;
    UIScrollView * sv;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(50, 20, 100, 30);
    [button setTitle:@"打开ppt" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonTouchUp) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    samplepdf = [[NSMutableArray alloc]initWithObjects:@"1.doc",@"3.ppt",@"4.pptx", nil];
    
    
//    imageV1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 150, 150, 50)];
//    [self.view addSubview:imageV1];
//    
//    imageV2 = [[UIImageView alloc]initWithFrame:CGRectMake(170, 150, 150, 50)];
//    [self.view addSubview:imageV2];
    sv = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 70, 400, 300)];
    sv.backgroundColor = [UIColor greenColor];
    sv.contentSize =CGSizeMake(300*20, 200);
    [self.view addSubview:sv];
}

- (void)buttonTouchUp {
    
    NSString * filePath = samplepdf[2];
    NSString * fn = [filePath stringByDeletingPathExtension];
    NSString * fe = [filePath pathExtension];
    NSString * pathppt = [[NSBundle mainBundle] pathForResource:fn ofType:fe];
    
    PPT2ImageController * ppt2image = [[PPT2ImageController alloc]init];
    ppt2image.frame = CGRectMake(0, 500, 200, 200);
    [ppt2image imageArrayWithPptPath:[NSURL fileURLWithPath:pathppt]];
    
    [ppt2image pptImageArrayWithBlock:^(NSArray * imageArray){
        NSLog(@"imageArray = %@",imageArray);
//        imageV1.image = imageArray[0];
//        imageV2.image = imageArray[1];
        for (int i=0; i<imageArray.count; i++) {
            UIImageView * imageV = [[UIImageView alloc]initWithFrame:CGRectMake(i*350, 30, 320, 180)];
            imageV.image = imageArray[i];
            [sv addSubview:imageV];
        }
    }];
    [self.view addSubview:ppt2image];

//    NSArray * array = [ppt2image imageArrayWithPptPath:[NSURL fileURLWithPath:pathppt]];
//    imageV1.image = array[0];
//    imageV2.image = array[1];
    
//    QLPreviewController *ql = [[QLPreviewController alloc]initWithNibName:nil bundle:nil];
////    ql.navigationController.navigationBarHidden = YES;
//    // Set data source
//    ql.dataSource = self;
//    ql.delegate = self;
//    
//    // Which item to preview
//    [ql setCurrentPreviewItemIndex:1];
//    
//    UINavigationController * navigationController = [[UINavigationController alloc]initWithRootViewController:ql];
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(popViewController)];
//    ql.navigationItem.leftBarButtonItem = backButton;
//    
//    [self presentModalViewController:navigationController animated:YES];
    
    
//    NSString * filePath = samplepdf[1];
//    NSString * fn = [filePath stringByDeletingPathExtension];
//    NSString * fe = [filePath pathExtension];
//    NSString * pathppt = [[NSBundle mainBundle] pathForResource:fn ofType:fe];
//    
//    UIDocumentInteractionController * documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:[NSURL fileURLWithPath:pathppt]];
//    // Configure Document Interaction Controller
//    [documentInteractionController setDelegate:self];
//    documentInteractionController.name=@"test";//这里就可以自定义控制栏上的标题了
//    // Preview PDF
//    [documentInteractionController presentPreviewAnimated:YES];
}

- (void)popViewController {
    [super dismissViewControllerAnimated:YES completion:^{}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - quicklook
- (NSInteger) numberOfPreviewItemsInPreviewController: (QLPreviewController *) controller
{
    return samplepdf.count;
}

- (id <QLPreviewItem>)previewController: (QLPreviewController *)controller previewItemAtIndex:(NSInteger)index
{
    
//    NSString * pathppt = [[NSBundle mainBundle] pathForResource:@"3" ofType:@"ppt"];
    NSString * filePath = samplepdf[index];
    NSString * fn = [filePath stringByDeletingPathExtension];
    NSString * fe = [filePath pathExtension];
    
    NSString * pathppt = [[NSBundle mainBundle] pathForResource:fn ofType:fe];

    
    return [NSURL fileURLWithPath:pathppt];
}

- (CGRect)previewController:(QLPreviewController *)controller frameForPreviewItem:(nonnull id<QLPreviewItem>)item inSourceView:(UIView *__autoreleasing  _Nullable * _Nonnull)view {
    return CGRectMake(0, 0, 100, 50);
}

- (UIImage *)previewController:(QLPreviewController *)controller transitionImageForPreviewItem:(id <QLPreviewItem>)item contentRect:(CGRect *)contentRect {
    return nil;
}

@end
