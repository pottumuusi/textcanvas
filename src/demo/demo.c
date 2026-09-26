#include <textcanvas.h>

int
main(void)
{
	const char character = '-';

	canvas_image_fill_with_character(character);
	canvas_load_image_to_draw_buffer();
	canvas_image_draw();

	return(0);
}
