BADGES_TARGET = niv5__exo1 niv5__exo2 niv5__exo3 niv5__exo4 niv1__it niv2__timer
BINS = it_incr_decr timer_raz timer_raz_btn0 timer_papl
TMPOBJS = crt.o cep_excp.o


COMMON := ../common
include $(COMMON)/rules.mk
ASFLAGS += -x assembler-with-cpp


crt.o : crt.s cep_platform.h

fct_it.o : cep_platform.h crt.o
it: it.o fct_it.o

fct_it_incr_decr.o : cep_platform.h crt.o
it_incr_decr: it_incr_decr.o fct_it_incr_decr.o

fct_timer.o : cep_platform.h
timer: timer.o fct_timer.o cep_excp.o

fct_timer_raz.o : cep_platform.h
timer_raz: timer_raz.o fct_timer_raz.o cep_excp.o

fct_timer_raz_btn0.o : cep_platform.h
timer_raz_btn0: timer_raz_btn0.o fct_timer_raz_btn0.o cep_excp.o

fct_timer_papl.o : cep_platform.h
timer_papl: timer_papl.o fct_timer_papl.o cep_excp.o

# Pour l'examen
exo1: exo1.o fct_exo1.o
exo2: exo2.o fct_exo2.o
exo3: exo3.o fct_exo3.o
exo4: exo4.o fct_exo4.o
