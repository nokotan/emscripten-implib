/*********************************************************************
  zlib の利用例
  gcc -Wall comptest2.c -o comptest2 -lz
*********************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <zlib.h>

#define ORIGBUFSIZ  1024        /* 元データバッファサイズ（任意） */
#define COMPBUFSIZ  1040        /* 圧縮データバッファサイズ（≧上×1.001＋12） */

FILE *fin, *fout;                  /* 入力・出力ファイル */
unsigned long origsize, compsize;  /* 元サイズ，圧縮サイズ */
unsigned char origbuf[ORIGBUFSIZ]; /* 元データバッファ */
unsigned char compbuf[COMPBUFSIZ]; /* 圧縮データバッファ */

void error(char *msg)
{
    fprintf(stderr, "Error: %s\n", msg);
    exit(1);
}

void do_compress(void)          /* 圧縮 */
{
    while (1) {
        origsize = fread(origbuf, 1, ORIGBUFSIZ, fin); /* データを読み込む */
        if (origsize == 0) {
            fwrite(&origsize, sizeof origsize, 1, fout);
            break;
        }
        compsize = COMPBUFSIZ;
        if (compress(compbuf, &compsize, origbuf, origsize) != Z_OK)
            error("compress()");
        fwrite(&compsize, sizeof compsize, 1, fout);
        fwrite(compbuf, compsize, 1, fout);
    }
}

void do_decompress(void)        /* 復号 */
{
    while (1) {
        fread(&compsize, sizeof compsize, 1, fin);
        if (compsize == 0) break;
        if (compsize > COMPBUFSIZ) error("do_decompress()");
        fread(compbuf, compsize, 1, fin);
        origsize = ORIGBUFSIZ;
        if (uncompress(origbuf, &origsize, compbuf, compsize) != Z_OK)
            error("uncompress()");
        fwrite(origbuf, origsize, 1, fout);
    }
}

int main(int argc, char *argv[])
{
    int c;

    if (argc != 4) {
        fprintf(stderr, "Usage: comptest2 flag infile outfile\n");
        fprintf(stderr, "  flag: c=compress d=decompress\n");

        puts(zlibVersion());
        exit(0);
    }
    if (argv[1][0] == 'c') {
        c = 1;
    } else if (argv[1][0] == 'd') {
        c = 0;
    } else {
        error("Unknown flag");
    }
    if ((fin = fopen(argv[2], "rb")) == NULL)
        error("Can't open input file");
    if ((fout = fopen(argv[3], "wb")) == NULL)
        error("Can't open output file");
    if (c) do_compress(); else do_decompress();
    fclose(fin);
    fclose(fout);
    return 0;
}
