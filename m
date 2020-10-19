Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUePd-0005xX-Ma
	for mharc-qemu-riscv@gnu.org; Mon, 19 Oct 2020 19:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1kUePb-0005t7-MP
 for qemu-riscv@nongnu.org; Mon, 19 Oct 2020 19:17:55 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:38924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1kUePY-0008KT-VC
 for qemu-riscv@nongnu.org; Mon, 19 Oct 2020 19:17:55 -0400
Received: by mail-pf1-x441.google.com with SMTP id e15so899692pfh.6
 for <qemu-riscv@nongnu.org>; Mon, 19 Oct 2020 16:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=1KQ07sXMaHVok7AY4+T1rqohkrxZW0GlaJcWBOFPTYI=;
 b=Sn8Rg/ReLK33UjvaOHnCV9KAmFclfgpokS/FwXzYfnE3EwD3o3ETVsTQOWb0ARGLdu
 GMJeLY0gvS5be7+WlQXDuSFavfbL5CZD8KbJMnut5vXx/BSzdKrY8qy+WN+EiNlrGz7r
 fcr9kBw8qbG006n6O7zqR0K6JO3h+GxStVifnOUJ+fQ6sWf0OBTS1lYvTgTOQroXHQTE
 Y3lt51GuMaM3yzmm4AsmhyEZLq3VUu9XrJLw7gYokLD5eTcpeiv3Y2F+GlzMUKHPXjQK
 1PysKkdW9+4sq1Uz1z1YcOT/k3e63kjx4zeN8yA/0vErbtr/FKhpbJFCn8hysJVB5Q5z
 Wbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=1KQ07sXMaHVok7AY4+T1rqohkrxZW0GlaJcWBOFPTYI=;
 b=D0N2HuXJY8HMuOIHH2arOuLIKpozHYBBOuC2vnzfp54Qm6gIc9wdVCYlw6c2Rcbtnd
 p+L1iy6oYNnAQsgbPYSxQJ3LTiKIow3v+WGH7z9puLX2tneyh7roNFXKgIPsunt8XsBN
 sGze7LO9uZN9T/RenmA/OGX9lMaY5oGpR963vVOPUTU7Ig//s87YpMBH2eyAgZBWemnt
 VKclGs+PxgHpOJfQ22kmhgl18vHZtJNxqGf5epupQOcKAtLrxjoEKswQKthXI6RNjop4
 n08uxkmvQ7PTiRZmAkTJ0lZW0CGfXX/Q+GBbhMWxS2IH9ZrxfyGPc0dQKusWH6WrmhCm
 rPfQ==
X-Gm-Message-State: AOAM533vt3+sqhvq0mKfWl7df4SMUFt4E/ocMPh3fQbuekTw1eauD/LH
 SVhEOoa2uzFNwVYP4BK8Bl2uUA==
X-Google-Smtp-Source: ABdhPJxgPVpysAm4TJVQjT4IPmuD7skbZmwV03Lf0ttcKwJzietMgzIaxK4ZjI9j5kZm7SG8Li0LRg==
X-Received: by 2002:aa7:864a:0:b029:158:e6ba:5548 with SMTP id
 a10-20020aa7864a0000b0290158e6ba5548mr2461080pfo.1.1603149471436; 
 Mon, 19 Oct 2020 16:17:51 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id o134sm51758pfg.134.2020.10.19.16.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 16:17:50 -0700 (PDT)
Date: Mon, 19 Oct 2020 16:17:50 -0700 (PDT)
X-Google-Original-Date: Mon, 19 Oct 2020 16:17:33 PDT (-0700)
Subject: Re: [PATCH v2 4/4] hw/riscv: Load the kernel after the firmware
In-Reply-To: <46c00c4f15b42feb792090e3d74359e180a6d954.1602634524.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, bmeng.cn@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-edae75d6-b722-4341-b5dc-85bbaff0bf6d@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=palmer@dabbelt.com; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Oct 2020 23:17:56 -0000

On Tue, 13 Oct 2020 17:17:33 PDT (-0700), Alistair Francis wrote:
> Instead of loading the kernel at a hardcoded start address, let's load
> the kernel at the next alligned address after the end of the firmware.
>
> This should have no impact for current users of OpenSBI, but will
> allow loading a noMMU kernel at the start of memory.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/riscv/boot.h |  3 +++
>  hw/riscv/boot.c         | 19 ++++++++++++++-----
>  hw/riscv/opentitan.c    |  3 ++-
>  hw/riscv/sifive_e.c     |  3 ++-
>  hw/riscv/sifive_u.c     | 10 ++++++++--
>  hw/riscv/spike.c        | 11 ++++++++---
>  hw/riscv/virt.c         | 11 ++++++++---
>  7 files changed, 45 insertions(+), 15 deletions(-)
>
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index 2975ed1a31..0b01988727 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -25,6 +25,8 @@
>
>  bool riscv_is_32_bit(MachineState *machine);
>
> +target_ulong riscv_calc_kernel_start_addr(MachineState *machine,
> +                                          target_ulong firmware_end_addr);
>  target_ulong riscv_find_and_load_firmware(MachineState *machine,
>                                            const char *default_machine_firmware,
>                                            hwaddr firmware_load_addr,
> @@ -34,6 +36,7 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
>                                   hwaddr firmware_load_addr,
>                                   symbol_fn_t sym_cb);
>  target_ulong riscv_load_kernel(const char *kernel_filename,
> +                               target_ulong firmware_end_addr,
>                                 symbol_fn_t sym_cb);
>  hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
>                           uint64_t kernel_entry, hwaddr *start);
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 5dea644f47..9b3fe3fb1e 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -33,10 +33,8 @@
>  #include <libfdt.h>
>
>  #if defined(TARGET_RISCV32)
> -# define KERNEL_BOOT_ADDRESS 0x80400000
>  #define fw_dynamic_info_data(__val)     cpu_to_le32(__val)
>  #else
> -# define KERNEL_BOOT_ADDRESS 0x80200000
>  #define fw_dynamic_info_data(__val)     cpu_to_le64(__val)
>  #endif
>
> @@ -49,6 +47,15 @@ bool riscv_is_32_bit(MachineState *machine)
>      }
>  }
>
> +target_ulong riscv_calc_kernel_start_addr(MachineState *machine,
> +                                          target_ulong firmware_end_addr) {
> +    if (riscv_is_32_bit(machine)) {
> +        return QEMU_ALIGN_UP(firmware_end_addr, 4 * MiB);
> +    } else {
> +        return QEMU_ALIGN_UP(firmware_end_addr, 2 * MiB);
> +    }
> +}
> +
>  target_ulong riscv_find_and_load_firmware(MachineState *machine,
>                                            const char *default_machine_firmware,
>                                            hwaddr firmware_load_addr,
> @@ -123,7 +130,9 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
>      exit(1);
>  }
>
> -target_ulong riscv_load_kernel(const char *kernel_filename, symbol_fn_t sym_cb)
> +target_ulong riscv_load_kernel(const char *kernel_filename,
> +                               target_ulong kernel_start_addr,
> +                               symbol_fn_t sym_cb)
>  {
>      uint64_t kernel_entry;
>
> @@ -138,9 +147,9 @@ target_ulong riscv_load_kernel(const char *kernel_filename, symbol_fn_t sym_cb)
>          return kernel_entry;
>      }
>
> -    if (load_image_targphys_as(kernel_filename, KERNEL_BOOT_ADDRESS,
> +    if (load_image_targphys_as(kernel_filename, kernel_start_addr,
>                                 ram_size, NULL) > 0) {
> -        return KERNEL_BOOT_ADDRESS;
> +        return kernel_start_addr;
>      }
>
>      error_report("could not load kernel '%s'", kernel_filename);
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index 0531bd879b..cc758b78b8 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -75,7 +75,8 @@ static void opentitan_board_init(MachineState *machine)
>      }
>
>      if (machine->kernel_filename) {
> -        riscv_load_kernel(machine->kernel_filename, NULL);
> +        riscv_load_kernel(machine->kernel_filename,
> +                          memmap[IBEX_DEV_RAM].base, NULL);
>      }
>  }
>
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index fcfac16816..59bac4cc9a 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -114,7 +114,8 @@ static void sifive_e_machine_init(MachineState *machine)
>                            memmap[SIFIVE_E_DEV_MROM].base, &address_space_memory);
>
>      if (machine->kernel_filename) {
> -        riscv_load_kernel(machine->kernel_filename, NULL);
> +        riscv_load_kernel(machine->kernel_filename,
> +                          memmap[SIFIVE_E_DEV_DTIM].base, NULL);
>      }
>  }
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 5f3ad9bc0f..b2472c6627 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -415,6 +415,7 @@ static void sifive_u_machine_init(MachineState *machine)
>      MemoryRegion *main_mem = g_new(MemoryRegion, 1);
>      MemoryRegion *flash0 = g_new(MemoryRegion, 1);
>      target_ulong start_addr = memmap[SIFIVE_U_DEV_DRAM].base;
> +    target_ulong firmware_end_addr, kernel_start_addr;
>      uint32_t start_addr_hi32 = 0x00000000;
>      int i;
>      uint32_t fdt_load_addr;
> @@ -474,10 +475,15 @@ static void sifive_u_machine_init(MachineState *machine)
>          break;
>      }
>
> -    riscv_find_and_load_firmware(machine, BIOS_FILENAME, start_addr, NULL);
> +    firmware_end_addr = riscv_find_and_load_firmware(machine, BIOS_FILENAME,
> +                                                     start_addr, NULL);
>
>      if (machine->kernel_filename) {
> -        kernel_entry = riscv_load_kernel(machine->kernel_filename, NULL);
> +        kernel_start_addr = riscv_calc_kernel_start_addr(machine,
> +                                                         firmware_end_addr);
> +
> +        kernel_entry = riscv_load_kernel(machine->kernel_filename,
> +                                         kernel_start_addr, NULL);
>
>          if (machine->initrd_filename) {
>              hwaddr start;
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 3fd152a035..facac6e7d2 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -195,6 +195,7 @@ static void spike_board_init(MachineState *machine)
>      MemoryRegion *system_memory = get_system_memory();
>      MemoryRegion *main_mem = g_new(MemoryRegion, 1);
>      MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
> +    target_ulong firmware_end_addr, kernel_start_addr;
>      uint32_t fdt_load_addr;
>      uint64_t kernel_entry;
>      char *soc_name;
> @@ -261,12 +262,16 @@ static void spike_board_init(MachineState *machine)
>      memory_region_add_subregion(system_memory, memmap[SPIKE_MROM].base,
>                                  mask_rom);
>
> -    riscv_find_and_load_firmware(machine, BIOS_FILENAME,
> -                                 memmap[SPIKE_DRAM].base,
> -                                 htif_symbol_callback);
> +    firmware_end_addr = riscv_find_and_load_firmware(machine, BIOS_FILENAME,
> +                                                     memmap[SPIKE_DRAM].base,
> +                                                     htif_symbol_callback);
>
>      if (machine->kernel_filename) {
> +        kernel_start_addr = riscv_calc_kernel_start_addr(machine,
> +                                                         firmware_end_addr);
> +
>          kernel_entry = riscv_load_kernel(machine->kernel_filename,
> +                                         kernel_start_addr,
>                                           htif_symbol_callback);
>
>          if (machine->initrd_filename) {
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 41bd2f38ba..6bfd10dfc7 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -493,6 +493,7 @@ static void virt_machine_init(MachineState *machine)
>      char *plic_hart_config, *soc_name;
>      size_t plic_hart_config_len;
>      target_ulong start_addr = memmap[VIRT_DRAM].base;
> +    target_ulong firmware_end_addr, kernel_start_addr;
>      uint32_t fdt_load_addr;
>      uint64_t kernel_entry;
>      DeviceState *mmio_plic, *virtio_plic, *pcie_plic;
> @@ -602,11 +603,15 @@ static void virt_machine_init(MachineState *machine)
>      memory_region_add_subregion(system_memory, memmap[VIRT_MROM].base,
>                                  mask_rom);
>
> -    riscv_find_and_load_firmware(machine, BIOS_FILENAME,
> -                                 memmap[VIRT_DRAM].base, NULL);
> +    firmware_end_addr = riscv_find_and_load_firmware(machine, BIOS_FILENAME,
> +                                                     start_addr, NULL);
>
>      if (machine->kernel_filename) {
> -        kernel_entry = riscv_load_kernel(machine->kernel_filename, NULL);
> +        kernel_start_addr = riscv_calc_kernel_start_addr(machine,
> +                                                         firmware_end_addr);
> +
> +        kernel_entry = riscv_load_kernel(machine->kernel_filename,
> +                                         kernel_start_addr, NULL);
>
>          if (machine->initrd_filename) {
>              hwaddr start;

It's probably worth going through and making sure we mark the right regions as
reserved in the DT, as with these being mobile we might run into latent bugs.
I haven't actually looked so maybe we're fine, but IIRC we sort of papered over
a handful of memory layout agreements that weren't even in specs (or event
meant to be in specs) that have stuck around for quite a while.

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

