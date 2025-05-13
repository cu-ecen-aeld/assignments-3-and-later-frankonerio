
CC = $(CROSS_COMPILE)gcc
CFLAGS = -Wall -Werror -g
TARGET = writer
OBJ = writer.o

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(TARGET) *.o
