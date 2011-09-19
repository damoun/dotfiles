(define-skeleton create-makefile
"Create a great makefile :p."
""
"## Name of project
NAME		= 

## Version
# (DEBUG or RELEASE)
V		= DEBUG

OS		= `uname -s`
ARCH		= `uname -p`

## Directory
SRCDIR		= src
INCDIR		= include
LIBDIR		= lib
DOCDIR		= doc

## Source
SRC		= $(SRCDIR)/main.c

OBJ		= $(SRC:.c=.o)

LIBS		= 

## Binary
CC		= gcc
RM		= rm -f
ECHO		= echo
PRINTF		= printf
ETAGS		= etags
READ${PAGER}	= ${PAGER}
READ		= more

## Flags
OFLAGS_DEBUG	= -ggdb
OFLAGS_RELEASE	= -O2 -fomit-frame-pointer
WFLAGS		= -W -Wall -Werror -Wstrict-prototypes -ansi -pedantic
IFLAGS		= -I$(INCDIR)
DFLAGS		= -D(V)
CFLAGS		+= $(WFLAGS) $(IFLAGS) $(OFLAGS_$(V)) $(DFLAGS)
LDFLAGS		+= -L$(LIBDIR)/ $(LIBS)

## Rules
$(NAME)		: $(OBJ)
		  $(CC) -o $(NAME) $(OBJ) $(LDFLAGS)

clean		:
		  -$(RM) $(OBJ)

all		: $(NAME)

fclean		: clean
		  -$(RM) $(NAME)

re		: fclean all

.PHONY		: all clean re

.c.o		: 
		  $(CC) $(CFLAGS) -o $@ -c $<

check-syntax	:
		  $(CC) $(CFLAGS) -o null -c $(CHK_SOURCES)
		  -@$(RM) null

man		:
		  -$(READ) $(DOCDIR)/man

tag		:
		  $(ETAGS) $(INCDIR)/*.h $(SRC)
")
