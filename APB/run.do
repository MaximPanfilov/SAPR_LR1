# File: run_simple.do
# Максимально простая версия

quit -sim
.main clear

if {[file exists work]} {
    file delete -force work
}
vlib work
vmap work work

echo "Compiling APB design..."
vlog -sv -work work *.sv

vsim work.tb_apb

view wave

# Просто добавляем все сигналы интерфейса
add wave -noupdate -divider "APB Bus"
add wave -noupdate /tb_apb/apb_if/*

# Добавляем основные сигналы мастер и слейв
add wave -noupdate -divider "Master & Slave"
add wave -noupdate /tb_apb/master/*
add wave -noupdate /tb_apb/slave/*

wave zoom full
run 1000ns