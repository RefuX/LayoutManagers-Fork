#import "LayoutManagersAppDelegate.h"
#import "LayoutManagersViewController.h"

@implementation LayoutManagersAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    viewController = [[LayoutManagersViewController alloc] init];
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];    
}

- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}

@end
