# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() {
do.cleanup=1
do.cleanuponabort=0
} # end properties

# shell variables
block=
is_slot_device=0;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;

## AnyKernel permissions
# set permissions for included ramdisk files
chmod -R 755 $ramdisk
chmod +x $ramdisk/sbin/spa

# Find boot partition
find_boot;

## AnyKernel install
dump_boot;

# begin ramdisk changes

# init.rc
backup_file init.rc;
insert_line init.rc "import /init.spectrum.rc" after "import /init.trace.rc" "import /init.spectrum.rc"
# end ramdisk changes

write_boot;

# end install

# Add empty profile locations
mkdir /data/spectrum;
touch /data/spectrum/balance.profile;
touch /data/spectrum/performance.profile;
touch /data/spectrum/battery.profile;
touch /data/spectrum/gaming.profile;
