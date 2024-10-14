//
//  DBChooserAppearance.m
//  DBChooser
//

#import "DBChooserAppearance.h"
#import <QuartzCore/QuartzCore.h>

@implementation DBChooserAppearance

+ (UIImage *)noDropboxImage
{
    static UIImage *appIconImage;
    if (appIconImage == nil) {
        NSBundle *bundle = [NSBundle bundleWithPath:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] bundlePath], @"DBChooser_DBChooser.bundle"]];
        
        appIconImage = [UIImage imageNamed:@"app-icon" inBundle:bundle compatibleWithTraitCollection:nil];
    }
    return appIconImage;
}

+ (void)customizeButton:(Class<UIAppearance>)cls {
    if (isIOS7()) {
        [[cls appearance] setTitleColor:[self dropboxBlue] forState:UIControlStateNormal];
        return;
}

    NSBundle *bundle = [NSBundle bundleWithPath:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] bundlePath], @"DBChooser_DBChooser.bundle"]];
    
    UIEdgeInsets buttoninsets = UIEdgeInsetsMake(0, 5, 0, 5);
    [[cls appearance] setBackgroundImage:[[UIImage imageNamed:@"blue_large_button" inBundle:bundle compatibleWithTraitCollection:nil] resizableImageWithCapInsets:buttoninsets]
                                forState:UIControlStateNormal];
    [[cls appearance] setBackgroundImage:[[UIImage imageNamed:@"blue_large_button_pressed" inBundle:bundle compatibleWithTraitCollection:nil] resizableImageWithCapInsets:buttoninsets]
                                forState:UIControlStateHighlighted];
}

+ (void)customizeInstallButton:(UIButton*)btn withWidth:(CGFloat)width {
    if (isIOS7()) {
        [btn setBackgroundColor:[UIColor whiteColor]];
        [btn sizeToFit];
        CGRect frame = btn.frame;
        btn.frame = CGRectMake(0, frame.origin.y, width, frame.size.height);

        [btn setAutoresizingMask: UIViewAutoresizingFlexibleWidth];

        [[btn layer] setBorderWidth:[[UIScreen mainScreen] scale] == 2.00 ? 0.5f : 1.0f];
        [[btn layer] setBorderColor:[self buttonBorderColor].CGColor];

        return;
    }
    else {
        [btn sizeToFit];
    }
}

+ (void)customizeTitleLabel:(UILabel *)label {
    label.textColor = [self darkTextColor];
    if (!isIOS7()) {
        label.font = [UIFont boldSystemFontOfSize:[UIFont labelFontSize]];
    }
}


+ (void)customizeSubtitleLabel:(UILabel *)label {
    if (isIOS7()) {
        label.font = [UIFont systemFontOfSize:[UIFont smallSystemFontSize]];
    }
    else {
        label.font = [UIFont boldSystemFontOfSize:[UIFont smallSystemFontSize]];
    }
}
@end
