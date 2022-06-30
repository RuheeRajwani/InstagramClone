//
//  PostCollectionViewCell.h
//  InstagramClone
//
//  Created by Ruhee Rajwani on 6/30/22.
//

#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *postImageCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *captionLabelCollectionView;
@property (strong, nonatomic) Post *post;

@end

NS_ASSUME_NONNULL_END
