CFLAGS   += -std=c11 -O2 -Wall -Wno-pointer-sign -fsanitize=address,undefined
CPPFLAGS += -std=c++17 -O2 -Wall -Wctor-dtor-privacy -Weffc++ -Wempty-body -Werror -Wfloat-equal -Wformat-security -Wignored-qualifiers -Winit-self -Wlogical-op -Wmissing-field-initializers -Wnon-virtual-dtor -Wold-style-cast -Woverloaded-virtual -Wpointer-arith -Wshadow -Wsign-promo -Wstrict-null-sentinel -Wswitch-default -Wtype-limits

.PHONY: all clear

all: main

main: main.o
	g++ $(CPPFLAGS) $^ -o $@

main.o: main.cpp
	g++ $(CPPFLAGS) -c $< -o $@

clear:
	rm -rf *.o
