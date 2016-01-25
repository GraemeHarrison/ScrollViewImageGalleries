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
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pageControl = [[UIPageControl alloc] init];
    self.pageControl.frame = CGRectMake(self.scrollView.frame.size.width*0.5, self.view.frame.size.height*0.95, 100.0, 20.0);
    self.pageControl.numberOfPages = 3;
    self.pageControl.currentPage = 0;
    self.pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
    self.pageControl.pageIndicatorTintColor = [UIColor darkGrayColor];
    [self.view addSubview:self.pageControl];
    
    self.scrollView.delegate = self;
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
        int pageNum = (self.scrollView.contentOffset.x / self.scrollView.frame.size.width);
        self.pageControl.currentPage = pageNum;
}

@end