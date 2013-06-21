//
//  CarServiceCell.h
//  CHEXUN_YCDP
//
//  Created by duan on 13-6-4.
//
//

#import <UIKit/UIKit.h>
//#import "EGOImageView.h"

@interface CarServiceCell : UITableViewCell
{
//    int CellStyle;
    UIImageView *MearchantImageBgView;
//    EGOImageView *MearchantImageView;//商户图片
//    UIImageView *CouponImageView;//优惠券标志图片
    UILabel *ServiceNameLabel;//服务名字
    UILabel *BrandNameLabel;//品牌名称
    UILabel *PriceLabel;//价格区间
    UIImageView *ServiceTypeQuan;//券
    UIImageView *ServiceTypeCard;//卡
    UILabel *MearchantAddressLabel;//商户地址
    UILabel *DistanceLabel;//距离
}

//@property (nonatomic, assign) int CellStyle;
@property (nonatomic, retain) UIImageView * MearchantImageBgView;
//@property (nonatomic, retain) EGOImageView *MearchantImageView;
//@property (nonatomic, retain) UIImageView *CouponImageView;
@property (nonatomic, retain) UILabel *ServiceNameLabel;
@property (nonatomic, retain) UILabel *BrandNameLabel;
@property (nonatomic, retain) UILabel *PriceLabel;
@property (nonatomic, retain) UIImageView *ServiceTypeQuan;
@property (nonatomic, retain) UIImageView *ServiceTypeCard;
@property (nonatomic, retain) UILabel *MearchantAddressLabel;
@property (nonatomic, retain) UILabel *DistanceLabel;

@end
