#include <stdio.h>  // putchar()
#include <stdlib.h> // strtoul()

void printu16( unsigned x )
{
    char digits[6];
    int  len = 0;

    do
    {
        digits[ len++ ] = (x % 10);
        x /= 10;
    }
    while( x );

    while( len --> 0 )
        putchar( '0' | digits[ len ] );
}

int main( const int nArg, const char *aArg[] )
{
    printu16( nArg > 1 ? strtoul(aArg[1],NULL,16) : 0x1234 );
    return putchar( '\n' );
}

