/*
Open Source Code with General Public License 3.0 (GPL 3.0)
Copyright Artur
GSTL Code
Created by: Artur
XArtur
@gamarturgamedev GitHub
*/
module fmanlib;
struct fman
{
static long openfile(string place, long perm)
{
const(char) *point = place.ptr;
long fd = 0;
asm nothrow
{
mov RAX, 257;
mov RDI, -100;
mov RSI, point;
mov RDX, perm;
mov R10, 0;
syscall;
mov fd, RAX;
}
return fd;
}
static void closefile(long fd)
{
asm nothrow
{
mov RAX, 3;
mov RDI, fd;
syscall;
}
}
static void cursorfile(long fd, long pos)
{
asm nothrow
{
mov RAX, 8;
mov RDI, fd;
mov RSI, pos;
mov RDX, 0;
syscall;
}
}
static void fout(string place, string crt, long cursor)
{
auto l = crt.length;
auto p = crt.ptr;
long fd = openfile(place, 66);
cursorfile(fd, cursor);
asm nothrow
{
mov RAX, 1;
mov RDI, fd;
mov RSI, p;
mov RDX, l;
syscall;
}
closefile(fd);
}
};
