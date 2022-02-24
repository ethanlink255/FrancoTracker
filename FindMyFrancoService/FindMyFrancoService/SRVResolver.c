#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <netdb.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <sys/utsname.h>
#include <arpa/nameser.h>
#include <resolv.h>

char* get_hostname(char* in){
    unsigned char answer[1024];
    char dispbuf[1024];
    ns_msg msg;
    ns_rr rr;

    int s = res_query(in, ns_c_any, ns_t_a, answer, 1024);
    if (s > 0){
        ns_initparse(answer, s, &msg);
        ns_parserr(&msg, ns_s_an, 0, &rr);
        ns_sprintrr(&msg, &rr, NULL, NULL, dispbuf, sizeof(dispbuf));
        char* pointer = malloc(1024);
        memcpy(pointer, dispbuf, sizeof(char) * 1024);
        return pointer;
    }else{
           herror("Error: ");
    }
    return "c";
}













