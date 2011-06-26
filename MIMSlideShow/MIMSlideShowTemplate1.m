/*
 Copyright (C) 2011  Reetu Raj (reetu.raj@gmail.com)
 
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
//
//  MIMSlideShowTemplate1.m
//  MIMSlideShow
//
//  Created by Reetu Raj on 16/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MIMSlideShowTemplate1.h"


@implementation MIMSlideShowTemplate1
@synthesize _imageArray,loopImages;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setDefaultValues];
        [self createLayersInContainer];

    }
    return self;
}

-(void)createLayersInContainer
{

    layer2=[[MIMLayer2 alloc]initWithFrame:CGRectMake(_originPoint.x, _originPoint.y, _frameSize.width, _frameSize.height)];
    [self addSubview:layer2];
    
    
    layer1=[[MIMLayer1 alloc]initWithFrame:CGRectMake(_originPoint.x, _originPoint.y, _frameSize.width, _frameSize.height)];
    [layer1 setDelegate:self];
    [self addSubview:layer1];
    
    
}

-(void)fillLayersWithNextImage
{
  
    
    [layer1 setImageNameAndFrame:[_imageArray objectAtIndex:_index]];
    [layer1 refreshLayer];
    
    _index++;
    
    
    //When you reach the end of the imgArray
    //find out if user has enabled looping or not
    //if looping enabled, start from the beginning.
    if(_index==[_imageArray count])
    if(loopImages)
    {
    
        _index=0;

    }
    else
    {
        [animationTimer invalidate];
        animationTimer=nil;
        return;
        
    }
    
    
    [layer2 setImageNameAndFrame:[_imageArray objectAtIndex:_index]];
    //Redraw the layer
    [layer2 refreshLayer];
    
    [layer1 performSelector:@selector(startAnimation) withObject:nil afterDelay:2.0];

    
}

-(void)setAnimationType:(ANIMATIONTYPE)type
{
    _type=type;
    [layer1 setType:WindowDragging4];
}

-(void)setImageArray:(NSArray *)imgArray
{
    _imageArray=[[NSArray alloc]initWithArray:imgArray];
    
}

-(void)setDefaultValues
{
    _index=0;
    _presentationDuration=2.0;
    _animationDuration=1.5;
    _frameSize=CGSizeMake(1024,748);
    _originPoint=CGPointMake(0, 0);
}

-(void)setPresentationDuration:(CGFloat)duration
{
    _presentationDuration=duration;

}


-(void)setAnimationDuration:(CGFloat)duration
{
    _animationDuration=duration;

}

-(void)startSlideShow
{
   [self fillLayersWithNextImage];
   //animationTimer=[NSTimer scheduledTimerWithTimeInterval:13.0 target:self selector:@selector(fillLayersWithNextImage) userInfo:nil repeats:YES];

}

-(void)stopSlideShow
{

    
}

-(void)pauseSlideShow
{

}






// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
  
    
    
}


- (void)dealloc
{
    [super dealloc];
}

@end
