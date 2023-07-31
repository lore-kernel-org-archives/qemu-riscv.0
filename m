Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC4CC001DE
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 22:46:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qQbf5-0006T6-ND; Mon, 31 Jul 2023 18:46:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qQbf3-0006S4-KT
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 18:46:45 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qQbf1-00079P-5K
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 18:46:45 -0400
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3a5a7e7cd61so3184855b6e.0
 for <qemu-riscv@nongnu.org>; Mon, 31 Jul 2023 15:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1690843601; x=1691448401;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lCOFKRg0bmI3Ob9Hpe791RuDIORz/emzFOUZn3BJUU8=;
 b=Fga/tWRfw/FIN7xTrHph/3+yq01aPple6OSKZGdLzA5Gu+JPwATaKO5LwmUXpigwSz
 uwO2u9epa8kjWm+uGasFOLXB90MSe/GKHrc3uk2gNZDGtWX3pFEs+DBoadqVECwCjaC3
 s4xLoPQtVsfeGx2KV+RKD4wfHK1VmS51xgW7OQZ/ze6JBBoALNjbQb5EjWZL7wKNRoLC
 boLrw8erOOnSKnNj5tcCGBxpdEqVa42nSTGlC6PdA0Ka4if+94uY5vTg3/a7S+h8fO2x
 Qbwu+eAycpHhDL23YQgEqr9wzBlI5Fj9Qr4z7uA6H9+1ichydRmEJKBNyLwTpR7wf/Aa
 g2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690843601; x=1691448401;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lCOFKRg0bmI3Ob9Hpe791RuDIORz/emzFOUZn3BJUU8=;
 b=HFmsIVlsmV29ePckNjMaxEcXfL18TfpXzi2iiLJ58jwPNgMDB7hY4JqFMVceQhlizP
 9adJJQov8llXCuB3EoAzg1xvYIT5gKvO/h8AVlUZvV9zwSbby+jPGGmL9Kske1TPCU5d
 BZ+KPhxlIlMeQyDkvkTjUINSt5CHzXEgKitJuRhifHoxH1lZu0fzxS+tP0Odv7DsD6DL
 S31fKzT7W/hG2HqXi9Tawl+3kvWWWcFrXEZGdxJbpYBcLRHWMHKT9YJtkBV5AJ7+iwNU
 amBMi4cFX/TIdfi83xkVUYDZfnxYKoeBD4ulqKgtQOhI53NFxK2JVorh9TLR4JXkEYRm
 Z1rg==
X-Gm-Message-State: ABy/qLaVmVIc+rwyiCGZPjBrzxESg5BYA+DM3aVokIpWaGFWJj3vP3ED
 dHeZM+0PdPbkHHodj/8DEtkWcA==
X-Google-Smtp-Source: APBJJlEfypZ8T/0TY4HurjRbmWMvJo+vfmo1cpZquEZtJbU1Qpttt5uxY2Uuup46vXHA0KC3b00YLg==
X-Received: by 2002:a05:6808:13c2:b0:3a4:225d:8293 with SMTP id
 d2-20020a05680813c200b003a4225d8293mr9780016oiw.0.1690843601190; 
 Mon, 31 Jul 2023 15:46:41 -0700 (PDT)
Received: from [192.168.68.108] (201-69-66-110.dial-up.telesp.net.br.
 [201.69.66.110]) by smtp.gmail.com with ESMTPSA id
 m17-20020a0568080f1100b003a48ed3564bsm4534650oiw.50.2023.07.31.15.46.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 15:46:40 -0700 (PDT)
Message-ID: <ea7d2188-97ad-9563-1b92-cf998f4b1747@ventanamicro.com>
Date: Mon, 31 Jul 2023 19:46:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] hw/riscv: split RAM into low and high memory
Content-Language: en-US
To: Fei Wu <fei2.wu@intel.com>, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Andrei Warkentin <andrei.warkentin@intel.com>
References: <20230731015317.1026996-1-fei2.wu@intel.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230731015317.1026996-1-fei2.wu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.101,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 7/30/23 22:53, Fei Wu wrote:
> riscv virt platform's memory started at 0x80000000 and
> straddled the 4GiB boundary. Curiously enough, this choice
> of a memory layout will prevent from launching a VM with
> a bit more than 2000MiB and PCIe pass-thru on an x86 host, due
> to identity mapping requirements for the MSI doorbell on x86,
> and these (APIC/IOAPIC) live right below 4GiB.
> 
> So just split the RAM range into two portions:
> - 1 GiB range from 0x80000000 to 0xc0000000.
> - The remainder at 0x100000000
> 
> ...leaving a hole between the ranges.

I am afraid this breaks some existing distro setups, like Ubuntu. After this patch
this emulation stopped working:

~/work/qemu/build/qemu-system-riscv64 \
	-machine virt -nographic -m 8G -smp 8 \
	-kernel ./uboot-ubuntu/usr/lib/u-boot/qemu-riscv64_smode/uboot.elf \
	-drive file=snapshot.img,format=qcow2,if=virtio \
	-netdev bridge,id=bridge1,br=virbr0 -device virtio-net-pci,netdev=bridge1


This is basically a guest created via the official Canonical tutorial:

https://wiki.ubuntu.com/RISC-V/QEMU

The error being thrown:

=================

Boot HART ID              : 4
Boot HART Domain          : root
Boot HART Priv Version    : v1.12
Boot HART Base ISA        : rv64imafdch
Boot HART ISA Extensions  : time,sstc
Boot HART PMP Count       : 16
Boot HART PMP Granularity : 4
Boot HART PMP Address Bits: 54
Boot HART MHPM Count      : 16
Boot HART MIDELEG         : 0x0000000000001666
Boot HART MEDELEG         : 0x0000000000f0b509


U-Boot 2022.07+dfsg-1ubuntu4.2 (Nov 24 2022 - 18:47:41 +0000)

CPU:   rv64imafdch_zicbom_zicboz_zicsr_zifencei_zihintpause_zawrs_zfa_zca_zcd_zba_zbb_zbc_zbs_sstc_svadu
Model: riscv-virtio,qemu
DRAM:  Unhandled exception: Store/AMO access fault
EPC: 00000000802018b8 RA: 00000000802126a0 TVAL: 00000000ff733f90

Code: b823 06b2 bc23 06b2 b023 08b2 b423 08b2 (b823 08b2)


resetting ...
System reset not supported on this platform
### ERROR ### Please RESET the board ###
QEMU 8.0.90 monitor - type 'help' for more infor
=================


Based on the change made I can make an educated guess on what is going wrong.
We have another board with a similar memory topology you're making here, the
Microchip Polarfire (microchip_pfsoc.c). We were having some problems with this
board while trying to consolidate the boot process between all boards in
hw/riscv/boot.c because of its non-continuous RAM bank. The full story can be
read in the commit message of 4b402886ac89 ("hw/riscv: change riscv_compute_fdt_addr()
semantics") but the short version can be seen in riscv_compute_fdt_addr()
from boot.c:

  - if ram_start is less than 3072MiB, the FDT will be  put at the lowest value
between 3072 MiB and the end of that RAM bank;

- if ram_start is higher than 3072 MiB the FDT will be put at the end of the
RAM bank.

So, after this patch, since riscv_compute_fdt_addr() is being used with the now
lower RAM bank, the fdt is being put in LOW_MEM - fdt_size for any setup that has
more than 1Gb RAM, and this breaks assumptions made by uboot and Ubuntu and possibly
others that are trying to retrieve the FDT from the gap that you created between
low and hi mem in this patch.

In fact, this same Ubuntu guest I mentioned above will boot if I put only 1 Gb of RAM
(-m 1Gb). If I try with -m 1.1Gb I reproduce this error. This can be a validation of
the guess I'm making here: Ubuntu is trying to fetch stuff (probably the fdt) from
the gap between the memory areas.

This change on top of this patch doesn't work either:

$ git diff
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 8fbdc7220c..dfff48d849 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1335,9 +1335,16 @@ static void virt_machine_done(Notifier *notifier, void *data)
                                           kernel_start_addr, true, NULL);
      }
  
-    fdt_load_addr = riscv_compute_fdt_addr(memmap[VIRT_DRAM].base,
+    if (machine->ram_size < memmap[VIRT_DRAM].size) {
+        fdt_load_addr = riscv_compute_fdt_addr(memmap[VIRT_DRAM].base,
                                             memmap[VIRT_DRAM].size,
                                             machine);
+    } else {
+        fdt_load_addr = riscv_compute_fdt_addr(memmap[VIRT_DRAM_HIGH].base,
+                                           memmap[VIRT_DRAM_HIGH].size,
+                                           machine);
+    }
+
    

This would put the fdt at the end of the HI RAM for guests with more than 1Gb of RAM.
This change in fact makes the situation even worse, breaking setups that were working
before with this patch.

There's a chance that reducing the gap between the RAM banks can make Ubuntu work
reliably again but now I'm a little cold feet with this change.


I think we'll need some kernel/Opensbi folks to weight in here to see if there's a
failsafe memory setup that won't break distros out there and allow your passthrough
to work.



Thanks,

Daniel

> 
> Signed-off-by: Andrei Warkentin <andrei.warkentin@intel.com>
> Signed-off-by: Fei Wu <fei2.wu@intel.com>
> ---
>   hw/riscv/virt.c         | 74 ++++++++++++++++++++++++++++++++++++-----
>   include/hw/riscv/virt.h |  1 +
>   2 files changed, 66 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index d90286dc46..8fbdc7220c 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -75,7 +75,9 @@
>   #error "Can't accomodate all IMSIC groups in address space"
>   #endif
>   
> -static const MemMapEntry virt_memmap[] = {
> +#define LOW_MEM (1 * GiB)
> +
> +static MemMapEntry virt_memmap[] = {
>       [VIRT_DEBUG] =        {        0x0,         0x100 },
>       [VIRT_MROM] =         {     0x1000,        0xf000 },
>       [VIRT_TEST] =         {   0x100000,        0x1000 },
> @@ -96,6 +98,7 @@ static const MemMapEntry virt_memmap[] = {
>       [VIRT_PCIE_ECAM] =    { 0x30000000,    0x10000000 },
>       [VIRT_PCIE_MMIO] =    { 0x40000000,    0x40000000 },
>       [VIRT_DRAM] =         { 0x80000000,           0x0 },
> +    [VIRT_DRAM_HIGH] =    { 0x100000000,          0x0 },
>   };
>   
>   /* PCIe high mmio is fixed for RV32 */
> @@ -295,15 +298,12 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>       }
>   }
>   
> -static void create_fdt_socket_memory(RISCVVirtState *s,
> -                                     const MemMapEntry *memmap, int socket)
> +static void create_fdt_socket_mem_range(RISCVVirtState *s, uint64_t addr,
> +                                        uint64_t size, int socket)
>   {
>       char *mem_name;
> -    uint64_t addr, size;
>       MachineState *ms = MACHINE(s);
>   
> -    addr = memmap[VIRT_DRAM].base + riscv_socket_mem_offset(ms, socket);
> -    size = riscv_socket_mem_size(ms, socket);
>       mem_name = g_strdup_printf("/memory@%lx", (long)addr);
>       qemu_fdt_add_subnode(ms->fdt, mem_name);
>       qemu_fdt_setprop_cells(ms->fdt, mem_name, "reg",
> @@ -313,6 +313,34 @@ static void create_fdt_socket_memory(RISCVVirtState *s,
>       g_free(mem_name);
>   }
>   
> +static void create_fdt_socket_memory(RISCVVirtState *s,
> +                                     const MemMapEntry *memmap, int socket)
> +{
> +    uint64_t addr, size;
> +    MachineState *mc = MACHINE(s);
> +    uint64_t sock_offset = riscv_socket_mem_offset(mc, socket);
> +    uint64_t sock_size = riscv_socket_mem_size(mc, socket);
> +
> +    if (sock_offset < memmap[VIRT_DRAM].size) {
> +        uint64_t low_mem_end = memmap[VIRT_DRAM].base + memmap[VIRT_DRAM].size;
> +
> +        addr = memmap[VIRT_DRAM].base + sock_offset;
> +        size = MIN(low_mem_end - addr, sock_size);
> +        create_fdt_socket_mem_range(s, addr, size, socket);
> +
> +        size = sock_size - size;
> +        if (size > 0) {
> +            create_fdt_socket_mem_range(s, memmap[VIRT_DRAM_HIGH].base,
> +                                        size, socket);
> +        }
> +    } else {
> +        addr = memmap[VIRT_DRAM_HIGH].base +
> +               sock_offset - memmap[VIRT_DRAM].size;
> +
> +        create_fdt_socket_mem_range(s, addr, sock_size, socket);
> +    }
> +}
> +
>   static void create_fdt_socket_clint(RISCVVirtState *s,
>                                       const MemMapEntry *memmap, int socket,
>                                       uint32_t *intc_phandles)
> @@ -1334,10 +1362,12 @@ static void virt_machine_done(Notifier *notifier, void *data)
>   
>   static void virt_machine_init(MachineState *machine)
>   {
> -    const MemMapEntry *memmap = virt_memmap;
> +    MemMapEntry *memmap = virt_memmap;
>       RISCVVirtState *s = RISCV_VIRT_MACHINE(machine);
>       MemoryRegion *system_memory = get_system_memory();
>       MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
> +    MemoryRegion *ram_below_4g, *ram_above_4g;
> +    uint64_t ram_size_low, ram_size_high;
>       char *soc_name;
>       DeviceState *mmio_irqchip, *virtio_irqchip, *pcie_irqchip;
>       int i, base_hartid, hart_count;
> @@ -1448,6 +1478,17 @@ static void virt_machine_init(MachineState *machine)
>           }
>       }
>   
> +    if (machine->ram_size > LOW_MEM) {
> +        ram_size_high = machine->ram_size - LOW_MEM;
> +        ram_size_low = LOW_MEM;
> +    } else {
> +        ram_size_high = 0;
> +        ram_size_low = machine->ram_size;
> +    }
> +
> +    memmap[VIRT_DRAM].size = ram_size_low;
> +    memmap[VIRT_DRAM_HIGH].size = ram_size_high;
> +
>       if (riscv_is_32bit(&s->soc[0])) {
>   #if HOST_LONG_BITS == 64
>           /* limit RAM size in a 32-bit system */
> @@ -1460,7 +1501,8 @@ static void virt_machine_init(MachineState *machine)
>           virt_high_pcie_memmap.size = VIRT32_HIGH_PCIE_MMIO_SIZE;
>       } else {
>           virt_high_pcie_memmap.size = VIRT64_HIGH_PCIE_MMIO_SIZE;
> -        virt_high_pcie_memmap.base = memmap[VIRT_DRAM].base + machine->ram_size;
> +        virt_high_pcie_memmap.base = memmap[VIRT_DRAM_HIGH].base +
> +                                     memmap[VIRT_DRAM_HIGH].size;
>           virt_high_pcie_memmap.base =
>               ROUND_UP(virt_high_pcie_memmap.base, virt_high_pcie_memmap.size);
>       }
> @@ -1468,8 +1510,22 @@ static void virt_machine_init(MachineState *machine)
>       s->memmap = virt_memmap;
>   
>       /* register system main memory (actual RAM) */
> +    ram_below_4g = g_malloc(sizeof(*ram_below_4g));
> +    memory_region_init_alias(ram_below_4g, NULL, "ram-below-4g", machine->ram,
> +                             0, memmap[VIRT_DRAM].size);
>       memory_region_add_subregion(system_memory, memmap[VIRT_DRAM].base,
> -        machine->ram);
> +                                ram_below_4g);
> +
> +    if (memmap[VIRT_DRAM_HIGH].size) {
> +        ram_above_4g = g_malloc(sizeof(*ram_above_4g));
> +        memory_region_init_alias(ram_above_4g, NULL, "ram-above-4g",
> +                                 machine->ram,
> +                                 memmap[VIRT_DRAM].size,
> +                                 memmap[VIRT_DRAM_HIGH].size);
> +        memory_region_add_subregion(system_memory,
> +                                    memmap[VIRT_DRAM_HIGH].base,
> +                                    ram_above_4g);
> +    }
>   
>       /* boot rom */
>       memory_region_init_rom(mask_rom, NULL, "riscv_virt_board.mrom",
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index e5c474b26e..36004eb6ef 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -79,6 +79,7 @@ enum {
>       VIRT_IMSIC_S,
>       VIRT_FLASH,
>       VIRT_DRAM,
> +    VIRT_DRAM_HIGH,
>       VIRT_PCIE_MMIO,
>       VIRT_PCIE_PIO,
>       VIRT_PLATFORM_BUS,

