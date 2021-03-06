#define IMAGE
#define RGB_NORMALIZE 256
#define RGB_FP_FACTOR 1024
#define CONSTANT_FP_FACTOR 8192
#define FP_DIVISOR 2048
#define SHIFT_BITS 12

// As defined at https://en.wikipedia.org/wiki/BMP_file_format
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
	int32_t horizontal_res
	int32_t vertical_res;
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