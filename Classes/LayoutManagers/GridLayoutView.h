//
//  GridLayoutView.h
//  LayoutManagers
//
//  Created by James Roome on 3/15/11.
//

#import <Foundation/Foundation.h>
#import "AbstractLayoutView.h"

@interface GridLayoutView : AbstractLayoutView {
    NSUInteger _rows;
    NSUInteger _cols;
}

- (id)initWithFrame:(CGRect)frame spacing:(int)s leftMargin:(int)lm
        rightMargin:(int)rm topMargin:(int)tm bottomMargin:(int)bm
        rows:(NSUInteger)rows
        cols:(NSUInteger)cols;

@end
