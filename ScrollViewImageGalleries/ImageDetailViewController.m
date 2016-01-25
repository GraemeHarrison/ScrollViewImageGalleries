//
//  ImageDetailViewController.m
//  ScrollViewImageGalleries
//
//  Created by Graeme Harrison on 2016-01-25.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

#import "ImageDetailViewController.h"

@interface ImageDetailViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;


@end

@implementation ImageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self setupImageViews];
}

-(void)setupImageViews {
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"Lighthouse"]];
//    imageView1.image = [UIImage imageNamed:@"Lighthouse"];
//    imageView1.contentMode = UIViewContentModeScaleAspectFill;
//    imageView1.clipsToBounds = YES;
    imageView1.tag = 1;
    [self.scrollView addSubview:imageView1];
    
    self.scrollView.delegate = self;
    self.scrollView.minimumZoomScale = 0.5;
    self.scrollView.maximumZoomScale = 10;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return [self.view viewWithTag:1];
}

@end
