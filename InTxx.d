/* This library is maked in use of General Public License (GPL) 3.0 
--DELETE THIS LINE IS NOT ALLOWED--Copyright Artur
Maked by: Artur
XArtur
@gamarturgamedev GitHub
*/
module InTxx;
struct icout
{
public:
ref opBinary(string op : "<<")(string msg)
{
auto p = msg.ptr;
auto l = msg.length;
asm nothrow
{
mov RAX, 1;
mov RDI, 1;
mov RSI, p;
mov RDX, l;
syscall;
}
return this;
}
};
alias char[4096] read_var;
char[4096] ReadLine()
{
char[4096] point = 0;
auto s = point.length;
auto l = point.ptr;
asm nothrow
{
mov RAX, 0;
mov RDI, 0;
mov RSI, l;
mov RDX, s;
syscall;
}
return point;
}
struct iexit
{
void opBinary(string op : ">>")(long code)
{
asm nothrow
{
mov RAX, 60;
mov RDI, code;
syscall;
}
}
};
struct iwait
{
void opBinary(string op : "+")(long* point)
{
asm nothrow
{
mov RAX, 35;
mov RDI, point;
mov RSI, 0;
syscall;
}
}
void opBinary(string op : ">>")(long[2] time)
{
auto timepointer = time.ptr;
asm nothrow
{
mov RAX, 35;
mov RDI, timepointer;
mov RSI, 0;
syscall;
}
}
// Warning: wait >> can use more RAM than wait +
};
__gshared icout cout;
__gshared iexit exit;
__gshared iwait wait;
