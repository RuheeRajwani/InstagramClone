//
//  ProfileViewController.m
//  InstagramClone
//
//  Created by Ruhee Rajwani on 6/30/22.
//

#import "ProfileViewController.h"
#import <Parse/Parse.h>
#import "PostCollectionViewCell.h"

@interface ProfileViewController () <UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *profileCollectionView;
@property (nonatomic) NSMutableArray *arrayOfPosts;
@property (nonatomic) UIRefreshControl *refreshControl;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.profileCollectionView.dataSource = self;
    [self fetchPosts];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PostCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PostCollectionViewCell" forIndexPath:indexPath];
    cell.post = self.arrayOfPosts[indexPath.row];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arrayOfPosts.count;
}

- (void) fetchPosts {
    
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    query.limit = 20;
    [query orderByDescending:@"createdAt"];
    [query includeKey:@"author"];
    [query whereKey:@"author" equalTo:[PFUser currentUser]];
    

    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            self.arrayOfPosts = (NSMutableArray*) posts;
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
        
        [self.profileCollectionView reloadData];
        
    }];
    
 

}

@end
