#include <gc.h>
#include <string.h>
#include <stdint.h>

int32_t char_ord(char c) {
  return (int32_t) c;
}

int32_t is_digit(char c) {
  return '0' <= c && c <= '9';
}

int32_t is_lower(char c) {
  return 'a' <= c && c <= 'z';
}

int32_t is_upper(char c) {
  return 'A' <= c && c <= 'Z';
}

int32_t is_alphanum(char c) {
  return is_digit(c) || is_lower(c) || is_upper(c);
}

char* string_cons(char c, char* str) {
  char *new = GC_MALLOC(sizeof(char) + 1 + strlen(str) + 1);
  new[0] = c;
  new[1] = '\0';
  strcat(new, str);
  return new;
}
