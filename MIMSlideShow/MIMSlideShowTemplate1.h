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
//  MIMSlideShowTemplate1.h
//  MIMSlideShow
//
//  Created by Reetu Raj on 16/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//



#import <UIKit/UIKit.h>
#import "MIMLayer1.h"
#import "MIMLayer2.h"
#import "Global.h"


@interface MIMSlideShowTemplate1 : UIView {

    BOOL loopImages;
    
    @private
    UIImageView *bgView;
    NSInteger count;
    NSArray *_imageArray;
    CGFloat _presentationDuration;
    CGFloat _animationDuration;

    CGSize _frameSize;
    CGPoint _originPoint;
    ANIMATIONTYPE _type;
    MIMLayer1 *layer1;    
    MIMLayer2 *layer2;
    NSTimer *animationTimer;
    NSInteger _index;

}
@property(nonatomic,assign)BOOL loopImages;
@property(nonatomic,retain)NSArray *_imageArray;



-(void)createLayersInContainer;
-(void)setDefaultValues;
-(void)startSlideShow;
-(void)setAnimationType:(ANIMATIONTYPE)type;
-(void)setImageArray:(NSArray *)imgArray;
@end
