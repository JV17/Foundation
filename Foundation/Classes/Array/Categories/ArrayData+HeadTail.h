//
//  ArrayData+HeadTail.h
//  Foundation
//
//  Created by Jorge Valbuena on 2016-01-14.
//  Copyright © 2016 Jorge Valbuena. All rights reserved.
//

#import "ArrayData.h"


@interface ArrayData (HeadTail)

#pragma mark - Head Helper Functions

/**
 Checks if head is empty or not.
 */
- (BOOL)isHeadEmpty;


#pragma mark - Tail Helper Functions

/**
 Checks if the tail is empty or not.
 */
- (BOOL)isTailEmpty;


#pragma mark - Remove

/**
 Removes object.
 */
- (void)removeObject;

@end
