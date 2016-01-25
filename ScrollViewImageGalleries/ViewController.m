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
@property (nonatomic, assign) CGFloat xPosition;
@property (nonatomic, strong) NSMutableArray *imagesArray;

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
    self.xPosition = 0;
    
    self.imagesArray = [[NSMutableArray alloc] init];
    
//    CGFloat newWidth1 = 
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(self.xPosition, 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame))];
    imageView1.image = [UIImage imageNamed:@"Lighthouse"];
    imageView1.contentMode = UIViewContentModeScaleAspectFit;
    imageView1.clipsToBounds = YES;
    [self.scrollView addSubview:imageView1];
    self.xPosition += self.scrollView.frame.size.width;
    [self.imagesArray addObject:imageView1];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.xPosition, 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame))];
    imageView2.image = [UIImage imageNamed:@"Lighthouse-in-Field"];
    imageView2.contentMode = UIViewContentModeScaleAspectFit;
    imageView1.clipsToBounds = YES;
    [self.scrollView addSubview:imageView2];
    self.xPosition += self.scrollView.frame.size.width;
    [self.imagesArray addObject:imageView2];

    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(self.xPosition, 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame))];
    imageView3.image = [UIImage imageNamed:@"Lighthouse-night"];
    imageView3.contentMode = UIViewContentModeScaleAspectFit;
    imageView1.clipsToBounds = YES;
    [self.scrollView addSubview:imageView3];
    self.xPosition += self.scrollView.frame.size.width;
    [self.imagesArray addObject:imageView3];

    self.scrollView.contentSize = CGSizeMake(self.xPosition, self.scrollView.frame.size.height);
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ImageDetailViewController *dvc = (ImageDetailViewController *) segue.destinationViewController;
    int index = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
    UIImageView *view = [self.imagesArray objectAtIndex:index];
    dvc.image = view.image;
}


@end
