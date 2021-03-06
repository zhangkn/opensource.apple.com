/*
 * Copyright (c) 1999 Apple Computer, Inc. All rights reserved.
 *
 * @APPLE_LICENSE_HEADER_START@
 * 
 * Copyright (c) 1999-2003 Apple Computer, Inc.  All Rights Reserved.
 * 
 * This file contains Original Code and/or Modifications of Original Code
 * as defined in and that are subject to the Apple Public Source License
 * Version 2.0 (the 'License'). You may not use this file except in
 * compliance with the License. Please obtain a copy of the License at
 * http://www.opensource.apple.com/apsl/ and read it before using this
 * file.
 * 
 * The Original Code and all software distributed under the License are
 * distributed on an 'AS IS' basis, WITHOUT WARRANTY OF ANY KIND, EITHER
 * EXPRESS OR IMPLIED, AND APPLE HEREBY DISCLAIMS ALL SUCH WARRANTIES,
 * INCLUDING WITHOUT LIMITATION, ANY WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE, QUIET ENJOYMENT OR NON-INFRINGEMENT.
 * Please see the License for the specific language governing rights and
 * limitations under the License.
 * 
 * @APPLE_LICENSE_HEADER_END@
 */
#if defined(LIBC_SCCS) && !defined(lint)
#if 0
static char	elsieid[] = "@(#)ialloc.c	8.28";
#else
static char rcsid[] = "$OpenBSD: ialloc.c,v 1.3 1997/01/14 03:16:45 millert Exp $";
#endif
#endif /* LIBC_SCCS and not lint */

/*LINTLIBRARY*/

#include "private.h"

#define nonzero(n)	(((n) == 0) ? 1 : (n))

char *	icalloc P((int nelem, int elsize));
char *	icatalloc P((char * old, const char * new));
char *	icpyalloc P((const char * string));
char *	imalloc P((int n));
void *	irealloc P((void * pointer, int size));
void	ifree P((char * pointer));

char *
imalloc(n)
const int	n;
{
	return malloc((size_t) nonzero(n));
}

char *
icalloc(nelem, elsize)
int	nelem;
int	elsize;
{
	if (nelem == 0 || elsize == 0)
		nelem = elsize = 1;
	return calloc((size_t) nelem, (size_t) elsize);
}

void *
irealloc(pointer, size)
void * const	pointer;
const int	size;
{
	if (pointer == NULL)
		return imalloc(size);
	return realloc((void *) pointer, (size_t) nonzero(size));
}

char *
icatalloc(old, new)
char * const		old;
const char * const	new;
{
	register char *	result;
	register int	oldsize, newsize;

	newsize = (new == NULL) ? 0 : strlen(new);
	if (old == NULL)
		oldsize = 0;
	else if (newsize == 0)
		return old;
	else	oldsize = strlen(old);
	if ((result = irealloc(old, oldsize + newsize + 1)) != NULL)
		if (new != NULL)
			(void) strcpy(result + oldsize, new);
	return result;
}

char *
icpyalloc(string)
const char * const	string;
{
	return icatalloc((char *) NULL, string);
}

void
ifree(p)
char * const	p;
{
	if (p != NULL)
		(void) free(p);
}

void
icfree(p)
char * const	p;
{
	if (p != NULL)
		(void) free(p);
}
