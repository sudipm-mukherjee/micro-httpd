# pod2man.mk -- Makefile portion to convert *.pod files to manual pages
#
#   Copyright information
#
#	Copyright (C) 2008-2009 Jari Aalto
#
#   License
#
#	This program is free software; you can redistribute it and/or
#	This program is free software; you can redistribute it and/or
#	modify it under the terms of the GNU General Public License as
#	published by the Free Software Foundation; either version 2 of the
#	License, or (at your option) any later version
#
#	This program is distributed in the hope that it will be useful, but
#	WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
#	General Public License for more details at
#	Visit <http://www.gnu.org/copyleft/gpl.html>.
#
#   Description
#
# 	Convert *.pod files to manual pages. Write this to 'install'
# 	target:
#
#       install: build $(MANPAGE)

ifneq (,)
This makefile requires GNU Make.
endif

# These variables *must* be set when calling
PACKAGE		= package
PODCENTER	= $$(date "+%Y-%m-%d")
MANSECT		= 1

# Directories
MANSRC		=
MANDEST		= $(MANSRC)

MANPOD		= $(MANSRC)$(PACKAGE).$(MANSECT).pod
MANPAGE		= $(MANDEST)$(PACKAGE).$(MANSECT)

# FIXME: Remove 2009
# >= 5.10.0-16 has --utf8 option
POD2MAN		= pod2man
POD2MAN_FLAGS	= --utf8

makeman: $(MANPAGE)

$(MANPAGE): $(MANPOD)
	LC_ALL= LANG=C $(POD2MAN) $(POD2MAN_FLAGS) \
		--center="$(PODCENTER)" \
		--name="$(PACKAGE)" \
		--section="$(MANSECT)" \
		$(MANPOD) \
	| sed 's,[Pp]erl v[0-9.]\+,$(PACKAGE),' \
	  > $(MANPAGE) && \
	rm -f pod*.tmp

# End of of Makefile part
