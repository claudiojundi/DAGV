//
//  FeedWithImageCell.m
//  DAGV
//
//  Created by Nathan Hegedus on 08/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import "FeedWithImageCell.h"
#import "UIImage+AverageColor.h"

@implementation FeedWithImageCell

- (void)configureCellForNextEventsWithOptions:(NSDictionary *)options
{
    [self.typeLabel setText:@"Evento mais próximo"];
    
    [self.titleLabel setText:options[@"titulo"]];
    [self.titleLabel setTextColor:[UIColor colorWithRed:0.75 green:0.68 blue:0.48 alpha:1]];
    
    [self.dateLabel setText:options[@"data"]];
    [self.descriptionLabel setText:options[@"sobre"]];
    [self.typeLabel setTextColor:[UIColor whiteColor]];
    [self.topBackgroundView setBackgroundColor:[UIColor colorWithRed:0.75 green:0.68 blue:0.48 alpha:1]];
    
    [self configureImageWithURLString:options[@"imagem"]];
}

- (void)configureCellForNewsWithOptions:(NSDictionary *)options
{
    [self.typeLabel setText:@"Notícias"];
    [self.titleLabel setText:options[@"titulo"]];
    [self.dateLabel setText:options[@"data"]];
    [self.descriptionLabel setText:options[@"noticia"]];
    
    [self configureCellWithImage:options[@"imagem"]];
}

- (void)configureCellForEventsWithOptions:(NSDictionary *)options
{
    [self.typeLabel setText:@"Eventos"];
    [self.titleLabel setText:options[@"titulo"]];
    [self.dateLabel setText:options[@"data"]];
    [self.descriptionLabel setText:options[@"sobre"]];
    
    [self configureCellWithImage:options[@"imagem"]];
}

- (void)configureCellForClubWithOptions:(NSDictionary *)options
{
    [self.typeLabel setText:@"Clube de Benefícios"];
    
    [self.titleLabel setText:options[@"classificacao"]];
    
    [self.dateLabel setText:options[@"nome"]];
    [self.descriptionLabel setText:options[@"endereço"]];
    [self configureCellWithImage:options[@"imagem"]];
}

- (void)configureCellWithImage:(NSString *)imageURLString
{
    [self.typeLabel setTextColor:[UIColor colorWithRed:0.65 green:0.65 blue:0.65 alpha:1]];
    [self.topBackgroundView setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1]];
    [self.titleLabel setTextColor:[UIColor colorWithRed:0.65 green:0.65 blue:0.65 alpha:1]];
    [self configureImageWithURLString:imageURLString];
}

- (void)configureImageWithURLString:(NSString *)imageURLString
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,  0ul);
    dispatch_async(queue, ^{
        NSURL * imageURL = [NSURL URLWithString:imageURLString];
        NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage * image = [UIImage imageWithData:imageData];
            [self.thumbImageView setImage:image];
            [self.thumbImageView setBackgroundColor:[image averageColor]];
        });
    });
}

@end
