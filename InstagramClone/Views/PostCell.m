//
//  PostCell.m
//  InstagramClone
//
//  Created by Ruhee Rajwani on 6/29/22.
//

#import "PostCell.h"

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
    NSData *data = self.post.image.getData;
    self.postImage.image = [UIImage imageWithData:data];
    self.captionText.text = self.post.caption;
}

@end
