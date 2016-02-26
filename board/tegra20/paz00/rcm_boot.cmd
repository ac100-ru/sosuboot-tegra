echo "== tegra rcm ram script =="
setenv bootargs 'console=tty console=ttyS0,115200n8 no_console_suspend=1 ignore_loglevel earlyprintk initcall_debug'
setenv initrd_high ''
setenv fdt_high ''
bootz @KERNEL @INITRD @FDT
