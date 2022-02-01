PIC_LD=ld

ARCHIVE_OBJS=
ARCHIVE_OBJS += _404_archive_1.so
_404_archive_1.so : archive.0/_404_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -m elf_i386  -Bsymbolic  -o .//../simv.daidir//_404_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_404_archive_1.so $@





O0_OBJS =

$(O0_OBJS) : %.o: %.c
	$(CC_CG) $(CFLAGS_O0) -c -o $@ $<


%.o: %.c
	$(CC_CG) $(CFLAGS_CG) -c -o $@ $<
CU_UDP_OBJS = \


CU_LVL_OBJS = \
SIM_l.o 

MAIN_OBJS = \
objs/amcQw_d.o 

CU_OBJS = $(MAIN_OBJS) $(ARCHIVE_OBJS) $(CU_UDP_OBJS) $(CU_LVL_OBJS)

