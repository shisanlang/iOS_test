//
//  UserInfo.m
//  setget
//
//  Created by dxd on 14-7-1.
//  Copyright (c) 2014年 dxd. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

@synthesize name = _name;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setName:(NSString *)name
{
    if (_name != name)
    {
        [_name release];
        _name = [name retain];  //[name copy]
        NSLog(@"set = %@",_name);
    }
}


- (NSString*)name
{
    NSLog(@"get = %@", _name);
    return _name;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
