//
//  CarServiceCell.m
//  CHEXUN_YCDP
//
//  Created by duan on 13-6-4.
//
//

#import "CarServiceCell.h"

@implementation CarServiceCell

//@synthesize MearchantImageView;
@synthesize ServiceNameLabel;
@synthesize BrandNameLabel;
@synthesize PriceLabel;
@synthesize ServiceTypeQuan,ServiceTypeCard;
@synthesize MearchantAddressLabel;
@synthesize DistanceLabel;

#define XD_COLOR_BLACK [UIColor blackColor]
#define XD_COLOR_GRAY RGB(160,160,160)
#define XD_FONT_BIG [UIFont boldSystemFontOfSize:15]
#define XD_FONT_SMALL [UIFont systemFontOfSize:12]

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //商户图片
        MearchantImageBgView = [[UIImageView alloc]init];
        MearchantImageBgView.frame = CGRectMake(5, 6, 92, 75);
        MearchantImageBgView.image = [UIImage imageNamed:@"yulantu.png"];
        [self addSubview:MearchantImageBgView];
        [MearchantImageBgView release];
        
            
//        MearchantImageView=[[EGOImageView alloc] initWithFrame:CGRectMake(11, 11, 90, 73)];
//        MearchantImageView.image=[UIImage imageNamed:@"pic_list.png"];
//        [self addSubview:MearchantImageView];
//        [MearchantImageView release];
        
//        CouponImageView=[[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 75, 50)];
//        CouponImageView.image=[UIImage imageNamed:@"tab_th.png"];
//        [MearchantImageView addSubview:CouponImageView];
        
        ServiceNameLabel=[[UILabel alloc] initWithFrame:CGRectMake(94, 8, 95, 21)];
        ServiceNameLabel.backgroundColor=[UIColor clearColor];
        ServiceNameLabel.font=XD_FONT_BIG;
        ServiceNameLabel.textColor=XD_COLOR_BLACK;
        ServiceNameLabel.textAlignment = UITextAlignmentLeft;
        ServiceNameLabel.text=@"【四轮定位】";
        [self addSubview:ServiceNameLabel];
        
        BrandNameLabel=[[UILabel alloc] initWithFrame:CGRectMake(103, 33, 180, 21)];
        BrandNameLabel.backgroundColor=[UIColor clearColor];
        BrandNameLabel.font=XD_FONT_BIG;
        BrandNameLabel.textColor=XD_COLOR_BLACK;
        BrandNameLabel.text=@"3M | 雷朋 | 强生";
        [self addSubview:BrandNameLabel];
        
//        UILabel *PriceTitleLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 8, 180, 21)];
//        PriceTitleLabel.backgroundColor=[UIColor clearColor];
//        PriceTitleLabel.font=[UIFont boldSystemFontOfSize:12];
//        PriceTitleLabel.textColor=[UIColor colorWithRed:102/255.0f green:102/255.0f blue:102/255.0f alpha:1.0f];
//        PriceTitleLabel.text=@"价格:";
//        [self addSubview:PriceTitleLabel];
//        [PriceTitleLabel release];
        
        PriceLabel=[[UILabel alloc] initWithFrame:CGRectMake(195, 8, 75, 21)];
        PriceLabel.backgroundColor=[UIColor clearColor];
        PriceLabel.font=XD_FONT_SMALL;
//        PriceLabel.textColor=XD_COLOR_GRAY;
        PriceLabel.text=@"2360-5780 元";
        [self addSubview:PriceLabel];
        
        
        ServiceTypeQuan = [[UIImageView alloc]init];
        ServiceTypeQuan.frame = CGRectMake(270, 10, 17, 17);
        ServiceTypeQuan.image = [UIImage imageNamed:@"juan.png"];
        [self addSubview:ServiceTypeQuan];
        [ServiceTypeQuan release];
        
        ServiceTypeCard = [[UIImageView alloc]init];
        ServiceTypeCard.frame = CGRectMake(290, 10, 17, 17);
        ServiceTypeCard.image = [UIImage imageNamed:@"ka.png"];
        [self addSubview:ServiceTypeCard];
        [ServiceTypeCard release];
        
//        UIImageView *addressImageView=[[UIImageView alloc] initWithFrame:CGRectMake(10+CellLeft, 59, 9, 13)];
//        addressImageView.image=[UIImage imageNamed:@"icon_light.png"];
//        [self addSubview:addressImageView];
//        [addressImageView release];
        
        MearchantAddressLabel=[[UILabel alloc] initWithFrame:CGRectMake(100, 60, 200, 21)];
        MearchantAddressLabel.backgroundColor=[UIColor clearColor];
        MearchantAddressLabel.font=XD_FONT_SMALL;
//        MearchantAddressLabel.textColor=XD_COLOR_GRAY;
        MearchantAddressLabel.text=@"朝阳区八里庄东横时代小区南侧";
        [self addSubview:MearchantAddressLabel];
        
        
//        DistanceLabel=[[UILabel alloc] initWithFrame:CGRectMake(260, 55, 40, 21)];
//        DistanceLabel.backgroundColor=[UIColor clearColor];
//        DistanceLabel.font=[UIFont boldSystemFontOfSize:12];
//        DistanceLabel.textColor=[UIColor blackColor];
//        DistanceLabel.text=@"1000m";
//        DistanceLabel.textAlignment=UITextAlignmentRight;
//        [self addSubview:DistanceLabel];
        
        
        
//        DownTimesLabel=[[UILabel alloc] initWithFrame:CGRectMake(10+CellLeft, 77, 140, 21)];
//        DownTimesLabel.backgroundColor=[UIColor clearColor];
//        DownTimesLabel.font=[UIFont boldSystemFontOfSize:11];
//        DownTimesLabel.textColor=[UIColor redColor];
//        DownTimesLabel.text=@"已下载100次";
//        [self addSubview:DownTimesLabel];
//        
//        RemainDaysLabel=[[UILabel alloc] initWithFrame:CGRectMake(130+CellLeft, 77, 60, 21)];
//        RemainDaysLabel.backgroundColor=[UIColor clearColor];
//        RemainDaysLabel.font=[UIFont boldSystemFontOfSize:11];
//        RemainDaysLabel.textColor=[UIColor redColor];
//        RemainDaysLabel.text=@"剩余20天";
//        [self addSubview:RemainDaysLabel];
        
        
        //箭头
//        UIImageView * MearchantPhoneArrowImageView = [[UIImageView alloc]initWithFrame:CGRectMake(299, 37, 9, 14)];
//        MearchantPhoneArrowImageView.image = [UIImage imageNamed:@"icon_arrow_rt"];
//        [self addSubview:MearchantPhoneArrowImageView];
    }
    return self;
}

-(void)drawRect:(CGRect)rect{
    // cell顶部-分割线
//    UIImage *topImage = [UIImage imageNamed:@"fenjiexian.png"];
//    
//    [topImage drawInRect:CGRectMake(0, 0, self.frame.size.width, 1)];
    
    
    // cell底部-分割线
    UIImage *botImage = [UIImage imageNamed:@"fenjiexian.png"];
    
    [botImage drawInRect:CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 1)];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
