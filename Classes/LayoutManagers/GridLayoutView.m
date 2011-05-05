//
//  GridLayoutView.m
//  LayoutManagers
//
//  Created by James Roome on 3/15/11.
//  Copyright 2011 SpiderLogic. All rights reserved.
//

#import "GridLayoutView.h"


@implementation GridLayoutView

#pragma mark -
#pragma mark Constructor and destructor

- (id)initWithFrame:(CGRect)frame spacing:(int)s leftMargin:(int)lm
        rightMargin:(int)rm topMargin:(int)tm bottomMargin:(int)bm
        rows:(NSUInteger)rows
        cols:(NSUInteger)cols {
    
    if((self = [super initWithFrame:frame spacing:s leftMargin:lm rightMargin:rm topMargin:tm bottomMargin:bm] )) {
        _rows = rows;
        _cols = cols;
    }
    
    return self;
}

#pragma mark -
#pragma mark Class Methods

- (CGSize)layoutSubviewsEffectively:(BOOL)effectively {
    //width is widest row
    //height is going to be total of row heights
    
    //row heights are going to be equal
    //determine row height: loop through subviews and find heighest row

    //row widths are going to be equal
    //determine col width: loop through subviews and find widest col
    int total_height = self.topMargin, max_width = 0;
    int total_width = self.leftMargin, max_height = 0;
    for (UIView *child in self.subviews) {
        max_height = MAX(max_height, child.frame.size.height);
        max_width = MAX(max_width, child.frame.size.width);
    }
    
    //once we have row heights and col widths
    //total height = row heights * row count
    //total width = col width * col count
    total_height += max_height * _rows;
    total_width += max_width * _cols;

    //spacing
    total_height += (_rows - 1) * self.spacing + self.bottomMargin;
    total_width += (_cols - 1) * self.spacing + self.rightMargin;

    //actually do the layout
    if (effectively == YES) {
        //layout the subviews in a grid
        //we'll work from left to right. So for a 2row x 3cols:
        //
        //             vTM
        //     -----------------
        // LM>| 1 |<S> 2 |<S> 3 |<RM
        //     -----------------
        // LM>| 4 |<S> 5 |<S> 6 |<RM
        //     -----------------
        //             ^BM
        //
        // TM = Top Margin
        // LM = Left Margin
        // RM = Right Margin
        // BM = Bottom Margin
        // S  = Spacing (Padding)
        //
        int viewNumber = 0; //which view are we on
        int y = self.topMargin;
        int x = self.leftMargin;
        for(int row=0; row<_rows; row++) {
            for(int col=0; col<_cols; col++) {
                //the grid may have more cells than subViews
                if(viewNumber >= [self.subviews count] ) {
                    continue;
                }
                //get the next child view we're going to layout
                UIView *child = [self.subviews objectAtIndex:viewNumber++];
                
                //lay it out
                child.frame = CGRectMake(x, y, child.frame.size.width, child.frame.size.height);

                //move to the right
                x += max_width + self.spacing;
            }
            
            //reset the left count
            x = self.leftMargin;

            //move down
            y += max_height + self.spacing;
        }
    }
        
    return CGSizeMake(total_width, total_height);
}

@end
