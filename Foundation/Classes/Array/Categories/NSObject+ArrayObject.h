//
//  NSObject+ArrayObject.h
//  Foundation
//
//  Created by Jorge Valbuena on 2016-01-14.
//  Copyright © 2016 Jorge Valbuena. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (ArrayObject)

/**
 Returns YES if the object/caller is empty. Otherwise, returns NO.
 */
- (BOOL)isObjectEmpty;


/**
 This function checks is the object/caller is empty or not.
 
 @param message
    The message to be displayed on the log if the object is empty.
 
 @return
    YES if the object is empty or NO if is not empty.
 */
- (BOOL)isObjectEmptyWithMessage:(NSString *)message;

@end
