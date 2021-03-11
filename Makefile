.PHONY: all, clean

# Disable implicit rules
.SUFFIXES:

CC=gcc
CFLAGS=-Wall -ansi -pedantic
SRCDIR=src
OBJDIR=bin
INCLUDEDIR=include

SRCS = $(wildcard $(SRCDIR)/*.c)
INCLUDE = $(SRCS:$(SRCDIR)/%.c=%.h)
OBJS = $(SRCS:$(SRCDIR)/%.c=$(OBJDIR)/%.o)
INCLDIR = -I$(INCLUDEDIR)

all: jeudechec
	@echo $(OBJS)

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) $(INCLDIR) -c -o $@ $<

jeudechec: $(OBJS)
	$(CC) $(OBJS) -o $@

clean:
	rm -f jeudechec *.o