//
//  PostCell.h
//  InstagramClone
//
//  Created by Ruhee Rajwani on 6/29/22.
//

#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *postImage;
@property (weak, nonatomic) IBOutlet UILabel *captionText;
@property (strong, nonatomic) Post *post;

@end

NS_ASSUME_NONNULL_END
