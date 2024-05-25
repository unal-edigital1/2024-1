transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/UECCI/Documents/UNAL/digital1/2024-1/labs/visualizacion/matriz8x8SPI/src {C:/Users/UECCI/Documents/UNAL/digital1/2024-1/labs/visualizacion/matriz8x8SPI/src/spi_master.v}
vlog -vlog01compat -work work +incdir+C:/Users/UECCI/Documents/UNAL/digital1/2024-1/labs/visualizacion/matriz8x8SPI/src {C:/Users/UECCI/Documents/UNAL/digital1/2024-1/labs/visualizacion/matriz8x8SPI/src/fsm_matriz8x8.v}

vlog -vlog01compat -work work +incdir+C:/Users/UECCI/Documents/UNAL/digital1/2024-1/labs/visualizacion/matriz8x8SPI/src {C:/Users/UECCI/Documents/UNAL/digital1/2024-1/labs/visualizacion/matriz8x8SPI/src/fsm_matriz8x8_TB.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  fsm_matriz8x8_TB

add wave *
view structure
view signals
run -all
