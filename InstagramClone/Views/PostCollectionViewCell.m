//
//  PostCollectionViewCell.m
//  InstagramClone
//
//  Created by Ruhee Rajwani on 6/30/22.
//

#import "PostCollectionViewCell.h"

@implementation PostCollectionViewCell

-(void) setPost:(Post *)post{
    
    _post=post;
    
    NSData *data = self.post.image.getData;
    self.postImageCollectionView.image = [UIImage imageWithData:data];
    
    self.captionLabelCollectionView.text = self.post.caption;

}

@end
