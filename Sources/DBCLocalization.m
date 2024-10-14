//
//  DBCLocalization.m
//  DBChooser
//

#import "DBCLocalization.h"

NSBundle *DBChooserStringBundle() {
    static NSBundle *bundle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSBundle *bundle = [NSBundle bundleWithPath:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] bundlePath], @"DBChooser_DBChooser.bundle"]];
        NSURL* path = bundle.resourceURL;
        bundle = [NSBundle bundleWithURL:path];
        
        NSLog(@"DBChooser: bundle path: %@", path);
        
        if (!bundle) {
            NSLog(@"DBChooser: resource bundle DBChooser.bundle cannot be found!");
        }
    });
    return bundle;
}

NSString *DBCLocalizedString(NSString *string, NSString *comment) {
    NSString *localizedString = NSLocalizedStringFromTableInBundle(string, @"DBChooser", DBChooserStringBundle(), comment);
    return localizedString ? localizedString : string;
}
