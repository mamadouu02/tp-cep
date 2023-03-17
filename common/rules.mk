RVDIR ?= /matieres/3MMCEP/riscv
AS = $(RVDIR)/bin/riscv32-unknown-elf-gcc
ASFLAGS = -g -c
CC = $(AS)
CFLAGS = -nostdinc -Wall -Wextra -g -std=c99 -mabi=ilp32 -mcmodel=medany -ffunction-sections -fdata-sections -fomit-frame-pointer -g
CFLAGS += -I$(RVDIR)/include
LD = $(AS)
LDFLAGS = -L$(RVDIR)/lib -L$(RVDIR)/lib/cep_riscv_no_it
LDFLAGS += -T cep.ld -nostartfiles -nostdlib -static -Wl,--nmagic -Wl,--gc-sections
COMMON ?= $$(cd ../common;pwd)
# Ajoute le contenu de BADGES_TARGET à BINS, excepté un préfixe terminant par __. Exemple : niv1__foo_bar devient foo_bar
# /!\ Pas de __ autorisé dans la suite car on découpe à chaque __
BADGE_NAMES = $(foreach f, $(BADGES_TARGET),$(word 2, $(subst __, ,$f)))
BINS += $(BADGE_NAMES)

.PHONY: all
all: $(BINS)

%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<

%.ctxt: fct_%.s
	@sed -n "/DEBUT DU CONTEXTE/,/FIN DU CONTEXTE/p" $< | sed '1,1d; $$d' > $@

%.stxetd: fct_%.s
	fonction=$*;awk -f $(COMMON)/syntaxe_etd.awk -v fonction=$$fonction $< > $@;cat $@

STXETDOUTS = $(foreach f, $(BINS), $(addsuffix .stxetd, $f))
SORTIES = $(foreach f, $(BINS), $(addsuffix .sortie, $f))
CONTEXTS = $(foreach f, $(BADGE_NAMES), $(addsuffix .ctxt, $f))
OBJS = $(foreach f, $(BINS), $(addsuffix .o, $f)) \
	$(foreach f, $(BINS), $(addprefix fct_, $(addsuffix .o, $f)))

.PHONY: clean clean_std validate_contexts
clean:
	$(RM) $(BINS) $(OBJS) $(TMPOBJS) $(CONTEXTS) $(STXETDOUTS) $(SORTIES)

