Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26801EC8740
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 15:46:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeHDU-0007CR-Lh; Thu, 07 Sep 2023 11:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1qeHDU-0007C8-0T
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 11:46:48 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1qeHDO-00048f-L7
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 11:46:47 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-986d8332f50so144385466b.0
 for <qemu-riscv@nongnu.org>; Thu, 07 Sep 2023 08:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1694101599; x=1694706399;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SRjPpzT7X2rnDzJSDTmvxfJtD/4aMUxJhbp1bpMBkE8=;
 b=IGN96dCK2WWwnvNxoDckGwIH3BErEUDej3f8ys2xbjoEjS0yTi/75VsmaSg3DqgsrK
 3g8tCgJDsSpor36IXnY+/xDQxtAenrTKQyyWPh669J8Ew8v/yk82XQ4msJBxQVx6aGau
 U+uTGhySXIGDYehDEsyAd0xsuuwz2NALmv1Wd8QibM+FD88GfLCuvesK5iEANpu9Snei
 rxfKvWJEZ8GjUQdGw8TVdRg/kjbmi5XNHzUncevUlpzreE9H+FLrSQZRwdFB/+YvF7r6
 5+bwZPhhpyHnWHxHXdHGTLov1h746b/cjCW76PAtoRPzAzKlxECntvjHiL7CuFtIzHu6
 cQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694101599; x=1694706399;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SRjPpzT7X2rnDzJSDTmvxfJtD/4aMUxJhbp1bpMBkE8=;
 b=Ir0pKGgrQyQBy2FS4MM0hQpbLK4aqdSr4TDyY0cK2Spm/2PO+C7+snS4FkrGx6r0+k
 tZ1sfuGZSYvHlK0NecEU5d93SG47Np7sqxpT2ACLi+kzyuYFpobcEaCwZ4unQDK7Ju/2
 rpKT6Uxjlx9fDGtycBV54cF75zQfehiKevFugXMHKWa/QKPMb6QANQ6oJ0e9Hw8BacYA
 T/LuMZtWJkpESua0ZLHFmYF7H73Gxgdzl+WLr3yr36m2ug6gV/Q5U9AuErDW4owGt+jp
 yNS+V3Qz9g228AnwWQ0b1li6evfKDruttlbWn7qjKFV5+bOQRjEsh8kOZm+vKk4lVvMq
 oidQ==
X-Gm-Message-State: AOJu0Ywo0cMkmJvw6+R39n6BJA9d6AFdHNubGMa5RxsNDC/KG9FTslbX
 4fgpLCdzLjGezgtTdHPK+1WuIx0ou18t9qYfn1ugqA==
X-Google-Smtp-Source: AGHT+IFx7f9mGc+qaOjFNZ6ZnJGLPBykLMo4ltx12qbqn62BLzv7Hx9Wa+/EN8Z+DXKdaOnFdchzSjEzFdmEjhUZh3g=
X-Received: by 2002:a17:906:d8:b0:9a1:ecb5:732e with SMTP id
 24-20020a17090600d800b009a1ecb5732emr4871892eji.71.1694101598718; Thu, 07 Sep
 2023 08:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230731015317.1026996-1-fei2.wu@intel.com>
 <ea7d2188-97ad-9563-1b92-cf998f4b1747@ventanamicro.com>
In-Reply-To: <ea7d2188-97ad-9563-1b92-cf998f4b1747@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 7 Sep 2023 21:16:27 +0530
Message-ID: <CAAhSdy2jh25ORwh1ZoHWqi7jk=UizZBfivY4NxT+krp0G_M_-g@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: split RAM into low and high memory
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Fei Wu <fei2.wu@intel.com>, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Andrei Warkentin <andrei.warkentin@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::636;
 envelope-from=anup@brainfault.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Aug 1, 2023 at 4:16=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 7/30/23 22:53, Fei Wu wrote:
> > riscv virt platform's memory started at 0x80000000 and
> > straddled the 4GiB boundary. Curiously enough, this choice
> > of a memory layout will prevent from launching a VM with
> > a bit more than 2000MiB and PCIe pass-thru on an x86 host, due
> > to identity mapping requirements for the MSI doorbell on x86,
> > and these (APIC/IOAPIC) live right below 4GiB.
> >
> > So just split the RAM range into two portions:
> > - 1 GiB range from 0x80000000 to 0xc0000000.
> > - The remainder at 0x100000000
> >
> > ...leaving a hole between the ranges.
>
> I am afraid this breaks some existing distro setups, like Ubuntu. After t=
his patch
> this emulation stopped working:
>
> ~/work/qemu/build/qemu-system-riscv64 \
>         -machine virt -nographic -m 8G -smp 8 \
>         -kernel ./uboot-ubuntu/usr/lib/u-boot/qemu-riscv64_smode/uboot.el=
f \
>         -drive file=3Dsnapshot.img,format=3Dqcow2,if=3Dvirtio \
>         -netdev bridge,id=3Dbridge1,br=3Dvirbr0 -device virtio-net-pci,ne=
tdev=3Dbridge1
>
>
> This is basically a guest created via the official Canonical tutorial:
>
> https://wiki.ubuntu.com/RISC-V/QEMU
>
> The error being thrown:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Boot HART ID              : 4
> Boot HART Domain          : root
> Boot HART Priv Version    : v1.12
> Boot HART Base ISA        : rv64imafdch
> Boot HART ISA Extensions  : time,sstc
> Boot HART PMP Count       : 16
> Boot HART PMP Granularity : 4
> Boot HART PMP Address Bits: 54
> Boot HART MHPM Count      : 16
> Boot HART MIDELEG         : 0x0000000000001666
> Boot HART MEDELEG         : 0x0000000000f0b509
>
>
> U-Boot 2022.07+dfsg-1ubuntu4.2 (Nov 24 2022 - 18:47:41 +0000)
>
> CPU:   rv64imafdch_zicbom_zicboz_zicsr_zifencei_zihintpause_zawrs_zfa_zca=
_zcd_zba_zbb_zbc_zbs_sstc_svadu
> Model: riscv-virtio,qemu
> DRAM:  Unhandled exception: Store/AMO access fault
> EPC: 00000000802018b8 RA: 00000000802126a0 TVAL: 00000000ff733f90
>
> Code: b823 06b2 bc23 06b2 b023 08b2 b423 08b2 (b823 08b2)
>
>
> resetting ...
> System reset not supported on this platform
> ### ERROR ### Please RESET the board ###
> QEMU 8.0.90 monitor - type 'help' for more infor
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Can you try again after setting CONFIG_NR_DRAM_BANKS=3D2 in
qemu-riscv64_smode_defconfig and qemu-riscv64_spl_defconfig ?

Regards,
Anup

>
>
> Based on the change made I can make an educated guess on what is going wr=
ong.
> We have another board with a similar memory topology you're making here, =
the
> Microchip Polarfire (microchip_pfsoc.c). We were having some problems wit=
h this
> board while trying to consolidate the boot process between all boards in
> hw/riscv/boot.c because of its non-continuous RAM bank. The full story ca=
n be
> read in the commit message of 4b402886ac89 ("hw/riscv: change riscv_compu=
te_fdt_addr()
> semantics") but the short version can be seen in riscv_compute_fdt_addr()
> from boot.c:
>
>   - if ram_start is less than 3072MiB, the FDT will be  put at the lowest=
 value
> between 3072 MiB and the end of that RAM bank;
>
> - if ram_start is higher than 3072 MiB the FDT will be put at the end of =
the
> RAM bank.
>
> So, after this patch, since riscv_compute_fdt_addr() is being used with t=
he now
> lower RAM bank, the fdt is being put in LOW_MEM - fdt_size for any setup =
that has
> more than 1Gb RAM, and this breaks assumptions made by uboot and Ubuntu a=
nd possibly
> others that are trying to retrieve the FDT from the gap that you created =
between
> low and hi mem in this patch.
>
> In fact, this same Ubuntu guest I mentioned above will boot if I put only=
 1 Gb of RAM
> (-m 1Gb). If I try with -m 1.1Gb I reproduce this error. This can be a va=
lidation of
> the guess I'm making here: Ubuntu is trying to fetch stuff (probably the =
fdt) from
> the gap between the memory areas.
>
> This change on top of this patch doesn't work either:
>
> $ git diff
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 8fbdc7220c..dfff48d849 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1335,9 +1335,16 @@ static void virt_machine_done(Notifier *notifier, =
void *data)
>                                            kernel_start_addr, true, NULL)=
;
>       }
>
> -    fdt_load_addr =3D riscv_compute_fdt_addr(memmap[VIRT_DRAM].base,
> +    if (machine->ram_size < memmap[VIRT_DRAM].size) {
> +        fdt_load_addr =3D riscv_compute_fdt_addr(memmap[VIRT_DRAM].base,
>                                              memmap[VIRT_DRAM].size,
>                                              machine);
> +    } else {
> +        fdt_load_addr =3D riscv_compute_fdt_addr(memmap[VIRT_DRAM_HIGH].=
base,
> +                                           memmap[VIRT_DRAM_HIGH].size,
> +                                           machine);
> +    }
> +
>
>
> This would put the fdt at the end of the HI RAM for guests with more than=
 1Gb of RAM.
> This change in fact makes the situation even worse, breaking setups that =
were working
> before with this patch.
>
> There's a chance that reducing the gap between the RAM banks can make Ubu=
ntu work
> reliably again but now I'm a little cold feet with this change.
>
>
> I think we'll need some kernel/Opensbi folks to weight in here to see if =
there's a
> failsafe memory setup that won't break distros out there and allow your p=
assthrough
> to work.
>
>
>
> Thanks,
>
> Daniel
>
> >
> > Signed-off-by: Andrei Warkentin <andrei.warkentin@intel.com>
> > Signed-off-by: Fei Wu <fei2.wu@intel.com>
> > ---
> >   hw/riscv/virt.c         | 74 ++++++++++++++++++++++++++++++++++++----=
-
> >   include/hw/riscv/virt.h |  1 +
> >   2 files changed, 66 insertions(+), 9 deletions(-)
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index d90286dc46..8fbdc7220c 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -75,7 +75,9 @@
> >   #error "Can't accomodate all IMSIC groups in address space"
> >   #endif
> >
> > -static const MemMapEntry virt_memmap[] =3D {
> > +#define LOW_MEM (1 * GiB)
> > +
> > +static MemMapEntry virt_memmap[] =3D {
> >       [VIRT_DEBUG] =3D        {        0x0,         0x100 },
> >       [VIRT_MROM] =3D         {     0x1000,        0xf000 },
> >       [VIRT_TEST] =3D         {   0x100000,        0x1000 },
> > @@ -96,6 +98,7 @@ static const MemMapEntry virt_memmap[] =3D {
> >       [VIRT_PCIE_ECAM] =3D    { 0x30000000,    0x10000000 },
> >       [VIRT_PCIE_MMIO] =3D    { 0x40000000,    0x40000000 },
> >       [VIRT_DRAM] =3D         { 0x80000000,           0x0 },
> > +    [VIRT_DRAM_HIGH] =3D    { 0x100000000,          0x0 },
> >   };
> >
> >   /* PCIe high mmio is fixed for RV32 */
> > @@ -295,15 +298,12 @@ static void create_fdt_socket_cpus(RISCVVirtState=
 *s, int socket,
> >       }
> >   }
> >
> > -static void create_fdt_socket_memory(RISCVVirtState *s,
> > -                                     const MemMapEntry *memmap, int so=
cket)
> > +static void create_fdt_socket_mem_range(RISCVVirtState *s, uint64_t ad=
dr,
> > +                                        uint64_t size, int socket)
> >   {
> >       char *mem_name;
> > -    uint64_t addr, size;
> >       MachineState *ms =3D MACHINE(s);
> >
> > -    addr =3D memmap[VIRT_DRAM].base + riscv_socket_mem_offset(ms, sock=
et);
> > -    size =3D riscv_socket_mem_size(ms, socket);
> >       mem_name =3D g_strdup_printf("/memory@%lx", (long)addr);
> >       qemu_fdt_add_subnode(ms->fdt, mem_name);
> >       qemu_fdt_setprop_cells(ms->fdt, mem_name, "reg",
> > @@ -313,6 +313,34 @@ static void create_fdt_socket_memory(RISCVVirtStat=
e *s,
> >       g_free(mem_name);
> >   }
> >
> > +static void create_fdt_socket_memory(RISCVVirtState *s,
> > +                                     const MemMapEntry *memmap, int so=
cket)
> > +{
> > +    uint64_t addr, size;
> > +    MachineState *mc =3D MACHINE(s);
> > +    uint64_t sock_offset =3D riscv_socket_mem_offset(mc, socket);
> > +    uint64_t sock_size =3D riscv_socket_mem_size(mc, socket);
> > +
> > +    if (sock_offset < memmap[VIRT_DRAM].size) {
> > +        uint64_t low_mem_end =3D memmap[VIRT_DRAM].base + memmap[VIRT_=
DRAM].size;
> > +
> > +        addr =3D memmap[VIRT_DRAM].base + sock_offset;
> > +        size =3D MIN(low_mem_end - addr, sock_size);
> > +        create_fdt_socket_mem_range(s, addr, size, socket);
> > +
> > +        size =3D sock_size - size;
> > +        if (size > 0) {
> > +            create_fdt_socket_mem_range(s, memmap[VIRT_DRAM_HIGH].base=
,
> > +                                        size, socket);
> > +        }
> > +    } else {
> > +        addr =3D memmap[VIRT_DRAM_HIGH].base +
> > +               sock_offset - memmap[VIRT_DRAM].size;
> > +
> > +        create_fdt_socket_mem_range(s, addr, sock_size, socket);
> > +    }
> > +}
> > +
> >   static void create_fdt_socket_clint(RISCVVirtState *s,
> >                                       const MemMapEntry *memmap, int so=
cket,
> >                                       uint32_t *intc_phandles)
> > @@ -1334,10 +1362,12 @@ static void virt_machine_done(Notifier *notifie=
r, void *data)
> >
> >   static void virt_machine_init(MachineState *machine)
> >   {
> > -    const MemMapEntry *memmap =3D virt_memmap;
> > +    MemMapEntry *memmap =3D virt_memmap;
> >       RISCVVirtState *s =3D RISCV_VIRT_MACHINE(machine);
> >       MemoryRegion *system_memory =3D get_system_memory();
> >       MemoryRegion *mask_rom =3D g_new(MemoryRegion, 1);
> > +    MemoryRegion *ram_below_4g, *ram_above_4g;
> > +    uint64_t ram_size_low, ram_size_high;
> >       char *soc_name;
> >       DeviceState *mmio_irqchip, *virtio_irqchip, *pcie_irqchip;
> >       int i, base_hartid, hart_count;
> > @@ -1448,6 +1478,17 @@ static void virt_machine_init(MachineState *mach=
ine)
> >           }
> >       }
> >
> > +    if (machine->ram_size > LOW_MEM) {
> > +        ram_size_high =3D machine->ram_size - LOW_MEM;
> > +        ram_size_low =3D LOW_MEM;
> > +    } else {
> > +        ram_size_high =3D 0;
> > +        ram_size_low =3D machine->ram_size;
> > +    }
> > +
> > +    memmap[VIRT_DRAM].size =3D ram_size_low;
> > +    memmap[VIRT_DRAM_HIGH].size =3D ram_size_high;
> > +
> >       if (riscv_is_32bit(&s->soc[0])) {
> >   #if HOST_LONG_BITS =3D=3D 64
> >           /* limit RAM size in a 32-bit system */
> > @@ -1460,7 +1501,8 @@ static void virt_machine_init(MachineState *machi=
ne)
> >           virt_high_pcie_memmap.size =3D VIRT32_HIGH_PCIE_MMIO_SIZE;
> >       } else {
> >           virt_high_pcie_memmap.size =3D VIRT64_HIGH_PCIE_MMIO_SIZE;
> > -        virt_high_pcie_memmap.base =3D memmap[VIRT_DRAM].base + machin=
e->ram_size;
> > +        virt_high_pcie_memmap.base =3D memmap[VIRT_DRAM_HIGH].base +
> > +                                     memmap[VIRT_DRAM_HIGH].size;
> >           virt_high_pcie_memmap.base =3D
> >               ROUND_UP(virt_high_pcie_memmap.base, virt_high_pcie_memma=
p.size);
> >       }
> > @@ -1468,8 +1510,22 @@ static void virt_machine_init(MachineState *mach=
ine)
> >       s->memmap =3D virt_memmap;
> >
> >       /* register system main memory (actual RAM) */
> > +    ram_below_4g =3D g_malloc(sizeof(*ram_below_4g));
> > +    memory_region_init_alias(ram_below_4g, NULL, "ram-below-4g", machi=
ne->ram,
> > +                             0, memmap[VIRT_DRAM].size);
> >       memory_region_add_subregion(system_memory, memmap[VIRT_DRAM].base=
,
> > -        machine->ram);
> > +                                ram_below_4g);
> > +
> > +    if (memmap[VIRT_DRAM_HIGH].size) {
> > +        ram_above_4g =3D g_malloc(sizeof(*ram_above_4g));
> > +        memory_region_init_alias(ram_above_4g, NULL, "ram-above-4g",
> > +                                 machine->ram,
> > +                                 memmap[VIRT_DRAM].size,
> > +                                 memmap[VIRT_DRAM_HIGH].size);
> > +        memory_region_add_subregion(system_memory,
> > +                                    memmap[VIRT_DRAM_HIGH].base,
> > +                                    ram_above_4g);
> > +    }
> >
> >       /* boot rom */
> >       memory_region_init_rom(mask_rom, NULL, "riscv_virt_board.mrom",
> > diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> > index e5c474b26e..36004eb6ef 100644
> > --- a/include/hw/riscv/virt.h
> > +++ b/include/hw/riscv/virt.h
> > @@ -79,6 +79,7 @@ enum {
> >       VIRT_IMSIC_S,
> >       VIRT_FLASH,
> >       VIRT_DRAM,
> > +    VIRT_DRAM_HIGH,
> >       VIRT_PCIE_MMIO,
> >       VIRT_PCIE_PIO,
> >       VIRT_PLATFORM_BUS,
>

