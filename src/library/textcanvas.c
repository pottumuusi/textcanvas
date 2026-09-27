#include <stdint.h>
#include <stdio.h>
#include <textcanvas.h>

#define CANVAS_WIDTH 32
#define CANVAS_HEIGHT 32

// canvas_image -> canvas_texture (?)
// What is a texture?
uint32_t canvas_image[CANVAS_HEIGHT][CANVAS_WIDTH] = {0};
uint32_t canvas_draw_buffer[CANVAS_HEIGHT][CANVAS_WIDTH] = {0};

int
test_return(void)
{
	return 123;
}

void
canvas_image_fill_with_character(const char c)
{
	for (int y = 0; y < CANVAS_HEIGHT; y++) {
		for (int x = 0; x < CANVAS_WIDTH ; x++) {
			canvas_image[y][x] = c;
		}
	}
}

void
canvas_load_image_to_draw_buffer(void)
{
	for (int y = 0; y < CANVAS_HEIGHT; y++) {
		for (int x = 0; x < CANVAS_WIDTH ; x++) {
			canvas_draw_buffer[y][x] = canvas_image[y][x];
		}
	}
}

void
canvas_image_draw(void)
{
	printf("\n");

	for (int y = 0; y < CANVAS_HEIGHT; y++) {
		printf(" ");

		for (int x = 0; x < CANVAS_WIDTH; x++) {
			printf("%c", canvas_draw_buffer[y][x]);
		}

		printf(" \n");
	}

	printf("\n");
}
