//
//  ViewController.m
//  Activitor
//
//  Created by WilliamsDu on 16/7/12.
//  Copyright © 2016年 杜宇. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *whiteImage;
@property (weak, nonatomic) IBOutlet UIImageView *grayImage;//上面的图片
@property (nonatomic, strong) CALayer *maskLayer;
@property (nonatomic, strong) CAShapeLayer *upLayer;
@property (nonatomic, strong) CAShapeLayer *downLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    BOOL enable = NO;
    if (enable) {
        [self firstAnimation];
    } else {
        [self secondAnimation];
    }
}

- (void)firstAnimation {
    _upLayer = [CAShapeLayer new];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:_grayImage.bounds];
    _upLayer.path = path.CGPath;
    _upLayer.fillColor = [UIColor redColor].CGColor;
    _grayImage.layer.mask = _upLayer;
    
    _upLayer.position = CGPointMake(0, 0);
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, _grayImage.bounds.size.height)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    animation.duration = 2;
    animation.repeatCount =  CGFLOAT_MAX;
    [_upLayer addAnimation:animation forKey:nil];
}

- (void)secondAnimation {
    
    CALayer *layer = [CALayer layer];
    layer.frame = _grayImage.bounds;
    
    _upLayer = [CAShapeLayer new];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:_grayImage.bounds];
    _upLayer.path = path.CGPath;
    _upLayer.fillColor = [UIColor redColor].CGColor;
    
    _upLayer.position = CGPointMake(-_grayImage.bounds.size.width, -_grayImage.bounds.size.height);
    
    _downLayer = [CAShapeLayer new];
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRect:_grayImage.bounds];
    _downLayer.path = path2.CGPath;
    _downLayer.fillColor = [UIColor redColor].CGColor;
    
    _upLayer.position = CGPointMake(-_grayImage.bounds.size.width, -_grayImage.bounds.size.height);
    _downLayer.position = CGPointMake(_grayImage.bounds.size.width, _grayImage.bounds.size.height);
    
    [layer addSublayer:_upLayer];
    [layer addSublayer:_downLayer];
    _grayImage.layer.mask = layer;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(-_grayImage.bounds.size.width, -_grayImage.bounds.size.height)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    animation.duration = 2;
    animation.repeatCount =  CGFLOAT_MAX;
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"position"];
    animation2.fromValue = [NSValue valueWithCGPoint:CGPointMake(_grayImage.bounds.size.width, _grayImage.bounds.size.height)];
    animation2.toValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    animation2.duration = 2;
    animation2.repeatCount =  CGFLOAT_MAX;
    
    [_upLayer addAnimation:animation forKey:nil];
    [_downLayer addAnimation:animation2 forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
