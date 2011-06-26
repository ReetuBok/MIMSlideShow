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
//  MIMLayer1.h
//  MIMSlideShow
//
//  Created by Reetu Raj on 18/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"


@interface MIMLayer1 : UIView {
    
    UIImageView *imgFrame;
    NSString *imgName;

    NSTimer *timer[10];
    CGFloat alpha[10];
    
    
    ANIMATIONTYPE animationType;
    
    
    //temp
    NSInteger Fdate;
    NSInteger Ldate;
    
    @private
    ANIMATIONTYPE randomAnimation;
    CGFloat _screenWidth;
    CGFloat _screenHeight;
    NSInteger _animationType;
    NSInteger _columns;
    NSInteger _rows;
    CGFloat _width; // used as same function as _growingradius
    CGFloat _height;
    NSMutableArray *_widthArray;
    NSMutableArray *_heightArray;
    CGRect _bestFitRectForImage;
    
    //Type 1
    //Handling variable width of blinds
    CGFloat count[10];
    
    //Type 3:
    //For rect  teeth gate
    CGFloat _teethWidth;
    
    
    //Type 4:
    //Bubble animation related variable
    CGFloat _radius;
    CGFloat _growingRadius;
    
    id delegate;
    NSInteger _typeInc;
}
@property(nonatomic,assign) id delegate;
@property(nonatomic,retain)    NSString *imgName;
@property(nonatomic,assign)    NSInteger _animationType;
-(void)initDefaultComponents;
-(void)refreshLayer;
-(void)setImageNameAndFrame:(NSString *)imgName;
-(void)startAnimation;
-(void)setType:(NSInteger)type;
-(void)createLayersComponent:(CGRect)frame;
@end
