#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <unistd.h>
#include <time.h>

time_t start, stop;

#ifndef IMAGE
#define IMAGE

#define RGB_NORMALIZE 256
#define RGB_FP_FACTOR 1024
#define CONSTANT_FP_FACTOR 8192
#define FP_DIVISOR 2048
#define SHIFT_BITS 12

//bmp_info* get_bmp_info(char*);
//void free_bmp_info(bmp_info*);
//rgb_prime_array* get_pixel_array(bmp_info*);
//void free_pixel_array(rgb_prime_array*);
//void write_to_bmp(bmp_info*, rgb_array*);
//void* mmalloc(size_t);
//static void read_bmp_info(FILE*, bmp_info*);
//static void write_bmp_info(FILE*, bmp_info*);
//static void write_pixel_array(FILE*, rgb_array*);
//static void get_rgb_pixel_array(unsigned char*, rgb_prime_array*);

typedef struct bmp_info {

// header fields
	int16_t file_type;
	int32_t size_bytes;
	int16_t reserved_1;
	int16_t reserved_2;
	int32_t offset; // starting address of image data

// info fields
	int32_t header_size;
	int32_t width_px;
	int32_t height_px;
	int16_t num_colour_planes;
	int16_t bits_per_px;
	int32_t compression;
	int32_t image_size;
	int32_t h_resolution;
	int32_t v_resolution;
	int32_t num_colours;
	int32_t num_important_colours;

	unsigned char* image_data;

} bmp_info;

typedef struct RGB_t {
	unsigned char red;
	unsigned char green;
	unsigned char blue;
} RGB_t;

typedef struct RGB_prime_t {
	float red;
	float green;
	float blue;
} RGB_prime_t;

/* FIXED POINT*/
typedef struct YCC_t {
	unsigned char y;
	unsigned char cb;
	unsigned char cr;
} YCC_t;

/*FLOATING POINT*/
typedef struct YCC_prime_t {
	float y;
	float cb;
	float cr;
} YCC_prime_t;

typedef struct rgb_array {
	int32_t width_px;
	int32_t height;
	int16_t bits_per_px;
	int8_t row_padding;
	RGB_t** data_array;
} rgb_array;

typedef struct rgb_prime_array {
	int32_t width_px;
	int32_t height;
	int16_t bits_per_px;
	int8_t row_padding;
	RGB_prime_t** data_array;
} rgb_prime_array;

typedef struct ycc_prime_array {
	int32_t width_px;
	int32_t height;
	int16_t bits_per_px;
	int8_t row_padding;
	YCC_prime_t** data_array;
} ycc_prime_array;

bmp_info* get_bmp_info(char* filename) {
	
	FILE* file;

	file = fopen(filename, "rb");

	if (file == NULL) {
		printf("Unable to open file: %s. Exiting.\n", filename);
		fclose(file);
		exit(-1);
	}

	bmp_info bmp = mmalloc(sizeof(bmp_info));

	// read the bitmap file info and header part
	read_bmp_info(file, bmp);

	size_t img_size = bmp->size_bytes;
	unsigned char* img_data = mmalloc(img_size);

	// open file as an int, memcpy the image data containing pixel data
	int file1 = open(filename, O_RDONLY);
	struct stat file_stat;
	fstat(file1, &file_stat);
	char* p = mmap(NULL, file_stat.st_size, PROT_READ, MAP_SHARED, file1, 0);
	memcpy(img_data, p + bmp->offset, (int) img_size);

	bmp->image_data = img_data;

	close(file1);
	fclose(file);

	return bmp;
}

void free_bmp_info(bmp_info* bmp) {
	free(bmp->image_data);
	free(bmp);
}

rgb_prime_array* get_pixel_array(bmp_info* bmp) {

	rgb_prime_array* rgb = mmalloc(sizeof(rgb_prime_array));

	rgb->width_px = bmp->width_px;
	rgb->row_padding = bmp->width_px % 4;
	rgb->height = bmp->height_px;
	rgb->bits_per_px = bmp->bits_per_px;

	get_rgb_pixel_array(bmp->image_data, rgb);

	return rgb;
}

void free_pixel_array(rgb_prime_array* rgb) {
	int i;
	for (i = 0; i < rgb->height; i++) {
		free(rgb->data_array[i]);
	}
	free(rgb->data_array);
	free(rgb);
}

void write_to_bmp(bmp_info* bmp, rgb_array* rgb) {

	FILE* file;
	file = fopen("converted.bmp", "wb");

	write_bmp_info(file, bmp);

	write_pixel_array(file, rgb);
}

// Wrapper function for malloc
void* mmalloc(size_t size) {

  void* allocated = malloc(size);
  if (allocated == NULL) {
    printf("Error allocating memory. Exiting.\n");
    exit(-1);
  }
  return allocated;
}

static void read_bmp_info(FILE* f, bmp_info* bmp) {
	// read the header
	fread(&bmp->file_type, sizeof(((bmp_info*)0)->file_type), 1, f);
	fread(&bmp->size_bytes, sizeof(((bmp_info*)0)->size_bytes), 1, f);
	fread(&bmp->reserved_1, sizeof(((bmp_info*)0)->reserved_1), 1, f);
	fread(&bmp->reserved_2, sizeof(((bmp_info*)0)->reserved_2), 1, f);
	fread(&bmp->offset, sizeof(((bmp_info*)0)->offset), 1, f);
	
	// info fields
	fread(&bmp->header_size, sizeof(((bmp_info*)0)->header_size), 1, f);
	fread(&bmp->width_px, sizeof(((bmp_info*)0)->width_px), 1, f);
	fread(&bmp->height_px, sizeof(((bmp_info*)0)->height_px), 1, f);
	fread(&bmp->num_colour_planes, sizeof(((bmp_info*)0)->num_colour_planes), 1, f);
	fread(&bmp->bits_per_px, sizeof(((bmp_info*)0)->bits_per_px), 1, f);
	fread(&bmp->compression, sizeof(((bmp_info*)0)->compression), 1, f);
	fread(&bmp->image_size, sizeof(((bmp_info*)0)->image_size), 1, f);
	fread(&bmp->h_resolution, sizeof(((bmp_info*)0)->h_resolution), 1, f);
	fread(&bmp->v_resolution, sizeof(((bmp_info*)0)->v_resolution), 1, f);
	fread(&bmp->num_colours, sizeof(((bmp_info*)0)->num_colours), 1, f);
	fread(&bmp->num_important_colours, sizeof(((bmp_info*)0)->num_important_colours), 1, f);
}

static void write_bmp_info(FILE* f, bmp_info* bmp) {
	// read the header
	fwrite(&bmp->file_type, sizeof(((bmp_info*)0)->file_type), 1, f);
	fwrite(&bmp->size_bytes, sizeof(((bmp_info*)0)->size_bytes), 1, f);
	fwrite(&bmp->reserved_1, sizeof(((bmp_info*)0)->reserved_1), 1, f);
	fwrite(&bmp->reserved_2, sizeof(((bmp_info*)0)->reserved_2), 1, f);
	fwrite(&bmp->offset, sizeof(((bmp_info*)0)->offset), 1, f);
	
	// info fields
	fwrite(&bmp->header_size, sizeof(((bmp_info*)0)->header_size), 1, f);
	fwrite(&bmp->width_px, sizeof(((bmp_info*)0)->width_px), 1, f);
	fwrite(&bmp->height_px, sizeof(((bmp_info*)0)->height_px), 1, f);
	fwrite(&bmp->num_colour_planes, sizeof(((bmp_info*)0)->num_colour_planes), 1, f);
	fwrite(&bmp->bits_per_px, sizeof(((bmp_info*)0)->bits_per_px), 1, f);
	fwrite(&bmp->compression, sizeof(((bmp_info*)0)->compression), 1, f);
	fwrite(&bmp->image_size, sizeof(((bmp_info*)0)->image_size), 1, f);
	fwrite(&bmp->h_resolution, sizeof(((bmp_info*)0)->h_resolution), 1, f);
	fwrite(&bmp->v_resolution, sizeof(((bmp_info*)0)->v_resolution), 1, f);
	fwrite(&bmp->num_colours, sizeof(((bmp_info*)0)->num_colours), 1, f);
	fwrite(&bmp->num_important_colours, sizeof(((bmp_info*)0)->num_important_colours), 1, f);
}

static void write_pixel_array(FILE* f, rgb_array* rgb) {

	int i, j, k;
	
	char pad = '0';

	for (i = 0; i < rgb->height; i++) {
		for (j = 0; j < rgb->width_px ; j++) {
			fwrite(&rgb->data_array[i][j].blue, sizeof(char), 1, f);
			fwrite(&rgb->data_array[i][j].green, sizeof(char), 1, f);
			fwrite(&rgb->data_array[i][j].red, sizeof(char), 1, f);
		}
		for (k = 0; k < rgb->row_padding; k++) {
			fwrite(&pad, 1, sizeof(char), f);
		}
	}
}

static void get_rgb_pixel_array(unsigned char* img_data, rgb_prime_array* rgb) {
	int width, height, width_odd, height_odd;
	int padding = rgb->row_padding;

	// check to see that both the row and the column have an even number of pixels
	// if not, need to replicate the last row or column
	// this is necessary for downsampling
	height_odd = width_odd = 0;
	if (rgb->height & 0x01) {
		height = rgb->height + 1;
		height_odd = 1;
	} else {
		height = rgb->height;
	}

	if (rgb->width_px & 0x01) {
		width = rgb->width_px + 1;
		width_odd = 1;
	} else {
		width = rgb->width_px;
	}

	RGB_prime_t** array = mmalloc(height * sizeof(RGB_prime_t*));
	RGB_prime_t* temp = mmalloc(sizeof(RGB_prime_t));

	int i, j, k;
	// for every row of pixels
	for (i = 0; i < rgb->height; i++) {
		// allocate a RGB object for each pixel
		array[i] = mmalloc(width * sizeof(RGB_prime_t));
		for (j = 0; j < rgb->width_px ; j++) {
			temp->blue = ((float) *img_data++) / RGB_NORMALIZE;
			temp->green = ((float) *img_data++) / RGB_NORMALIZE;			
			temp->red = ((float) *img_data++) / RGB_NORMALIZE;

			array[i][j] = *temp;
			//printf("%d %d r: %f g: %f b: %f\n", i, j, array[i][j].red, array[i][j].green, array[i][j].blue);
		}
		for (k = 0; k < padding; k++) {
			*img_data++;
		}
	}

	if (height_odd) {
		for (i = 0; i < rgb->width_px; i++) {
			array[height - 1][i] = array[height - 2][i];
		}
		rgb->height = height;
	}

	if (width_odd) {
		for (j = 0; j < height; j++) {
			array[j][width - 1] = array[j][width - 2];
		}
		rgb->width_px = width;
		rgb->row_padding = width % 4;
	}

	rgb->data_array = array;
	free(temp);
}

void convert_rgb_to_ycc(ycc_prime_array* ycc, rgb_prime_array* rgb) {

	RGB_prime_t** rgb_arr = rgb->data_array; 

	int32_t r, g, b, y, cb, cr;
	float division = (float) 1 / FP_DIVISOR;

	int i, j;
	// for every row of pixels
	for (i = 0; i < ycc->height; i++) {
		// for every pixel in the row
		// average the conversion between the pixels in a 2x2 square of pixels -> get 1 pixel
		// the ycc version of the bmp will have 1:4 pixels to the original bmp
		for (j = 0; j < ycc->width_px; j++) {

			y = cb = cr = 0;

			r = rgb_arr[(2*i)][(2*j)].red * RGB_FP_FACTOR;
			g = rgb_arr[(2*i)][(2*j)].green * RGB_FP_FACTOR;
			b = rgb_arr[(2*i)][(2*j)].blue * RGB_FP_FACTOR;
			y += 0.257 * r + 0.504 * g + 0.098 * b;
			cb += -0.148 * r - 0.291 * g + 0.439 * b;
			cr += 0.439 * r - 0.368 * g - 0.071 * b;

			r = rgb_arr[(2*i)][(2*j)+1].red * RGB_FP_FACTOR;
			g = rgb_arr[(2*i)][(2*j)+1].green * RGB_FP_FACTOR;
			b = rgb_arr[(2*i)][(2*j)+1].blue * RGB_FP_FACTOR;
			y += 0.257 * r + 0.504 * g + 0.098 * b;
			cb += -0.148 * r - 0.291 * g + 0.439 * b;
			cr += 0.439 * r - 0.368 * g - 0.071 * b;

			r = rgb_arr[(2*i)+1][(2*j)].red * RGB_FP_FACTOR;
			g = rgb_arr[(2*i)+1][(2*j)].green * RGB_FP_FACTOR;
			b = rgb_arr[(2*i)+1][(2*j)].blue * RGB_FP_FACTOR;
			y += 0.257 * r + 0.504 * g + 0.098 * b;
			cb += -0.148 * r - 0.291 * g + 0.439 * b;
			cr += 0.439 * r - 0.368 * g - 0.071 * b;

			r = rgb_arr[(2*i)+1][(2*j)+1].red * RGB_FP_FACTOR;
			g = rgb_arr[(2*i)+1][(2*j)+1].green * RGB_FP_FACTOR;
			b = rgb_arr[(2*i)+1][(2*j)+1].blue * RGB_FP_FACTOR;
			y += 0.257 * r + 0.504 * g + 0.098 * b;
			cb += -0.148 * r - 0.291 * g + 0.439 * b;
			cr += 0.439 * r - 0.368 * g - 0.071 * b;
			
			y = y / 4;
			cb = cb / 4;
			cr = cr / 4;

			ycc->data_array[i][j].y = y * division + 16.0f;
			ycc->data_array[i][j].cb = cb * division + 128.0f;
			ycc->data_array[i][j].cr = cr * division + 128.0f;
		}
	}
}

ycc_prime_array* allocate_ycc_array(rgb_prime_array* rgb) {
	int i;

	ycc_prime_array* ycc = mmalloc(sizeof(ycc_prime_array));

	ycc->height = (rgb->height)/2;
	ycc->width_px = (rgb->width_px)/2;

	YCC_prime_t** array = mmalloc(sizeof(YCC_prime_t*) * ycc->height);
	for (i = 0; i < ycc->height; i++) {
		array[i] = mmalloc(sizeof(YCC_prime_t) * ycc->width_px);
	}

	ycc->data_array = array;

	return ycc;
}

void free_ycc_array(ycc_prime_array* ycc) {
	int i;

	for (i = 0; i < ycc->height; i++) {
		free(ycc->data_array[i]);
	}
	free(ycc->data_array);
	free(ycc);
}

rgb_array* allocate_rgb_array(int height, int width, int row_padding) {
	int i;

	rgb_array* rgb = mmalloc(sizeof(rgb_array));
	rgb->height = height;
	rgb->width_px = width;
	rgb->row_padding = row_padding;

	RGB_t** array = mmalloc(sizeof(RGB_t*) * height);
	for (i = 0; i < height; i++) {
		array[i] = mmalloc(sizeof(RGB_t) * width);
	}

	rgb->data_array = array;

	return rgb;
}

void free_rgb_array(rgb_array* rgb) {
	int i;

	for (i = 0; i < rgb->height; i++) {
		free(rgb->data_array[i]);
	}
	free(rgb->data_array);
	free(rgb);
}

int main(int argc, char* argv[]) {

    start = clock();
	if (argc != 2) {
		printf("Usage: ./csc <bmp_file_name>\n");
		exit(-1);
	}

	bmp_info* bmp = get_bmp_info(argv[1]);
	rgb_prime_array* rgb = get_pixel_array(bmp);

	//Make sure that the bmp file is 24bpp
	if (rgb->bits_per_px == 24) {
		ycc_prime_array* ycc = allocate_ycc_array(rgb);
		convert_rgb_to_ycc(ycc, rgb);

		rgb_array* rgb_after = allocate_rgb_array(rgb->height, rgb->width_px, rgb->row_padding);
		convert_ycc_to_rgb(ycc, rgb_after);
		//write_to_bmp(bmp, rgb_after);

		free_ycc_array(ycc);
		free_rgb_array(rgb_after);
	} else {
		printf("Can only read 24bpp bmp files to convert from rgb to ycc.\n");
	}

	free_bmp_info(bmp);
	free_pixel_array(rgb);

    stop = clock();
    printf("%f", stop - start);

	return 0;

}
