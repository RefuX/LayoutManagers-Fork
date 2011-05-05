#import "LayoutManagersViewController.h"
#import "LayoutManagers.h"

@implementation LayoutManagersViewController

- (void)loadView
{
    UIView *container = [[UIView alloc] initWithFrame:
                         [[UIScreen mainScreen] applicationFrame]];
    self.view = container;
    [container release];

    mainLayout = [[VLayoutView alloc] initWithFrame:container.bounds
                  spacing:10
                  leftMargin:0 rightMargin:0 topMargin:0 bottomMargin:0
                  hAlignment:UIControlContentHorizontalAlignmentLeft
                  vAlignment:UIControlContentVerticalAlignmentTop];
    [container addSubview:mainLayout];
    
    [self sizingAndMarginsExample];
    [self scrollingExample];
    [self alignmentExample];
    [self gridExample];
}

- (void)sizingAndMarginsExample
{
    HLayoutView *hlay = [[HLayoutView alloc] initWithFrame:CGRectZero spacing:0
                         leftMargin:3 rightMargin:3 topMargin:3 bottomMargin:3];
    hlay.backgroundColor = [UIColor grayColor];
    [mainLayout addSubview:hlay];
    [hlay release];
    
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor redColor];
    label.text = @"Sizing and Margins Example";
    [label sizeToFit];
    [hlay addSubview:label];
    [label release];
    
    [hlay setSize];
}

- (void)scrollingExample
{
    VLayoutView *vlay = [[VLayoutView alloc]
                         initWithFrame:CGRectMake(0, 0, 100, 100)
                         spacing:0
                         leftMargin:0 rightMargin:0 topMargin:0 bottomMargin:0
                         hAlignment:UIControlContentHorizontalAlignmentLeft
                         vAlignment:UIControlContentVerticalAlignmentTop];
    vlay.backgroundColor = [UIColor grayColor];
    // Scrolling is disabled by default
    vlay.scrollEnabled = YES;
    [mainLayout addSubview:vlay];
    [vlay release];
    
    UILabel *label;
    for (int i = 0; i < 10; ++i)
    {
        label = [[UILabel alloc] init];
        label.text = @"Scrolling Example";
        label.backgroundColor = (i % 2 == 0 ? [UIColor blueColor]
                                 : [UIColor redColor]);
        [label sizeToFit];
        [vlay addSubview:label];
        [label release];
    }
    scrollingExampleLayout = vlay;
    scrollingExampleLastLabel = label;
    
    UIButton *scrollButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    scrollButton.frame = CGRectMake(0, 0, 150, 20);
    [scrollButton setTitle:@"Show last label" forState:UIControlStateNormal];
    [scrollButton addTarget:self action:@selector(scrollingExampleScroll)
     forControlEvents:UIControlEventTouchUpInside];
    [mainLayout addSubview:scrollButton];
}

- (void)scrollingExampleScroll
{
    [scrollingExampleLayout scrollToShow:scrollingExampleLastLabel
     animated:YES];
}

- (void)alignmentExample
{
    // Right Top
    
    HLayoutView *rtHLayout
        = [[HLayoutView alloc] initWithFrame:CGRectZero spacing:2
           leftMargin:3 rightMargin:3 topMargin:3 bottomMargin:3
           hAlignment:UIControlContentHorizontalAlignmentRight
           vAlignment:UIControlContentVerticalAlignmentTop];
    rtHLayout.backgroundColor = [UIColor grayColor];
    [mainLayout addSubview:rtHLayout];
    [rtHLayout release];
    
    UILabel *rtLeftLabel = [[UILabel alloc] init];
    rtLeftLabel.backgroundColor = [UIColor redColor];
    rtLeftLabel.text = @"Alignment";
    rtLeftLabel.font = [rtLeftLabel.font fontWithSize:24];
    [rtLeftLabel sizeToFit];
    [rtHLayout addSubview:rtLeftLabel];
    [rtLeftLabel release];
    UILabel *rtRightLabel = [[UILabel alloc] init];
    rtRightLabel.backgroundColor = [UIColor blueColor];
    rtRightLabel.text = @"Example";
    [rtRightLabel sizeToFit];
    [rtHLayout addSubview:rtRightLabel];
    [rtRightLabel release];
    
    [rtHLayout setSizeWithWidth:250];
    
    // Center Center
    
    HLayoutView *ccHLayout
        = [[HLayoutView alloc] initWithFrame:CGRectZero spacing:2
           leftMargin:3 rightMargin:3 topMargin:3 bottomMargin:3
           hAlignment:UIControlContentHorizontalAlignmentCenter
           vAlignment:UIControlContentVerticalAlignmentCenter];
    ccHLayout.backgroundColor = [UIColor grayColor];
    [mainLayout addSubview:ccHLayout];
    [ccHLayout release];
    
    UILabel *ccLeftLabel = [[UILabel alloc] init];
    ccLeftLabel.backgroundColor = [UIColor redColor];
    ccLeftLabel.text = @"Alignment";
    ccLeftLabel.font = [ccLeftLabel.font fontWithSize:24];
    [ccLeftLabel sizeToFit];
    [ccHLayout addSubview:ccLeftLabel];
    [ccLeftLabel release];
    UILabel *ccRightLabel = [[UILabel alloc] init];
    ccRightLabel.backgroundColor = [UIColor blueColor];
    ccRightLabel.text = @"Example";
    [ccRightLabel sizeToFit];
    [ccHLayout addSubview:ccRightLabel];
    [ccRightLabel release];
    
    [ccHLayout setSizeWithWidth:250];

    // Left Bottom
    
    HLayoutView *lbHLayout
        = [[HLayoutView alloc] initWithFrame:CGRectZero spacing:2
           leftMargin:3 rightMargin:3 topMargin:3 bottomMargin:3
           hAlignment:UIControlContentHorizontalAlignmentLeft
           vAlignment:UIControlContentVerticalAlignmentBottom];
    lbHLayout.backgroundColor = [UIColor grayColor];
    [mainLayout addSubview:lbHLayout];
    [lbHLayout release];
    
    UILabel *lbLeftLabel = [[UILabel alloc] init];
    lbLeftLabel.backgroundColor = [UIColor redColor];
    lbLeftLabel.text = @"Alignment";
    lbLeftLabel.font = [lbLeftLabel.font fontWithSize:24];
    [lbLeftLabel sizeToFit];
    [lbHLayout addSubview:lbLeftLabel];
    [lbLeftLabel release];
    UILabel *lbRightLabel = [[UILabel alloc] init];
    lbRightLabel.backgroundColor = [UIColor blueColor];
    lbRightLabel.text = @"Example";
    [lbRightLabel sizeToFit];
    [lbHLayout addSubview:lbRightLabel];
    [lbRightLabel release];
    
    [lbHLayout setSizeWithWidth:250];
}

- (UILabel *) labelWithText:(NSString *)text {
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor redColor];
    label.text = text;
    [label sizeToFit];
    [label autorelease];

    return label;
}

- (void)gridExample {
    // 2 x 3
    GridLayoutView *gridLayoutView = [[GridLayoutView alloc ] initWithFrame:CGRectZero spacing:1 leftMargin:3 rightMargin:3 topMargin:3 bottomMargin:3 rows:2 cols:3];
    gridLayoutView.backgroundColor = [UIColor grayColor];
    
    
    [mainLayout addSubview:gridLayoutView];
    [gridLayoutView release];
    
    [gridLayoutView addSubview:[self labelWithText:@"ONE"]];
    [gridLayoutView addSubview:[self labelWithText:@"TWO"]];
    [gridLayoutView addSubview:[self labelWithText:@"THREE"]];
    [gridLayoutView addSubview:[self labelWithText:@"FOUR"]];
    [gridLayoutView addSubview:[self labelWithText:@"FIVE"]];
    [gridLayoutView addSubview:[self labelWithText:@"SIX"]];
        
    [gridLayoutView setSize];
}

- (void)dealloc {
    [mainLayout release];
    [super dealloc];
}

@end
