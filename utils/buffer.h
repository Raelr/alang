#ifndef ALANG_UTILS_BUFFER_H
#define ALANG_UTILS_BUFFER_H

#include "common.h"
typedef uint8_t Data;

typedef struct Buffer {
    size_t count;
    size_t capacity;
    Data* data;
} Buffer;

void Init(Buffer* buffer);
//    void Push(Buffer& buffer, const Buffer::Data& data);
//    void Free(Buffer& buffer);


#endif // ALANG_UTILS_BUFFER_H