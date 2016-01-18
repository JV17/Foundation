//
//  Array.m
//  Foundation
//
//  Created by Jorge Valbuena on 2016-01-13.
//  Copyright © 2016 Jorge Valbuena. All rights reserved.
//

#import "Array.h"
#import "ArrayData.h"
#import "NSString+ArrayString.h"
#import "NSObject+ArrayObject.h"
#import "ArrayData+HeadTail.h"


#pragma mark - Interface

@interface Array()

/** 
 Holds a reference to the first object in the array. 
 */
@property (nonatomic, strong) ArrayData *head;

/**
 Holds a reference to the last object in the array.
 */
@property (nonatomic, strong) ArrayData *tail;

@property (nonatomic, assign, readwrite) NSUInteger count;

@property (nonatomic, assign, readwrite) BOOL isEmpty;

@end


#pragma mark - Implementation & Lifecycle

@implementation Array

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        // custom init
    }
    
    return self;
}


- (instancetype)initWithObjects:(NSArray *)array
{
    self = [super init];
    
    if (self)
    {
        // custom init
    }
    
    return self;
}


#pragma mark - Array helper functions

- (void)addObjectFront:(id)object
{
    if ([object isObjectEmpty])
    {
        return;
    }
    
    if (!self.head)
    {
        // add new object
        [self addNewObjectAtHead:object previousPointer:nil];
        return;
    }
    
    // add new object to the front
    ArrayData *tempObject = self.head;
    [self initializeHeadWithObject:object previousPointer:tempObject];
    tempObject.next = self.head;
    
    if (!self.tail)
    {
        [self initializeTailWithObject:tempObject.data nextPointer:self.head];
    }
}


- (void)addObjectBack:(id)object
{
    if ([object isObjectEmpty] || [self isHeadOrTailEmptyWithObject:object])
    {
        return;
    }

    ArrayData *tempObject = self.tail;
    [self initializeTailWithObject:object nextPointer:tempObject];
    tempObject.previous = self.tail;
}


- (void)addObject:(id)object beforeObject:(id)beforeObject
{
    if ([object isObjectEmpty] || [self isHeadOrTailEmptyWithObject:object])
    {
        return;
    }
    
    ArrayData *current = self.tail;
    ArrayData *previous = nil;

    while (current)
    {
        if ([beforeObject isEqual:current.data])
        {
            if (!current.previous)
            {
                [self addObjectBack:object];
                break;
            }

            ArrayData *newObject = [self newArrayData:object nextPointer:current previousPointer:previous];
            current.previous = newObject;
            previous.next = newObject;
            break;
        }
        
        previous = current;
        current = current.next;
    }
}


- (void)addObject:(id)object afterObject:(id)afterObject
{
    if ([object isObjectEmpty] || [self isHeadOrTailEmptyWithObject:object])
    {
        return;
    }
    
    ArrayData *current = self.tail;
    ArrayData *next = nil;
    
    while (current)
    {
        next = current.next;
        
        if ([afterObject isEqual:current.data])
        {
            if (!current.next)
            {
                [self addObjectFront:object];
                break;
            }
            
            ArrayData *newObject = [self newArrayData:object nextPointer:next previousPointer:current];
            current.next = newObject;
            next.previous = newObject;
            break;
        }
        
        current = current.next;
    }
}


- (void)replaceObject:(id)object withObject:(id)newObject
{
    if ([object isObjectEmpty] || !self.head)
    {
        return;
    }
    
    if (!self.tail)
    {
        if ([object isEqual:self.head])
        {
            [self addNewObjectAtHead:object previousPointer:nil];
        }
        
        return;
    }
    
    ArrayData *current = self.tail;
    
    while (current)
    {
        if ([object isEqual:current.data])
        {
            current.data = newObject;
            break;
        }
        
        current = current.next;
    }
}


/**
 This function checks if we have head or tail. If not then we initialize them.
 
 @param object
    The new object to possible add to head.
 
 @return
    A Boolean saying if we have head or tail.
 */
- (BOOL)isHeadOrTailEmptyWithObject:(id)object
{
    if (!self.head)
    {
        [self addNewObjectAtHead:object previousPointer:nil];
        return YES;
    }
    else if (!self.tail)
    {
        [self addNewObjectAtTail:object nextPointer:self.head];
        return YES;
    }
    
    return NO;
}


/**
 This function adds a new object in head.
 
 @param object
    The new object to add.
 */
- (void)addNewObjectAtHead:(id)object previousPointer:(ArrayData *)previous
{
    [self initializeHeadWithObject:object previousPointer:previous];
}


/**
 This function adds a new object in tail.
 
 @param object
    The new object to add.
 */
- (void)addNewObjectAtTail:(id)object nextPointer:(ArrayData *)next
{
    [self initializeTailWithObject:object nextPointer:next];
    self.head.previous = self.tail;
}


#pragma mark - Head and Tail functions

/**
 Helper function to intialize head object in the Array.
 
 @param object
    The new object to store in the array.
 @param previous
    The previous pointer in our array.
 */
- (void)initializeHeadWithObject:(id)object previousPointer:(ArrayData *)previous
{
    if ([object isObjectEmpty])
    {
        return;
    }
    
    self.head = [self newArrayData:object nextPointer:nil previousPointer:previous];
}


/**
 Helper function to intialize tail object in the Array.
 
 @param object
    The new object to store in the array.
 @param next
    The next pointer in our array.
 */
- (void)initializeTailWithObject:(id)object nextPointer:(ArrayData *)next
{
    if ([object isObjectEmpty])
    {
        return;
    }
    
    self.tail = [self newArrayData:object nextPointer:next previousPointer:nil];
}


- (ArrayData *)newArrayData:(id)object nextPointer:(id)next previousPointer:(id)previous
{
    return [[ArrayData alloc] initWithData:object nextPointer:next previousPointer:previous];
}


#pragma mark - Remove Functions

- (void)removeObject:(id)object
{
    if ([object isObjectEmpty] || self.isEmpty)
    {
        return;
    }

    if (self.head && !self.tail)
    {
        if ([object isEqual:self.head.data])
        {
            [self.head removeObject];
            self.head = nil;
        }
        
        return;
    }
    
    ArrayData *current = self.tail;

    while (current)
    {
        if ([object isEqual:current.data])
        {
            ArrayData *previous = current.previous;
            ArrayData *next = current.next;
            
            if (previous)
            {
                previous.next = next;
            }
            else
            {
                [self initializeTailWithObject:next.data nextPointer:next.next];
            }

            next.previous = previous;
            [current removeObject];
            current = nil;
            break;
        }
        
        current = current.next;
    }
}


- (void)removeAllObjects
{
    if (self.isEmpty)
    {
        return;
    }
    
    if (self.head && !self.tail)
    {
        [self.head removeObject];
        self.head = nil;
        return;
    }
    
    ArrayData *current = self.tail;
    
    while (current)
    {
        ArrayData *object = current;
        current = current.next;
        [object removeObject];
        object = nil;
        
        if (!current)
        {
            [self.tail removeObject];
            self.tail = nil;
            [self.head removeObject];
            self.head = nil;
        }
    }
}


- (void)removeFirstObject
{
    if (self.isEmpty)
    {
        return;
    }
    
    if (self.head && !self.tail)
    {
        [self.head removeObject];
        self.head = nil;
        return;
    }
    
    if ([self.tail.next isEqual:self.head])
    {
        [self.tail removeObject];
        self.tail = nil;
        return;
    }
    
    ArrayData *current = self.tail;
    
    [self initializeTailWithObject:current.next.data nextPointer:current.next.next];
    
    [current removeObject];
    current = nil;
}


- (void)removeLastObject
{
    if (self.isEmpty)
    {
        return;
    }
    
    if (self.head && !self.tail)
    {
        [self.head removeObject];
        self.head = nil;
        return;
    }
    
    ArrayData *current = self.head;
    
    [self initializeHeadWithObject:current.previous.data previousPointer:current.previous.previous];
    
    [current removeObject];
    current = nil;
}


#pragma mark - Subscripting

- (id)objectAtIndexedSubscript:(NSUInteger)idx
{
    if (self.isEmpty)
    {
        return nil;
    }
    
    if (self.head && !self.tail)
    {
        return self.head.data;
    }
    
    id object = nil;
    NSUInteger x = 0;
    ArrayData *current = self.tail;
    
    while (current)
    {
        if (x == idx)
        {
            object = current.data;
            break;
        }
        
        x++;
        current = current.next;
    }
    
    return object;
}


- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx
{
    if (!obj || idx > self.count)
    {
        return;
    }

    if (self.head && !self.tail && idx == 0)
    {
        self.head.data = obj;
    }
    
    NSUInteger x = 0;
    ArrayData *current = self.tail;
    
    while (current)
    {
        if (x == idx)
        {
            current.data = obj;
            break;
        }
        
        x++;
        current = current.next;
    }
}


#pragma mark - Custom Accessors

/**
 Displays all the content inside the Array.
 */
- (NSString *)description
{
    if (self.isEmpty)
    {
        return @"Array is empty!";
    }
    
    if (self.head && !self.tail)
    {
        return [NSString stringWithFormat:@"{\n%@\n}; ", self.head.data];
    }
    
    NSString *arrayString = @"\n{\n";
    ArrayData *tempObject = self.tail;
    
    while (tempObject)
    {
        if (tempObject.next)
        {
            arrayString = [arrayString descriptionStringWithString:@"  %@,\n" object:tempObject.data];
        }
        else
        {
            arrayString = [arrayString descriptionStringWithString:@"  %@\n}; " object:tempObject.data];
        }
        
        tempObject = tempObject.next;
    }
    
    return arrayString;
}


/**
 Returns the number of objects store in the array.
 */
- (NSUInteger)count
{
    if (!self.head && !self.tail)
    {
        return 0;
    }
    
    if (self.head && !self.tail)
    {
        return 1;
    }
    
    ArrayData *current = self.tail;
    NSUInteger ctr = 0;
    
    while (current)
    {
        ctr++;
        current = current.next;
    }
    
    return ctr;
}


- (BOOL)isEmpty
{
    if (!self.count)
    {
        return YES;
    }
    
    return NO;
}

@end
