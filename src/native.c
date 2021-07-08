#include <string.h>
#include <stdint.h>

int32_t is_digit(char c) {
  return '0' <= c && c <= '9';
}

int32_t is_lower(char c) {
  return 'a' <= c && c <= 'z';
}
