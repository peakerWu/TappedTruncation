//
//  XHDescNode.m
//  XHHaoHaoZhu
//
//  Created by zhuke on 2018/8/6.
//  Copyright © 2018年 zhuke. All rights reserved.
//

#import "XHDescNode.h"

@interface XHDescNode () <ASTextNodeDelegate> {
    ASTextNode *_textNode;
    ASButtonNode *_foldNode;
}

@end

@implementation XHDescNode

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor brownColor];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.automaticallyManagesSubnodes = YES;
        
        _textNode = [[ASTextNode alloc] init];
        _textNode.userInteractionEnabled = YES;
    
        _textNode.backgroundColor = [UIColor cyanColor];
        NSString *string = @" @苏州 打卡苏州中心失重餐厅#spacelab[自定义]##Spacelab失重餐厅[地点]#\n 菜品不是很多@，味道也就还好，菜量适中。均价亲民160左右噢～比较适合拍照吧hhhhh 很新奇的一个餐厅，上菜是通过轨道传送。无滤镜拍摄哦（本身不是很喜欢美颜过度的自拍[汗颜R]）\n排队时间比较长，工作日时间去还是排了半个钟头，建议提前排队噢～美味不用等可以手机等位很方便。\n菜品的话汉堡和沙拉比较推荐～饮品的话也就还好，要说一下特制蓝色可乐就是之前爆红的印尼梅子味可乐啦。买饮品的杯子可以带走hhhhhhh\n整体菜品购买流程感觉很像汽车穿梭餐厅[偷笑R][偷笑R]#周末吃啥[话题]##@苏州美食[话题]##约会餐厅[话题]#\n顺便安利一下上衣[无语][无语]#amerivintage[自定义]#";
        _textNode.attributedText = [[NSAttributedString alloc] initWithString:string attributes:[self textStyle]];
        
        _textNode.maximumNumberOfLines = 5;
        
        _foldNode = [[ASButtonNode alloc] init];
        [_foldNode setAttributedTitle:[[NSAttributedString alloc] initWithString:@"fold" attributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:15.0]}] forState:UIControlStateNormal];
        [_foldNode setAttributedTitle:[[NSAttributedString alloc] initWithString:@"unfold" attributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:15.0]}] forState:UIControlStateSelected];
    }
    return self;
}
- (NSDictionary *)textStyle
{
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue" size:17.0f];
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.paragraphSpacing = 0.5 * font.lineHeight;
    style.hyphenationFactor = 1.0;
    return @{
             NSFontAttributeName: font,
             NSParagraphStyleAttributeName: style
             };
}
- (void)layout {
    [super layout];
}
- (void)didLoad
{
    [super didLoad];
    
    [_foldNode addTarget:self action:@selector(scaleNodeDidClicked:) forControlEvents:ASControlNodeEventTouchUpInside];
}
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize
{
    ASStackLayoutSpec *spec = [ASStackLayoutSpec verticalStackLayoutSpec];
    spec.children = @[_textNode, _foldNode];
    
    _foldNode.style.spacingBefore = 10;
    _foldNode.style.spacingAfter = 10;
    
    return spec;
}

- (void)scaleNodeDidClicked:(ASButtonNode *)sender
{
    sender.selected = !sender.selected;
    
    _textNode.maximumNumberOfLines = sender.selected ? 0 : 5;
    [_textNode setNeedsLayout];
}

@end
