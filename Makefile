##
# MPInteger class Makefile
#
# Built from Bill Garrison's Objective-C Class Makefile Template
#
# This file is part of the MPInteger library
# Distributed under the GNU General Public License
#
# Written by Bill Garrison
# Last changed 2008 Dec 22
##

###  Begin Class Parameters ###

ProjectName = MPInteger
Pieces = Declare Init Set Convert Arithmetic Get Division Exponent Compare \
   NumberTheory Random Constants
OtherPrintables = 

### End Project Parameters ###

### Begin Class Dependencies ###

all: objects

Init.o: Declare.h Get.h Random.h
Set.o: Declare.h Get.h
Convert.o: Declare.h Get.h Init.h
Arithmetic.o: Declare.h Get.h Init.h
Division.o: Declare.h Get.h Init.h
Get.o: Declare.h
Exponent.o: Declare.h Get.h Init.h
Compare.o: Declare.h Get.h
NumberTheory.o: Declare.h Get.h Init.h
Random.o: Declare.h Get.h
Constants.o: Declare.h Init.h Exponent.h

### End Class Dependencies ###

### Begin Generic Expansions ###

Sources = $(Pieces:=.m)
Headers = $(ProjectName).h $(Pieces:=.h)
Objects = $(Pieces:=.o)
PrefixExpanded = $(addsuffix /include/,$(addprefix -I,$(Prefix)))
CflagsExpanded = $(CFlags) $(PrefixExpanded)

### End Generic Expansions ###

### Begin Generic Rules ###

objects: $(Objects)

%.o: %.m %.h
	$(CC) -c $(CflagsExpanded) $< -o $@

%.o: %.m
	$(CC) -c $(CflagsExpanded) $< -o $@

remake: clean all

clean:
	$(RM) $(Objects) $(PrintTemp).txt

PrintHelper:
	-$(MORE) $(Headers) $(Sources) $(OtherPrintables) > $(PrintTemp).txt

### End Generic Rules ###

