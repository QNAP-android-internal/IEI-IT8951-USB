TARGET = fltest_it8951_usb

include ../makefile_cfg

#SDK_PATH = ../../sdk_lib

all: check install
	@echo "make finish!!!"

$(TARGET): main.c it8951.c
	$(CC) main.c it8951.c -o $(TARGET)
	
.PHONY: check clean cleanall distclean install

check:
	@echo -e $(TOOLTRAIN_ERR_STRING)

clean: 
	@rm -f $(TARGET)
cleanall:clean
	-rm -f $(INSTALL_PATH)/$(TARGET) 
distclean: cleanall 

install: $(TARGET)
	@cp $(TARGET) $(INSTALL_PATH)
	@echo -e '\e[1;33m cp -f $(TARGET) $(INSTALL_PATH) \e[0m'
