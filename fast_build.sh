#comelang -nostdlib -Wl,--subsystem,10 -shared -o bootloader.efi bootloader.c -I$HOME/edk2/MdePkg/Include -I$HOME/edk2/MdePkg/Include/X64 -e efi_main -v
x86_64-w64-mingw32-gcc -nostdlib -Wl,--subsystem,10 -shared -o bootloader.efi bootloader.c -I ~/edk2/MdePkg/Include -I ~/edk2/MdePkg/Include/X64 -e efi_main

sudo dd if=/dev/zero of=uefi.img bs=1M count=64
sudo mkfs.fat -n 'UEFI' -s 1 -F 32 uefi.img

sudo mkdir -p mnt
sudo mount uefi.img mnt
sudo mkdir -p mnt/EFI/BOOT
sudo cp bootloader.efi mnt/EFI/BOOT/BOOTX64.EFI
sudo umount mnt

sudo qemu-system-x86_64 -drive file=uefi.img,format=raw -bios ./OVMF.fd -d int
#sudo qemu-system-x86_64 -drive file=uefi.img,format=raw -bios /usr/share/OVMF/OVMF_CODE.fd -d int






#qemu-img create -f raw fat.img 64M
#mkfs.fat -F 32 fat.img
#mkdir -p mnt
#sudo mount -o loop fat.img mnt
#sudo cp bootloader.efi mnt/EFI/BOOT/BOOTX64.EFI
#sudo umount mnt

#qemu-system-x86_64 \
#  -drive if=pflash,format=raw,file=OVMF.fd \
#    -drive format=raw,file=fat.img \
#      -m 512M \
#        -cpu qemu64

#mkdir -p image/EFI/BOOT/
#cp bootloader.efi image/EFI/BOOT

#qemu-system-x86_64 -pflash ./OVMF.fd -hda fat:image/

#rm -rf disk.img
#
#dd if=/dev/zero of=disk.img bs=1m count=64
#diskutil partitionDisk $(hdiutil attach -nomount disk.img) GPT FAT32 EFI 100%
#diskutil list
#mkdir -p /Volumes/EFI/EFI/BOOT
#cp bootloader.efi /Volumes/EFI/EFI/BOOT
#
#sudo umount /Volumes/EFI
#
#qemu-system-x86_64 -pflash ./OVMF.fd -drive format=raw,file=disk.img,file.locking=off


#rm -rf disk.img
#mkdir -p EFI/BOOT
#cp bootloader.efi EFI/BOOT/BOOTX64.EFI
#sudo mkfs.fat -C disk.img 1440
#sudo mmd -i disk.img ::/EFI
#sudo mmd -i disk.img ::/EFI/BOOT
#sudo mcopy -i disk.img EFI/BOOT/BOOTX64.EFI ::/EFI/BOOT

#sudo chown ab25cq:staff disk.img

#qemu-system-x86_64 -pflash ./OVMF.fd -fda disk.img
    
