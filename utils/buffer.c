#include "buffer.h"

void Init(Buffer* buffer)
{
    buffer->count = 0;
    buffer->capacity = 0;
    buffer->data = NULL;
}

//    void Push(Buffer& buffer, const Buffer::Data& data)
//    {
//
//    }
//
//    void Free(Buffer& buffer)
//    {
//
//    }