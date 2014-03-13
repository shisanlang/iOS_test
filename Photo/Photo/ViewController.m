//
//  ViewController.m
//  Photo
//
//  Created by duan on 13-5-22.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    

    UIButton *but  = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    but.frame = CGRectMake(50, 100, 50, 20);
    [but setTitle:@"按钮" forState:UIControlStateNormal];
    [but addTarget:self action:@selector(doSth) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
}

- (void)doSth
{
    //    UIActionSheet *BuyBillActionSheet = [[UIActionSheet alloc]init];
    UIActionSheet * BuyBillActionSheet=[[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照上传",@"相册上传", nil];
    [BuyBillActionSheet showInView:self.view];
    //    UIWindow* window = [[[UIApplication sharedApplication] delegate] window];
    //    [BuyBillActionSheet showInView:[[[[UIApplication sharedApplication] keyWindow] subviews] lastObject]];
}

- (void)viewWillAppear:(BOOL)animated
{
    UIImagePickerController * imagepicker = [[UIImagePickerController alloc]init];
    //UIImagePickerController静态方法判断设备是否支持照相机／图片库／相册功能
    /*
     typedef NS_ENUM(NSInteger, UIImagePickerControllerSourceType) {
     UIImagePickerControllerSourceTypePhotoLibrary,
     UIImagePickerControllerSourceTypeCamera,
     UIImagePickerControllerSourceTypeSavedPhotosAlbum
     };
     */
    BOOL isCameraSupport = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    NSLog(@"support camera:%d",isCameraSupport);
    
    //UIImagePickerController静态方法判断设备是否支持前置摄像头／后置摄像头
    /*
     typedef NS_ENUM(NSInteger, UIImagePickerControllerCameraDevice) {
     UIImagePickerControllerCameraDeviceRear,
     UIImagePickerControllerCameraDeviceFront
     };
     */
    BOOL isRearSupport = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
    NSLog(@"rear support:%d",isRearSupport);
    
    //UIImagePickerController静态方法判断设备是否支持前置摄像头闪光灯／后置摄像头闪光灯
    /*
     typedef NS_ENUM(NSInteger, UIImagePickerControllerCameraDevice) {
     UIImagePickerControllerCameraDeviceRear,
     UIImagePickerControllerCameraDeviceFront
     };
     */
    BOOL isFlushSupport = [UIImagePickerController isFlashAvailableForCameraDevice:UIImagePickerControllerCameraDeviceRear];
    NSLog(@"rear flash support:%d",isFlushSupport);
    
    //UIImagePickerController静态方法返回前置摄像头／后置摄像头支持的拍摄类型
    /*
     typedef NS_ENUM(NSInteger, UIImagePickerControllerCameraDevice) {
     UIImagePickerControllerCameraDeviceRear,
     UIImagePickerControllerCameraDeviceFront
     };
     */
    //返回类型有照片和视频
    /*
     enum {
     UIImagePickerControllerCameraCaptureModePhoto,
     UIImagePickerControllerCameraCaptureModeVideo
     };
     typedef NSUInteger UIImagePickerControllerCameraCaptureMode;
     */
    NSArray* captureModes = [UIImagePickerController availableCaptureModesForCameraDevice:UIImagePickerControllerCameraDeviceRear];
    for (NSNumber* mode in captureModes) {
        NSLog(@"capture modes:%d",[mode integerValue]);
    }
    
    //UIImagePickerController静态方法返回照相机／相册／照片库所支持的媒体类型
    /*
     typedef NS_ENUM(NSInteger, UIImagePickerControllerSourceType) {
     UIImagePickerControllerSourceTypePhotoLibrary,
     UIImagePickerControllerSourceTypeCamera,
     UIImagePickerControllerSourceTypeSavedPhotosAlbum
     };
     */
    //返回类型有kUTTypeMovie,kUTTypeImage，其他类型均在<MobileCoreServices/MobileCoreServices.h>下
    NSArray* mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    for (NSString* type in mediaTypes) {
        NSLog(@"media types:%@",type);
    }
    
    
    /*
     typedef NS_ENUM(NSInteger, AVAuthorizationStatus) {
     
     AVAuthorizationStatusNotDetermined = 0,
     
     AVAuthorizationStatusRestricted,
     
     AVAuthorizationStatusDenied,
     
     AVAuthorizationStatusAuthorized
     
     } NS_AVAILABLE_IOS(7_0);
     */
//    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];  //获取对摄像头的访问权限。
//
//    NSLog(@"%d,%d", authStatus, AVAuthorizationStatusDenied);
//    
//    if(authStatus == AVAuthorizationStatusDenied){
//        //没有使用权限
//        NSLog(@"de");
//    }
    
    
//    __block BOOL isAvalible = NO;
//    NSString *mediaType = AVMediaTypeVideo; // Or AVMediaTypeAudio
//    
//    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
//    
//    // This status is normally not visible—the AVCaptureDevice class methods for discovering devices do not return devices the user is restricted from accessing.
//    if(authStatus == AVAuthorizationStatusRestricted){
//        NSLog(@"Restricted");
//    }
//    
//    // The user has explicitly denied permission for media capture.
//    else if(authStatus == AVAuthorizationStatusDenied){
//        NSLog(@"Denied");
//        
//    }
//    
//    // The user has explicitly granted permission for media capture, or explicit user permission is not necessary for the media type in question.
//    else if(authStatus == AVAuthorizationStatusAuthorized){
//        NSLog(@"Authorized");
//        isAvalible = YES;
//    }
//    
//    // Explicit user permission is required for media capture, but the user has not yet granted or denied such permission.
//    else if(authStatus == AVAuthorizationStatusNotDetermined){
//        
//        [AVCaptureDevice requestAccessForMediaType:mediaType completionHandler:^(BOOL granted) {
//            if(granted){
//                NSLog(@"Granted access to %@", mediaType);
//            }
//            else {
//                NSLog(@"Not granted access to %@", mediaType);
//            }
//        }];
//        
//    }
//    
//    else {
//        NSLog(@"Unknown authorization status");
//    }
}



- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:{
            [self showImagePicker:TRUE];
        }
            
            break;
        case 1:{
            [self showImagePicker:FALSE];
            
        }
            break;
            
        default:
            break;
    }
    
}

- (void)showImagePicker:(BOOL)chooseCamera
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
	imagePicker.delegate = self;
    
	if (chooseCamera) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    [self presentModalViewController:imagePicker animated:YES];
    
    [imagePicker release];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    
    [self dismissModalViewControllerAnimated:YES];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    
	if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
		UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
	}
	
    UIImage *newimage;
    if (image.size.width>2000) {
        newimage=[self resizeImage:image Width:2000 Height:2000];
    }else {
        newimage=image;
    }
    
//    NSData *Data= UIImageJPEGRepresentation(newimage,0.8);
    
//    NSString *newimageFileName=[[StorageService getDocumentStoreUrl] stringByAppendingPathComponent:@"WaitUpLoadImage.jpg"];
    
//    NSLog(@"newimageFileName=%@",newimageFileName);
//    
//    [Data writeToFile:newimageFileName atomically:YES];
    
}

-(void)image:(UIImage*)image didFinishSavingWithError:(NSError*)error contextInfo:(void*)contextInfo
{
	if (error !=NULL) {
		
	}
	else{
        
        
		
	}
    
}


- (UIImage *)resizeImage:(UIImage *)orgImg Width:(NSInteger)tarWidth Height:(NSInteger)tarHeight
{
    
    
    
	UIImage *retImage;
	if (orgImg.size.width > tarWidth || orgImg.size.height > tarHeight)
	{
		int w = orgImg.size.width;
		int h = orgImg.size.height;
		float k = (float) tarWidth / w;
		if ((float) w / tarWidth > (float) h / tarHeight) {
			w = tarWidth;
			h = (int)(h * k);
		} else {
			k = (float) tarHeight / h;
			h = tarHeight;
			w = (int) (w * k);
		}
        CGSize imgSize = CGSizeMake(w, h);
		UIGraphicsBeginImageContext(imgSize);
		CGRect imgRect = CGRectMake(0.0, 0.0, imgSize.width, imgSize.height);
		[orgImg drawInRect:imgRect];
		retImage = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
    } else {
		retImage = orgImg;
	}
	return retImage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
