//
//  ViewController.m
//  Photo
//
//  Created by duan on 13-5-22.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIActionSheet *BuyBillActionSheet = [[UIActionSheet alloc]init];
    BuyBillActionSheet=[[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照上传",@"相册上传", nil];
    [BuyBillActionSheet showInView:self.view];
    
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
