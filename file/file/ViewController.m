//
//  ViewController.m
//  file
//
//  Created by duan on 13-12-9.
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
    
    NSMutableDictionary * dic  = [[NSMutableDictionary alloc]init];
    [dic setObject:@"a1" forKey:@"1"];
    [dic setObject:@"b1" forKey:@"2"];
    [dic setObject:@"c1" forKey:@"3"];
    [dic setObject:@"d1" forKey:@"4"];
    [dic setObject:@"e1" forKey:@"1"];
    [dic setObject:@"f1" forKey:@"1"];
    [dic setObject:@"g1" forKey:@"1"];
    
    for (NSString * str in dic) {
        NSLog(@"%@=%@",str,[dic objectForKey:str]);
    }
    
    NSLog(@"dic=%d",[dic count]);
    
    NSLog(@"dic=%@",[dic allValues]);
    
    [dic removeObjectForKey:@"13"];
    
    NSArray * arr = [NSArray arrayWithObjects:@"北京",@"上海",@"广州",nil];
    
    NSString * strArray = @"array";
    [dic setObject:arr forKey:strArray];
    
    NSLog(@"dic=%@",dic);
    
    BOOL error = [dic writeToFile:[self GetFileName] atomically:YES];
    NSLog(@"error = %d",error);
}

- (NSString *) GetFileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filename = [documentsDirectory stringByAppendingPathComponent:@"localstock.plist"];
    NSLog(@"filename=%@",filename);
    //filename=/Users/duanxiaodong/Library/Application Support/iPhone Simulator/7.0/Applications/9770BFBF-CE12-49DD-B83B-424171AE19E5/Documents/localstock.plist
    //filename=/var/mobile/Applications/C8853775-343A-451C-A16F-83A17A2D7FDC/Documents/localstock.plist
    
    NSFileManager * fm =[[NSFileManager alloc] init];
    NSError * err = nil;
    NSURL * docsurl = [fm URLForDirectory:NSDocumentationDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:&err];
    NSLog(@"docUrl = %@",docsurl);
    //docUrl = file:///Users/duanxiaodong/Library/Application%20Support/iPhone%20Simulator/7.0/Applications/9770BFBF-CE12-49DD-B83B-424171AE19E5/Library/Documentation/
    //docUrl = file:///var/mobile/Applications/C8853775-343A-451C-A16F-83A17A2D7FDC/Library/Documentation/
    
    NSURL * suppurl = [fm URLForDirectory:NSApplicationSupportDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:&err];
    NSLog(@"suppurl = %@",suppurl);
    //suppurl = file:///Users/duanxiaodong/Library/Application%20Support/iPhone%20Simulator/7.0/Applications/9770BFBF-CE12-49DD-B83B-424171AE19E5/Library/Application%20Support/
    //suppurl = file:///var/mobile/Applications/C8853775-343A-451C-A16F-83A17A2D7FDC/Library/Application%20Support/
    
    return filename;
}

#pragma mark iOS 用其它应用打开文件
- (IBAction)downloadDoc:(id)sender {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *downloadFile = [documentsDirectory stringByAppendingPathComponent:@"test.docx"];
    //    NSURL *bURL = [NSURL URLWithString:downloadFile relativeToURL:baseUrl];
    if ([self downloadFile:@"http://iyoapp.com/test/files" :downloadFile]) {
        //        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:USER_CONTRACT_INFO[@"download"]]];//[NSURL fileURLWithPath:downloadFile]
        UIDocumentInteractionController * documentController = [UIDocumentInteractionController interactionControllerWithURL:[NSURL fileURLWithPath:downloadFile]];
        
        //        documentController.delegate = self;
        documentController.UTI = @"com.microsoft.word.doc";
        
        [documentController presentOpenInMenuFromRect:CGRectMake(760, 20, 100, 100) inView:self.view animated:YES];
    }
    
}
//UTI:
//https://developer.apple.com/library/mac/documentation/Miscellaneous/Reference/UTIRef/Articles/System-DeclaredUniformTypeIdentifiers.html

-(BOOL)downloadFile:(NSString *)urlstr :(NSString *)savePath
{
    NSURL *url=[NSURL URLWithString:urlstr];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    NSError *error=nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    if([data length]>0)
    {
        NSLog(@"下载成功");
        if([data writeToFile:savePath atomically:YES]){NSLog(@"保存成功");}
        else{NSLog(@"保存失败");}
        return YES;
    }
    else
    {
        NSLog(@"下载失败，失败原因：%@",error);
        return NO;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
