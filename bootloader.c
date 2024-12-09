#include <Uefi.h>
#include <Library/UefiLib.h>


EFI_STATUS EFIAPI efi_main(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable) {
    // コンソールに文字列を出力
    SystemTable->ConOut->OutputString(SystemTable->ConOut, L"Hello, UEFI World!\n");
    while(1);
    return EFI_SUCCESS;
}
        
