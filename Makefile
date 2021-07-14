CPU         := cortex-m4

BUILD_DIR   := build
SRC_DIR     := src

SRCS        := $(shell find $(SRC_DIR) -name "*.c")
OBJS        := $(SRCS:%=$(BUILD_DIR)/%.o)
INC_DIRS    := $(shell find $(SRC_DIR) -type d)
INC_FLAGS   := $(addprefix -I,$(INC_DIRS))

TARGET      := output
CC          := arm-none-eabi-gcc
OBJCOPY     := arm-none-eabi-objcopy
SIZE        := arm-none-eabi-size
CFLAGS      := -mcpu=$(CPU) -mthumb -Wall -O0 -std=gnu99 ${INC_FLAGS}
LDFLAGS     := -mcpu=$(CPU) -mthumb -nostdlib -T $(SRC_DIR)/stm32_ls.ld -Wl,-Map=$(BUILD_DIR)/$(TARGET).map

$(BUILD_DIR)/$(TARGET): $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS) -o $@.elf
	$(OBJCOPY) -j .text -j .data -O ihex $@.elf $@.hex
	$(SIZE) $@.elf

$(BUILD_DIR)/%.c.o: %.c
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	$(RM) -r $(BUILD_DIR)

.PHONY: openocd
openocd:
	openocd -f board/stm32f4discovery.cfg 

