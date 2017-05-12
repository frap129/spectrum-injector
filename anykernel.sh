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
grep "import /init.spectrum.rc" init.rc >/dev/null || sed -i '1,/.*import.*/s/.*import.*/import \/init.spectrum.rc\n&/' init.rc
# end ramdisk changes

write_boot;

# end install

# Add empty profile locations
ui_print " "; ui_print "Creating /data/media/0/Spectrum..."
mkdir /data/media/0/Spectrum;
mkdir /data/media/0/Spectrum/profiles;
ui_print " "; ui_print "Creating empty profile files..."
touch /data/media/0/Spectrum/profiles/balance.profile;
touch /data/media/0/Spectrum/profiles/performance.profile;
touch /data/media/0/Spectrum/profiles/battery.profile;
touch /data/media/0/Spectrum/profiles/gaming.profile;
