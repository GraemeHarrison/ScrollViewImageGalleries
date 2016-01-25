//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Graeme Harrison on 2016-01-25.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self setupImageViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)setupImageViews {
    CGFloat xPosition = 0;
    
//    CGFloat newWidth1 = 
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(xPosition, 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame))];
    imageView1.image = [UIImage imageNamed:@"Lighthouse"];
    imageView1.contentMode = UIViewContentModeScaleAspectFit;
    imageView1.clipsToBounds = YES;
    [self.scrollView addSubview:imageView1];
    xPosition += self.scrollView.frame.size.width;
    
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(xPosition, 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame))];
    imageView2.image = [UIImage imageNamed:@"Lighthouse-in-Field"];
    imageView2.contentMode = UIViewContentModeScaleAspectFit;
    imageView1.clipsToBounds = YES;
    [self.scrollView addSubview:imageView2];
    xPosition += self.scrollView.frame.size.width;
    
    
    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(xPosition, 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame))];
    imageView3.image = [UIImage imageNamed:@"Lighthouse-night"];
    imageView3.contentMode = UIViewContentModeScaleAspectFit;
    imageView1.clipsToBounds = YES;
    [self.scrollView addSubview:imageView3];
    xPosition += self.scrollView.frame.size.width;
    
    self.scrollView.contentSize = CGSizeMake(xPosition, self.scrollView.frame.size.height);
}



@end
