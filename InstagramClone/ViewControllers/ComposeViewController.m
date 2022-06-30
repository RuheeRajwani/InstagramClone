//
//  ComposeViewController.m
//  InstagramClone
//
//  Created by Ruhee Rajwani on 6/28/22.
//

#import "ComposeViewController.h"
#import "Post.h"

@interface ComposeViewController() <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageToUpload;
@property (weak, nonatomic) IBOutlet UITextField *captionField;

@end

@implementation ComposeViewController

- (IBAction)composeViewControllerDidTapShare:(id)sender {
    [Post postUserImage:self.imageToUpload.image withCaption:self.captionField.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            NSLog(@"Sucessfully posted");
            [self.delegate didPost];
            [self dismissViewControllerAnimated:YES completion:nil];
            
            
        } else {
            NSLog(@"%@", error);
        }
    }];
}


- (IBAction)composeViewControllerDidTapCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)composeViewControllerDidTapImage:(UITapGestureRecognizer *)sender {
    
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;

    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        NSLog(@"Camera 🚫 available so we will use photo library instead");
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }

    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    
    editedImage = [self resizeImage:editedImage withSize:CGSizeMake(300, 300)];
    
    self.imageToUpload.image = editedImage;
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
