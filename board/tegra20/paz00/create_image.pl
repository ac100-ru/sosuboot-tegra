#!/usr/bin/perl

use File::Slurp qw( :edit );
use File::Basename;

if (@ARGV != 6) {
	die "Usage: create_image.pl <uboot> <kernel> <initrd> <fdt> <script> <outfile>";
}

($uboot, $kernel, $initrd, $fdt, $script, $outfile) = (@ARGV);

if (! -e $uboot) {
	die "missing uboot image";
}

if (! -e $kernel) {
	die "missing kernel image";
}

if (! -e $initrd) {
	die "missing initrd image";
}

if (! -e $fdt) {
	die "missing device tree";
}

if (! -e $script) {
	die "missing uboot script";
}

print "Creating boot image for tegrarcm ...\n\n";

$padding = 0x10000;
$loadaddr = 0x108000;

($uboot_s, $kernel_s, $initrd_s, $fdt_s, $script_s) = (-s $uboot, -s $kernel, -s $initrd, -s $fdt, -s $script);

$uboot_a =  $loadaddr;
$kernel_a = pad($uboot_a + $uboot_s);
$initrd_a = pad($kernel_a + $kernel_s);
$fdt_a =    pad($initrd_a + $initrd_s);
$script_a = pad($fdt_a + $fdt_s);

parse_script();

open(OUT, ">$outfile");
append_file($uboot,  $uboot_a,  $uboot_s);
append_file($kernel, $kernel_a, $kernel_s);
append_file($initrd, $initrd_a, $initrd_s);
append_file($fdt,    $fdt_a,    $fdt_s);
append_file($script, $script_a, $script_s);
close(OUT);

# Patch u-boot binary
$findstr = q{for target in ${boot_targets}; do run bootcmd_${target}; done};
$l = length $findstr;
$replstr1 = sprintf("source 0x%x", $script_a);
$replstr2 = sprintf("%-".$l."s", $replstr1);
edit_file { s/\Q$findstr/$replstr2/s } $outfile;

unlink($script);

print "image layout:\nsection\t loadaddr\tsize\n=================================\n";
printf "uboot\t: 0x%x\t%d\nkernel\t: 0x%x\t%d\ninitrd\t: 0x%x\t%d\nfdt\t: 0x%x\t%d\nscript\t: 0x%x\t%d\n\n",
    $uboot_a, $uboot_s,
    $kernel_a, $kernel_s,
    $initrd_a, $initrd_s,
    $fdt_a, $fdt_s,
    $script_a, $script_s;

print "image written to $outfile\n";

sub pad {
    local $addr = shift;
    return $padding * (int($addr / $padding) + 1);
}

sub append_file {
    local ($file, $addr, $size) = (@_);
    print "$file, $addr, $size\n";
    open(INFILE, "<$file") or die;
    $a = read(INFILE, $buf, $size);
    close(INFILE);
    if ($a ne $size) {
	die "err ...$a ne $size\n";
    }
    seek(OUT, $addr - $loadaddr, 0);
    print OUT $buf;
}

sub parse_script {
    open(INFILE, "<$script") or die;
    read(INFILE, $buf, $script_s);
    close(INFILE);
    $a = sprintf("0x%x", $kernel_a); $buf =~ s/\@KERNEL/$a/g;
    $a = sprintf("0x%x", $initrd_a); $buf =~ s/\@INITRD/$a/g;
    $a = sprintf("0x%x", $fdt_a);    $buf =~ s/\@FDT/$a/g;
    $tmp_name = dirname($script) . "/tmp_" . basename($script);
    $u_script = dirname($script) . "/u_" . basename($script);
    print "$tmp_name\n";
    open(USCRIPT, ">$tmp_name") or die("$!");
    print USCRIPT $buf;
    close(USCRIPT);
    system("mkimage -A arm -T script -C none -n 'u-boot script' -d $tmp_name $u_script>/dev/null");
    unlink($tmp_name);
    $script = $u_script;
    $script_s = -s $script;
}
