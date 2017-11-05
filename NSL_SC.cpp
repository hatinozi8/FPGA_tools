#ifndef HSL_SC_H
#define NSL_SC_H
#include<systemc.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

template<typename T> int _nsl_readmem(T array[], const char *file, int start, int end, int sft) {
	FILE *txt;
	uint64_t addr,data;
	int i,bit,c,lastch,incomm;
	if((txt=fopen(file,"r"))==NULL) {
		fprintf(stderr,"Could not open file %s\n",file);		return(1);
	}
	addr = start;
	data =  0;
	lastch=0;
	incomm=0;
	while((c=fgetc(txt))!=EOF) {
		unsigned int ch;
		if(incomm) {
			if(c=='\n') incomm=0;
			continue;
		}
		if(c=='#') {incomm++; continue;}
		if(c=='_' || c=='\r' ) continue;
		if(!lastch && (c==' ' || c=='\t' || c=='\n') ) continue;
		lastch=c;
		ch = c - 97;
		if(sft==4 && ch<6) {
			data=(data << sft);
			data = (data + ch + 10);
		}
		else if(sft==4 && ch+32 < 6) {
			data=(data << sft);
			data = (data + ch + 32 + 10);
		}
		else if(sft==4 && ch+49 < 10) {
			data=(data << sft);
			data = (data + ch + 49);
		}
		else if(sft==1 && ch+49 < 2) {
			data=(data << sft);
			data = (data + ch + 49);
		}
		else {
			array[addr] =  data;
			addr++;
			if(addr>end) break;
			lastch=0;
			data=0;
			continue;
		}
	}
	fclose(txt);
	return 0;
}
//void _nsl_hook(const char *file, int line, int attrib, const char *name) {}
#endif
