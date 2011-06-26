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
//  MIMLayer2.m
//  MIMSlideShow
//
//  Created by Reetu Raj on 18/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MIMLayer2.h"


@implementation MIMLayer2
@synthesize imgName;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
       
        [self createLayersComponent:frame];
        
        
    }
    return self;
}

-(void)createLayersComponent:(CGRect)frame
{

    imgFrame=[[UIImageView alloc]initWithFrame:frame];
    [self addSubview:imgFrame];

}
-(void)setImageNameAndFrame:(NSString *)imgNameVal
{
    imgName=imgNameVal;
    
    CGFloat _screenWidth=self.frame.size.width;
    CGFloat _screenHeight=self.frame.size.height;
    
    
    UIImage *tImg=[UIImage imageNamed:imgNameVal];
    CGFloat _tWidth,_tHeight;
    if(tImg.size.width > tImg.size.height)
    {
        //Restraint by width
        _tWidth=_screenWidth;
        _tHeight=(_tWidth/tImg.size.width)*tImg.size.height;
    }
    else
    {
        //Restraint by Height
        _tHeight=_screenHeight;
        _tWidth=(_tHeight/tImg.size.height)*tImg.size.width;
        
    }
    
    
    CGRect  _bestFitRectForImage=CGRectMake((_screenWidth-_tWidth)/2, (_screenHeight-_tHeight)/2, _tWidth, _tHeight);
    imgFrame.frame=_bestFitRectForImage;
//    timer=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(scaleUp) userInfo:nil repeats:YES];

}

-(void)scaleUp
{

    scale+=0.05;
    self.transform=CGAffineTransformMakeScale(scale, scale);
    if(scale>=1.0)
    {
        scale=0.4;
        [timer invalidate];
        timer=nil;
    }

}

-(void)refreshLayer
{
    scale=0.4;
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
  
    [imgFrame setImage:[UIImage imageNamed:imgName]];
   // imgFrame.transform=CGAffineTransformScale(imgFrame.transform, scale, scale);

}


- (void)dealloc
{
    [super dealloc];
}

@end
