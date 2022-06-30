//
//  DetailsViewController.m
//  InstagramClone
//
//  Created by Ruhee Rajwani on 6/29/22.
//

#import "DetailsViewController.h"
#import "NSDate+DateTools.h"


@interface DetailsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *postImageView;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSString *at = @"@";
    self.usernameLabel.text =[NSString stringWithFormat:@"%@%@", at, self.post.author.username];
    self.captionLabel.text= self.post.caption;
    
    NSData *data = self.post.image.getData;
    self.postImageView.image = [UIImage imageWithData:data];
   
    self.dateLabel.text = [NSString stringWithFormat:@"%@%@", self.post.createdAt.shortTimeAgoSinceNow, @" ago"];
    
}

@end
