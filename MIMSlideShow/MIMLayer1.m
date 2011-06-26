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
//  MIMLayer1.m
//  MIMSlideShow
//
//  Created by Reetu Raj on 18/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MIMLayer1.h"
#import <QuartzCore/QuartzCore.h>

@implementation MIMLayer1
@synthesize imgName,_animationType,delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor=[UIColor clearColor];
        
        // Initialization code
        [self createLayersComponent:frame];        

        alpha[1]=1;
        
        
  
        
    }
    return self;
}

-(void)refreshLayer
{
    [self setNeedsDisplay];
}



-(void)setType:(NSInteger)type
{
    _animationType=type;
    
    if(_animationType==Random)
    {
        randomAnimation=Random;
    }
    
    [self initDefaultComponents];
}


-(void)createLayersComponent:(CGRect)frame
{
    _typeInc=0;
    srand(time(NULL));
    
    _screenWidth=frame.size.width;
    _screenHeight=frame.size.height;
    
    imgFrame=[[UIImageView alloc]initWithFrame:frame];
    [imgFrame setContentMode:UIViewContentModeScaleAspectFit];
    [self addSubview:imgFrame];
    
}

-(void)setImageNameAndFrame:(NSString *)imgNameVal
{
    if(randomAnimation==Random)
    {
        NSInteger _int=rand()%15;
        [self setType:_int];
    }
    
    imgName=imgNameVal;
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
    
    _bestFitRectForImage=CGRectMake((_screenWidth-_tWidth)/2, (_screenHeight-_tHeight)/2, _tWidth, _tHeight);
    
}




#pragma mark - Animation Related Methods ----------------------


-(void)initDefaultComponents
{
   
    switch (_animationType) {
        case 0:
        {
            _teethWidth=120;
            alpha[0]=1.0;
            _height=0;
            _rows=(ceilf(_screenHeight/_teethWidth));
        }
            break;
            
        case 1:
        {
            alpha[0]=1.0;
            
            //Initialize the array
            for (int i=0; i<10; i++) {
                count[i]=0;
            }
        }
            break;
            
        case 2:
        {
            _teethWidth=130;
            alpha[0]=1.0;
            _width=0;
            _columns=(ceilf(_screenWidth/_teethWidth));
        }
            break;
        case 3:
        {
            _teethWidth=100;
            alpha[0]=1.0;
            _width=0;
            _rows=(ceilf(_screenWidth/_teethWidth));
        }
            break;
        case 4:
        {
            //Bubble Animation
            //Setting User Defaults.
            alpha[0]=1.0;
            _growingRadius=0;
            _radius=100;
            _columns=(ceilf(_screenWidth/_radius));
            _rows=(ceilf(_screenHeight/_radius));    
            
        }
        break;       
        case 5:
        case 8:
        {
            //SWIPE LEFT OR RIGHT
            alpha[0]=1.0;
            _width=0;
        }
            break;
        case 6:
        case 7:
        {
            //SWIPE UP OR DOWN
            alpha[0]=1.0;
            _height=0;
        }
            break;
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
        {
            alpha[0]=1.0;
            _growingRadius=0;
        }
            break;
    }
}

-(void)startAnimation
{

    switch (_animationType) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
        {
            Fdate =[NSDate timeIntervalSinceReferenceDate];
            timer[0]=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(RemoveLayer) userInfo:nil repeats:YES];
        }
            break;
            
        default:
            break;
    }
    
}

#pragma mark - Bubble Animation
-(void)setRadius:(CGFloat)radius
{
    _radius=radius;
    _rows=_screenWidth/_radius;
}




-(void)RemoveLayer
{
   
    
    switch (_animationType) {
        case 0:
        {
            
            if(_height>=_teethWidth){
                _height=0;
                alpha[0]=1.0;
                
                Ldate=[NSDate timeIntervalSinceReferenceDate];
                NSLog(@"time Diff=%i",Ldate-Fdate);
                
                [timer[0] invalidate];
                timer[0]=nil;
                [self.delegate startSlideShow];
                return;
            }
            _height+=3;
            
            if(alpha[0]>0.05)
                alpha[0]-=0.05;
            else
                alpha[0]=0;
        
        
        }
            break;
        case 1:
        {
            //How many teeth we can afford with the given screenWidth
            _columns=
    
            count[0]+=0.5;
            count[1]+=0.8;
            count[2]+=1.2;
            count[3]+=1.7;
            count[4]+=2.3;
            count[5]+=3.1;
            count[6]+=3.9;
            count[7]+=5.0;
      
            
            if(count[7]>=459){
                
                for (int i=0; i<10; i++) 
                    count[i]=0;
                
                alpha[0]=1.0;
                [timer[0] invalidate];
                timer[0]=nil;
                [self.delegate startSlideShow];
                return;
                
                
            }
            
            if(alpha[0]>0.02)
                alpha[0]-=0.02;
            else
                alpha[0]=0;
            
        
        }
            break;
        case 2:
        {
            if(_width>=_teethWidth){
                _width=0;
                alpha[0]=1.0;
                Ldate=[NSDate timeIntervalSinceReferenceDate];
                NSLog(@"time Diff=%i",Ldate-Fdate);
                
                [timer[0] invalidate];
                timer[0]=nil;
                [self.delegate startSlideShow];
                return;
            }
            _width+=3;
            
            if(alpha[0]>0.02)
                alpha[0]-=0.02;
            else
                alpha[0]=0;

        }
            break;
        case 3:
        {
            if(_width>=_screenWidth/1.5){
                _width=0;
                alpha[0]=1.0;
                Ldate=[NSDate timeIntervalSinceReferenceDate];
                NSLog(@"time Diff=%i",Ldate-Fdate);
                
                [timer[0] invalidate];
                timer[0]=nil;
                [self.delegate startSlideShow];
                return;
            }
            _width+=10;
            
            if(alpha[0]>0.02)
                alpha[0]-=0.02;
            else
                alpha[0]=0;

            
        
            
            
        }
            break;
        case 4:
        {
            if(_growingRadius>=_radius+10){
                _growingRadius=0;
                alpha[0]=1.0;
                 Ldate=[NSDate timeIntervalSinceReferenceDate];
                NSLog(@"time Diff=%i",Ldate-Fdate);
                
                [timer[0] invalidate];
                timer[0]=nil;
                [self.delegate startSlideShow];
                return;
            }
            _growingRadius+=1.5;
        
            if(alpha[0]>0.02)
                alpha[0]-=0.02;
            else
                alpha[0]=0;
        
        }
            break;
        case 5:
        case 8:
        {
            //SWIPE LEFT
            
            if(_width>=_screenWidth+10){
                
                _width=0;
                alpha[0]=1.0;
                
                Ldate=[NSDate timeIntervalSinceReferenceDate];
                NSLog(@"time Diff=%i",Ldate-Fdate);
                
                [timer[0] invalidate];
                timer[0]=nil;
                
                [self.delegate startSlideShow];
                return;
            }
            _width+=10;
            
            if(alpha[0]>0.01)
                alpha[0]-=0.01;
            else
                alpha[0]=0;
        }
            break;
        case 6:
        case 7:
        {
            //SWIPE LEFT
            
            if(_height>=_screenHeight+10){
                
                _height=0;
                alpha[0]=1.0;
                
                Ldate=[NSDate timeIntervalSinceReferenceDate];
                NSLog(@"time Diff=%i",Ldate-Fdate);
                
                [timer[0] invalidate];
                timer[0]=nil;
                
                [self.delegate startSlideShow];
                return;
            }
            _height+=10;
            
            if(alpha[0]>0.01)
                alpha[0]-=0.01;
            else
                alpha[0]=0;
        }
            break;
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
        {
        
            if(_growingRadius>=_screenWidth+10){
                _growingRadius=0;
                alpha[0]=1.0;
                Ldate=[NSDate timeIntervalSinceReferenceDate];
                NSLog(@"time Diff=%i",Ldate-Fdate);
                
                [timer[0] invalidate];
                timer[0]=nil;
                [self.delegate startSlideShow];
                return;
            }
            _growingRadius+=13;
            
            if(alpha[0]>0.02)
                alpha[0]-=0.02;
            else
                alpha[0]=0;

        }
            break;
        case 14:
        {
            
            if(_growingRadius>=_screenWidth/2+10){
                _growingRadius=0;
                alpha[0]=1.0;
                Ldate=[NSDate timeIntervalSinceReferenceDate];
                NSLog(@"time Diff=%i",Ldate-Fdate);
                
                [timer[0] invalidate];
                timer[0]=nil;
                [self.delegate startSlideShow];
                return;
            }
            _growingRadius+=6;
            
            if(alpha[0]>0.01)
                alpha[0]-=0.01;
            else
                alpha[0]=0;
            
        }
            break;
        default:
            break;
    }
    
 
    
    [self setNeedsDisplay];
    
}




// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{

    
    // Drawing code
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGAffineTransform flipTransform = CGAffineTransformMake( 1, 0, 0, -1, 0, rect.size.height);
    CGContextConcatCTM(context, flipTransform);
    CGContextSetAlpha(context, alpha[0]);
    
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, _screenWidth, _screenHeight));
    
    CGContextDrawImage(context, _bestFitRectForImage, [UIImage imageNamed:imgName].CGImage);

    
    switch (_animationType) {
        case 0:
        {
        
            for (int i=0; i<_rows; i++) {
                
                CGContextSetBlendMode(context, kCGBlendModeClear);
                CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
                CGContextFillRect(context,CGRectMake(0, (_teethWidth-2)*i, _screenWidth, _height));
                
            }
            
        }
            break;
        case 1:
        {
            
            if(count[0]<=5)
                CGContextFillRect(context,CGRectMake(0, 0, count[0], _screenHeight));
            else
                CGContextFillRect(context,CGRectMake(0, 0, 5, _screenHeight));
            
            if(count[1]<=10)
                CGContextFillRect(context,CGRectMake(5, 0, count[1], _screenHeight));
            else
                CGContextFillRect(context,CGRectMake(5, 0, 10, _screenHeight));
            
            if(count[2]<=20)
                CGContextFillRect(context,CGRectMake(15, 0, count[2], _screenHeight));
            else
                CGContextFillRect(context,CGRectMake(15, 0, 20, _screenHeight));
            
            if(count[3]<=40)
                CGContextFillRect(context,CGRectMake(35, 0, count[3], _screenHeight));
            else
                CGContextFillRect(context,CGRectMake(35, 0, 40, _screenHeight));
            
            if(count[4]<=80)
                CGContextFillRect(context,CGRectMake(75, 0, count[4], _screenHeight));
            else
                CGContextFillRect(context,CGRectMake(75, 0, 80, _screenHeight));
            
            
            if(count[5]<=160)
                CGContextFillRect(context,CGRectMake(155, 0, count[5], _screenHeight));
            else
                CGContextFillRect(context,CGRectMake(155, 0, 160, _screenHeight));
            
            
            if(count[6]<=320)
                CGContextFillRect(context,CGRectMake(315, 0, count[6], _screenHeight));
            else
                CGContextFillRect(context,CGRectMake(315, 0, 250, _screenHeight));
            
            
            if(count[7]<=389)
                CGContextFillRect(context,CGRectMake(565, 0, count[7], _screenHeight));
            else
                CGContextFillRect(context,CGRectMake(565, 0, 459, _screenHeight));
            
         
            

        
        }
            break;
            
        case 2:
        {
            for (int i=0; i<_columns; i++) {
                
                CGContextSetBlendMode(context, kCGBlendModeClear);
                CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
                CGContextFillRect(context,CGRectMake((_teethWidth-2)*i, 0, _width, _screenHeight));
                
            }
        }
        break;
        case 3:
        {
            
            //Clear the image
            for (int i=0; i<_rows; i+=2) {
                
                CGContextSetBlendMode(context, kCGBlendModeClear);
                CGContextFillRect(context,CGRectMake(0, _teethWidth*i, _width, _teethWidth));
                
            }
            
            CGAffineTransform transform = CGAffineTransformMake(-1.0, 0.0, 0.0, 1.0, _screenWidth, 0.0);
            CGContextConcatCTM(context,transform);
            
            
            for (int i=1; i<_rows; i+=2) {
                
                CGContextSetBlendMode(context, kCGBlendModeClear);
                CGContextFillRect(context,CGRectMake(0, _teethWidth*i, _width, _teethWidth));

            }
            
            
        }
            break;
        case 4:
        {
            CGContextSetLineWidth(context, _growingRadius); 
            CGContextSetBlendMode(context, kCGBlendModeClear);
            
            for (int i=0; i<_rows; i++) {
                for (int j=0; j<_columns; j++) {
                    
                    CGContextAddEllipseInRect(context, CGRectMake(j*_radius, _radius*i, _radius, _radius));
                    CGContextStrokePath(context);
                }    
            }

        
        }
            break;
        case 5:
        {
            CGContextSetBlendMode(context, kCGBlendModeClear);
            CGContextFillRect(context,CGRectMake(0,0, _width, _screenHeight));
        }
            break;
        case 6:
        {
            CGContextSetBlendMode(context, kCGBlendModeClear);
            CGContextFillRect(context,CGRectMake(0,0, _screenWidth, _height));
        }
            break;
        case 7:
        {
            //Flip vertically back.
            CGAffineTransform flipTransform = CGAffineTransformMake( 1, 0, 0, -1, 0, rect.size.height);
            CGContextConcatCTM(context, flipTransform);
            CGContextSetBlendMode(context, kCGBlendModeClear);
            CGContextFillRect(context,CGRectMake(0,0, _screenWidth, _height));
        }
            break;
        case 8:
        {
            CGAffineTransform transform = CGAffineTransformMake(-1.0, 0.0, 0.0, 1.0, _screenWidth, 0.0);
            CGContextConcatCTM(context,transform);
            CGContextSetBlendMode(context, kCGBlendModeClear);
            CGContextFillRect(context,CGRectMake(0,0, _width, _screenHeight));
        }
            break;
        case 9:
        {
        
            CGContextSetLineWidth(context, _growingRadius); 
            CGContextSetBlendMode(context, kCGBlendModeClear);
            CGContextAddRect(context, CGRectMake(0, 0, _screenWidth, _screenHeight));
            CGContextStrokePath(context);

            
        }
            break;
        case 10:
        {
            
            CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
            CGContextSetBlendMode(context, kCGBlendModeClear);
            CGContextFillRect(context, CGRectMake((_screenWidth-_growingRadius)/2, (_screenHeight-_growingRadius)/2, _growingRadius, _growingRadius));

            
            
        }
            break;
        case 11:
        {
            
            CGContextSetLineWidth(context, _growingRadius); 
            CGContextSetBlendMode(context, kCGBlendModeClear);
            CGContextAddEllipseInRect(context, CGRectMake(0, 0, _screenWidth, _screenHeight));
            CGContextStrokePath(context);
            
            
        }
            break;
        case 12:
        {
            
            CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
            CGContextSetBlendMode(context, kCGBlendModeClear);
            CGContextFillEllipseInRect(context, CGRectMake((_screenWidth-_growingRadius)/2, (_screenHeight-_growingRadius)/2, _growingRadius, _growingRadius));
            
            
            
        }
            break;
        case 13:
        {
            
            CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
            CGContextSetBlendMode(context, kCGBlendModeClear);
            CGContextFillRect(context, CGRectMake((_screenWidth-_growingRadius)/2, 0, _growingRadius, _screenHeight));
  
        }
            break;
        case 14:
        {
            
            CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
            CGContextSetBlendMode(context, kCGBlendModeClear);
            CGContextFillRect(context, CGRectMake(0, 0, _growingRadius, _screenHeight));
            
            CGAffineTransform transform = CGAffineTransformMake(-1.0, 0.0, 0.0, 1.0, _screenWidth, 0.0);
            CGContextConcatCTM(context,transform);
            
            CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
            CGContextSetBlendMode(context, kCGBlendModeClear);
            CGContextFillRect(context, CGRectMake(0, 0, _growingRadius, _screenHeight));
            
        }
            break;
        default:
            break;
    }
   
}


- (void)dealloc
{
    [super dealloc];
}

@end
