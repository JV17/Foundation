//
//  NSString+ArrayString.h
//  Foundation
//
//  Created by Jorge Valbuena on 2016-01-13.
//  Copyright © 2016 Jorge Valbuena. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (ArrayString)

/**
 Generates the description for the array with specified string and object.
 
 @param string
    The string to add to the description.
 @param object
    The object stored in our array.
 
 @return
    The new string with the formatted string description of the object.
 */
- (NSString *)descriptionStringWithString:(NSString *)string object:(id)object;

@end
