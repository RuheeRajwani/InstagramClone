//
//  PostCell.m
//  InstagramClone
//
//  Created by Ruhee Rajwani on 6/29/22.
//

#import "PostCell.h"
#import "NSDate+DateTools.h"

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) setPost:(Post *)post{
    
    _post=post;
    
    NSString *at = @"@";
    self.usernameLabel.text =[NSString stringWithFormat:@"%@%@", at, self.post.author.username];
    
    NSData *data = self.post.image.getData;
    self.postImage.image = [UIImage imageWithData:data];
    
    self.captionText.text = self.post.caption;
    
    self.dateLabel.text = [NSString stringWithFormat:@"%@%@", self.post.createdAt.shortTimeAgoSinceNow, @" ago"];
}

@end
