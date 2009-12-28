#import <Foundation/Foundation.h>

typedef	enum {
	kCircle,
	kRectangle,
	kOblateSpheroid
} ShapeType;

typedef	enum {
	kRedColor,
	kGreenColor,
	kBlueColor
} ShapeColor;

typedef struct {
	int x, y, width, height;
} ShapeRect;


NSString *colorName (ShapeColor colorName) {
	switch (colorName) {
		case kRedColor:
			return @"red";
			break;
		case kGreenColor:
			return @"green";
			break;
		case kBlueColor:
			return @"blue";
			break;
		default:
			return @"undefined color";
			break;
	}
}

@interface Circle: NSObject
{
	ShapeColor fillColor;
	ShapeRect bounds;
}

- (void) setFillColor: (ShapeColor) fillColor;
- (void) setBounds: (ShapeRect) bounds;
- (void) draw;

@end // Circle Interface

@implementation Circle

- (void) setFillColor: (ShapeColor) c
{
	fillColor = c;
}

- (void) setBounds: (ShapeRect) b
{
	bounds = b;
}

- (void) draw
{
	NSLog(@"drawing a circle at (%d %d %d %d) in %@", bounds.x, 
		  bounds.y, bounds.width, bounds.height, colorName(fillColor));
} // draw

@end //Circle

@interface Rectangle: NSObject
{
	ShapeColor fillColor;
	ShapeRect bounds;
}

- (void) setFillColor: (ShapeColor) fillColor;
- (void) setBounds: (ShapeRect) bounds;
- (void) draw;

@end // Rectangle Interface

@implementation Rectangle

- (void) setFillColor: (ShapeColor) c
{
	fillColor = c;
}

- (void) setBounds: (ShapeRect) b
{
	bounds = b;
}

- (void) draw
{
	NSLog(@"drawing a rectangle at (%d %d %d %d) in %@", bounds.x, 
		  bounds.y, bounds.width, bounds.height, colorName(fillColor));
} // draw

@end //Rectangle

@interface OblateSpheroid: NSObject
{
	ShapeColor fillColor;
	ShapeRect bounds;
}

- (void) setFillColor: (ShapeColor) fillColor;
- (void) setBounds: (ShapeRect) bounds;
- (void) draw;

@end // OblateSpheroid Interface

@implementation OblateSpheroid

- (void) setFillColor: (ShapeColor) c
{
	fillColor = c;
}

- (void) setBounds: (ShapeRect) b
{
	bounds = b;
}

- (void) draw
{
	NSLog(@"drawing an egg at (%d %d %d %d) in %@", bounds.x, 
		  bounds.y, bounds.width, bounds.height, colorName(fillColor));
} // draw

@end //OblateSpheroid

@interface Triangle: NSObject
{
	ShapeColor fillColor;
	ShapeRect bounds;
}

- (void) setFillColor: (ShapeColor) fillColor;
- (void) setBounds: (ShapeRect) bounds;
- (void) draw;

@end // Triangle Interface

@implementation Triangle

- (void) setFillColor: (ShapeColor) c
{
	fillColor = c;
}

- (void) setBounds: (ShapeRect) b
{
	bounds = b;
}

- (void) draw
{
	NSLog(@"drawing a triangle at (%d %d %d %d) in %@", bounds.x, 
		  bounds.y, bounds.width, bounds.height, colorName(fillColor));
} // draw

@end //Triangle


void drawShapes (id shapes[], int count) {
	for	(int i = 0; i < count; i++) {
		[shapes[i] draw];
	}
}


int main (int argc, const char * argv[]) {
    id shapes[4];
	
	ShapeRect rect0 = { 0, 0, 10, 30 };
	shapes[0] = [Circle new];
	[shapes[0] setBounds: rect0];
	[shapes[0] setFillColor: kRedColor];
	
	ShapeRect rect1 = {30, 40, 50,60};
	shapes[1] = [Rectangle new];
	[shapes[1] setFillColor: kGreenColor];
	[shapes[1] setBounds: rect1];
	
	ShapeRect rect2 = {15, 18, 37, 29};
	shapes[2] = [OblateSpheroid new];
	[shapes[2] setFillColor: kBlueColor];
	[shapes[2] setBounds: rect2];
	
	ShapeRect rect3 = {47, 32, 80, 50};
	shapes[3] = [Triangle new];
	[shapes[3] setBounds: rect3];
	[shapes[3] setFillColor: kBlueColor];
	
	drawShapes (shapes, 4);
    return 0;
}
