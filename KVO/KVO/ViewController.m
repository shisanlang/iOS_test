//
//  ViewController.m
//  KVO
//
//  Created by dxd on 14-3-13.
//  Copyright (c) 2014年 dxd. All rights reserved.
//

#import "ViewController.h"


@interface StockData : NSObject {
    NSString * stockName;
    float price;
}
@end
@implementation StockData
@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    stockForKVO = [[StockData alloc] init];
    [stockForKVO setValue:@"searph" forKey:@"stockName"];
    [stockForKVO setValue:@"10.0" forKey:@"price"];    //字符串
    [stockForKVO addObserver:self forKeyPath:@"price" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    
    myLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 30 )];
    myLabel.textColor = [UIColor redColor];
    myLabel.text = [NSString stringWithFormat:@"%f", [[stockForKVO valueForKey:@"price"] floatValue]];
    [self.view addSubview:myLabel];
    
    UIButton * b = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    b.frame = CGRectMake(0, 200, 100, 30);
    [b setTitle:@"Button" forState:UIControlStateNormal];
    [b addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b];
}

-(void) buttonAction
{
    [stockForKVO setValue:@"20.0" forKey:@"price"];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"price"])
    {
        myLabel.text = [NSString stringWithFormat:@"%f",[[stockForKVO valueForKey:@"price"] floatValue]];
    }
}

//- (void)dealloc
//{
//    [super dealloc];
//    [stockForKVO removeObserver:self forKeyPath:@"price"];
//    [stockForKVO release];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
