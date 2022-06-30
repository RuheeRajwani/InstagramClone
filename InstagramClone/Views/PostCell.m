//
//  PostCell.m
//  InstagramClone
//
//  Created by Ruhee Rajwani on 6/29/22.
//

#import "PostCell.h"
#import "NSDate+DateTools.h"

@implementation PostCell

-(void) setPost:(Post *)post{
    
    _post=post;
    
    NSString *at = @"@";
    self.usernameLabel.text =[NSString stringWithFormat:@"%@%@", at, self.post.author.username];
    
    NSData *data = self.post.image.getData;
    self.postImage.image = [UIImage imageWithData:data];
    
    self.captionText.text = self.post.caption;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"MMM d y";
    self.dateLabel.text = [formatter stringFromDate:self.post.createdAt];
}

@end
