Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41889CAC5BB
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Oct 2025 07:24:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v6OWK-0003UY-9l; Wed, 08 Oct 2025 03:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1v6OWI-0003TN-2b
 for qemu-riscv@nongnu.org; Wed, 08 Oct 2025 03:23:30 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1v6OWD-0001HK-WE
 for qemu-riscv@nongnu.org; Wed, 08 Oct 2025 03:23:29 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b3d80891c6cso95651466b.1
 for <qemu-riscv@nongnu.org>; Wed, 08 Oct 2025 00:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1759908203; x=1760513003; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0QQ2WZoEdEqof1DLr9JgomsN0ke/0D4d5gf0B+nm0N0=;
 b=HjlHaqK8WMne2HL5Wqzzu3fANDEOkesgmCawtIAPWaI97kLwR1ZdNf/rYtSSBuQodE
 7KlZ1k63+vulV5LDp8DkMHV48tn65LS1tWuysXZeDpNN90m14zPziin7K+/psz0VC74B
 bpbdaUd4XLbCxp6IvGh5GPnP586qulyCSZqPqmHH6P7sJRVmrQ6UjsNZkpfEWrLIW4Lf
 erRN2xxX/kFRoNZKguMN3EfoGHdgBXVnrjMB3I4kNX7r00EDi7yDAACrWOuNyMDXtf8E
 87iIGioDYXMuCOZxL1fUZoSTzD2ah+eyAZCg6g00RQbKZfkN2QiED0HWxaUIvof1/biQ
 l7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759908203; x=1760513003;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0QQ2WZoEdEqof1DLr9JgomsN0ke/0D4d5gf0B+nm0N0=;
 b=wRpzFsPeWP5GGjq37IKjsNSPKcnhKdtmgPPMz/MBw7+cVRzBzOMOClyKv5Sw2l+O+A
 HgLPNDjfe7CH8ro/KjUwGdewG+fnLXIXpaO2T3LHNS7UWERSB8lXOoG5wkzZu2DTARgA
 kLE+enggrwwHwhLu0E8476+l5M0yxD50c4o/QcONKRFwV+Wnm6pNizVh7HKa+36AL4qN
 5Lw167SdoCFylNEY/NcVjKTqBDSy/Ci+Bbb8pFhYi3lXCNdxAZhWayOE73BBvtFm8i58
 jDcPp/I52fpZhFy7MlXR83nps0SvXAjZwvlhUAX69lYCowF4/G8HHR1OifQ49xxtxyhx
 9WOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHB27A9q3DEXlyBVxPXW8P3GbdJnBhP5jIwFPe8J6zdRdO8IBBO1vLN1JzH6/f9ToyCuU6VkBQfbX+@nongnu.org
X-Gm-Message-State: AOJu0YzScAWyM46Uoo/Kc/XZjqtL3ku8Dh2gigN7E1FZV9IBtzyBpVvS
 lBLq6eXAR7Su+xQ7bwbvLzCt9Mj6ffE3XfJ1Fq41UYfw2gFG83Fi3B8uOM81N1dAuvAOQU9kbKh
 TtZCVBoq4FhxTmR5wNJd6zeGPK9i6bK3+ZYCzzYUG9g==
X-Gm-Gg: ASbGncv30dbMaj56TNYZYvmex9wcOZGFW/PZuuztzDcS7W2sgLZ8+i9Mpd1buuGB05a
 90iig3KrQYwmV6wO5tYDhsxQwz/TysWXVYqV0k8q509fWZVgngbbGFuXGdAFfRPHGrFIjpBwItU
 xfVMfyz0bzDmRaq5mA6cysywtSrZBt6Yc3xgH99yONdjN4mi2giJjV4nowRwvL/DytTsHDUmRLB
 G0ijgmkzXMi7QbKziFyBQY/jxPf2gN0Fg==
X-Google-Smtp-Source: AGHT+IGguVurE/1RQR3y0JdvNPaQs8devB6h64t8E/zBmveugI2F5VRGCpZpG9YmE0LWJbCZcHVOfGY3fZcNZ6LuxkQ=
X-Received: by 2002:a17:906:f5a1:b0:b04:4579:486e with SMTP id
 a640c23a62f3a-b50bf3b6a8dmr261791666b.28.1759908203096; Wed, 08 Oct 2025
 00:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250417105249.18232-1-jim.shu@sifive.com>
 <20250417105249.18232-19-jim.shu@sifive.com>
 <5810e0f2-cb33-49e1-89c2-102dfa064e11@ventanamicro.com>
In-Reply-To: <5810e0f2-cb33-49e1-89c2-102dfa064e11@ventanamicro.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Wed, 8 Oct 2025 15:23:11 +0800
X-Gm-Features: AS18NWDmdJ3Xmh8KQPpVnlu7muggeVovHUCa24-LiYtZsCjQYvgbQ8Nus3V7LGA
Message-ID: <CALw707rP7FpbLosQO-uej4Y=9HgpKmXb9jm27J0_ZX=pi1F6cg@mail.gmail.com>
Subject: Re: [PATCH v2 18/18] hw/riscv: virt: Add WorldGuard support
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>, 
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, 
 Helge Deller <deller@gmx.de>, Song Gao <gaosong@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <arikalo@gmail.com>, 
 Stafford Horne <shorne@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, 
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=jim.shu@sifive.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

I will send a v3 patch to fix it, thanks!

- Jim

On Sun, Aug 10, 2025 at 12:54=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 4/17/25 7:52 AM, Jim Shu wrote:
> > * Add 'wg=3Don' option to enable RISC-V WorldGuard
> > * Add wgChecker to protect several resources:
> >    DRAM, FLASH, UART.
> >
> > Signed-off-by: Jim Shu <jim.shu@sifive.com>
> > ---
> >   docs/system/riscv/virt.rst |  20 +++++
> >   hw/riscv/Kconfig           |   1 +
> >   hw/riscv/virt.c            | 163 ++++++++++++++++++++++++++++++++++++=
-
> >   include/hw/riscv/virt.h    |  15 +++-
> >   4 files changed, 195 insertions(+), 4 deletions(-)
> >
> > diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
> > index 60850970ce..eef1233350 100644
> > --- a/docs/system/riscv/virt.rst
> > +++ b/docs/system/riscv/virt.rst
> > @@ -146,6 +146,26 @@ The following machine-specific options are support=
ed:
> >
> >     Enables the riscv-iommu-sys platform device. Defaults to 'off'.
> >
> > +- wg=3D[on|off]
> > +
> > +  When this option is "on", RISC-V WorldGuard will be enabled in the s=
ystem
> > +  to provide the isolation of multiple worlds. RISC-V HARTs will enabl=
e WG
> > +  extensions to have WID in memory transaction. wgCheckers in front of=
 RAMs
> > +  and device MMIO will be enabled to provide the access control of res=
ources
> > +  if the transaction contains WID. When not specified, this option is =
assumed
> > +  to be "off".
> > +
> > +  The WG configuration of virt machine includes 4 worlds. For WG confi=
guration
> > +  of CPUs, the M-mode WID of CPU (``mwid``) is set to the largest WID =
number,
> > +  and the authorized WID list of CPU (``mwidlist``) includes all WIDs.=
 We can
> > +  modify the configuration of all CPUs via ``x-mwid`` and ``x-mwidlist=
``
> > +  CPU options. There are 3 wgCheckers in the virt machine, which separ=
ately
> > +  protects DRAM, FLASH, and UART. Default WG configuration on the virt=
 machine
> > +  is enough to run the demo of dual OSes in the different worlds. For =
example,
> > +  running both Linux kernel and Secure OS (e.g. OP-TEE) in it's own wo=
rld.
> > +
> > +  This option is restricted to the TCG accelerator.
> > +
> >   Running Linux kernel
> >   --------------------
> >
> > diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> > index e6a0ac1fa1..5c3e7b3479 100644
> > --- a/hw/riscv/Kconfig
> > +++ b/hw/riscv/Kconfig
> > @@ -68,6 +68,7 @@ config RISCV_VIRT
> >       select PLATFORM_BUS
> >       select ACPI
> >       select ACPI_PCI
> > +    select RISCV_WORLDGUARD
> >
> >   config SHAKTI_C
> >       bool
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index e517002fdf..da873bc8b8 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -58,6 +58,7 @@
> >   #include "qapi/qapi-visit-common.h"
> >   #include "hw/virtio/virtio-iommu.h"
> >   #include "hw/uefi/var-service-api.h"
> > +#include "hw/misc/riscv_worldguard.h"
> >
> >   /* KVM AIA only supports APLIC MSI. APLIC Wired is always emulated by=
 QEMU. */
> >   static bool virt_use_kvm_aia_aplic_imsic(RISCVVirtAIAType aia_type)
> > @@ -89,6 +90,9 @@ static const MemMapEntry virt_memmap[] =3D {
> >       [VIRT_PCIE_PIO] =3D     {  0x3000000,       0x10000 },
> >       [VIRT_IOMMU_SYS] =3D    {  0x3010000,        0x1000 },
> >       [VIRT_PLATFORM_BUS] =3D {  0x4000000,     0x2000000 },
> > +    [VIRT_WGC_DRAM] =3D     {  0x6000000,        0x1000 },
> > +    [VIRT_WGC_FLASH] =3D    {  0x6001000,        0x1000 },
> > +    [VIRT_WGC_UART] =3D     {  0x6002000,        0x1000 },
> >       [VIRT_PLIC] =3D         {  0xc000000, VIRT_PLIC_SIZE(VIRT_CPUS_MA=
X * 2) },
> >       [VIRT_APLIC_M] =3D      {  0xc000000, APLIC_SIZE(VIRT_CPUS_MAX) }=
,
> >       [VIRT_APLIC_S] =3D      {  0xd000000, APLIC_SIZE(VIRT_CPUS_MAX) }=
,
> > @@ -114,6 +118,38 @@ static MemMapEntry virt_high_pcie_memmap;
> >
> >   #define VIRT_FLASH_SECTOR_SIZE (256 * KiB)
> >
> > +/* wgChecker helpers */
> > +typedef struct WGCInfo {
> > +    int memmap_idx;
> > +    uint32_t irq_num;
> > +    uint32_t slot_count;
> > +
> > +    int num_of_child;
> > +    MemoryRegion *c_region[WGC_NUM_REGIONS];
> > +    uint64_t c_offset[WGC_NUM_REGIONS];
> > +} WGCInfo;
> > +
> > +enum {
> > +    WGC_DRAM,
> > +    WGC_FLASH,
> > +    WGC_UART,
> > +    WGC_NUM,
> > +};
> > +
> > +static WGCInfo virt_wgcinfo[] =3D {
> > +    [WGC_DRAM]  =3D { VIRT_WGC_DRAM, WGC_DRAM_IRQ, 16 },
> > +    [WGC_FLASH] =3D { VIRT_WGC_FLASH, WGC_FLASH_IRQ, 16 },
> > +    [WGC_UART]  =3D { VIRT_WGC_UART, WGC_UART_IRQ, 1 },
> > +};
> > +
> > +static void wgc_append_child(WGCInfo *info, MemoryRegion *region,
> > +                             uint64_t offset)
> > +{
> > +    info->c_region[info->num_of_child] =3D region;
> > +    info->c_offset[info->num_of_child] =3D offset;
> > +    info->num_of_child +=3D 1;
> > +}
> > +
> >   static PFlashCFI01 *virt_flash_create1(RISCVVirtState *s,
> >                                          const char *name,
> >                                          const char *alias_prop_name)
> > @@ -164,7 +200,8 @@ static void virt_flash_map1(PFlashCFI01 *flash,
> >   }
> >
> >   static void virt_flash_map(RISCVVirtState *s,
> > -                           MemoryRegion *sysmem)
> > +                           MemoryRegion *sysmem,
> > +                           WGCInfo *info)
> >   {
> >       hwaddr flashsize =3D virt_memmap[VIRT_FLASH].size / 2;
> >       hwaddr flashbase =3D virt_memmap[VIRT_FLASH].base;
> > @@ -173,6 +210,15 @@ static void virt_flash_map(RISCVVirtState *s,
> >                       sysmem);
> >       virt_flash_map1(s->flash[1], flashbase + flashsize, flashsize,
> >                       sysmem);
> > +
> > +    if (info) {
> > +        wgc_append_child(info,
> > +                         sysbus_mmio_get_region(SYS_BUS_DEVICE(s->flas=
h[0]), 0),
> > +                         flashbase);
> > +        wgc_append_child(info,
> > +                         sysbus_mmio_get_region(SYS_BUS_DEVICE(s->flas=
h[1]), 0),
> > +                         flashbase + flashsize);
> > +    }
> >   }
> >
> >   static void create_pcie_irq_map(RISCVVirtState *s, void *fdt, char *n=
odename,
> > @@ -1426,6 +1472,71 @@ static void virt_build_smbios(RISCVVirtState *s)
> >       }
> >   }
> >
> > +static DeviceState *create_wgc(WGCInfo *info, DeviceState *irqchip)
> > +{
> > +    MemoryRegion *system_memory =3D get_system_memory();
> > +    DeviceState *wgc;
> > +    MemoryRegion *upstream_mr, *downstream_mr;
> > +    qemu_irq irq =3D qdev_get_gpio_in(irqchip, info->irq_num);
> > +    hwaddr base, size;
> > +
> > +    /* Unmap downstream_mr from system_memory if it is already mapped.=
 */
> > +    for (int i=3D0; i<info->num_of_child; i++) {
> > +        downstream_mr =3D info->c_region[i];
> > +
> > +        g_assert(downstream_mr);
> > +        if (downstream_mr->container =3D=3D system_memory) {
> > +            memory_region_del_subregion(system_memory, downstream_mr);
> > +        }
> > +
> > +        /*
> > +         * Clear the offset of downstream_mr, so we could correctly do
> > +         * address_space_init() to it in wgchecker.
> > +         */
> > +        memory_region_set_address(downstream_mr, 0);
> > +    }
> > +
> > +    base =3D virt_memmap[info->memmap_idx].base;
> > +    size =3D virt_memmap[info->memmap_idx].size;
> > +
> > +    wgc =3D riscv_wgchecker_create(
> > +        base, size, irq, info->slot_count, 0, 0,
> > +        info->num_of_child, info->c_region, info->c_offset, 0, NULL);
> > +
> > +    /* Map upstream_mr to system_memory */
> > +    for (int i=3D0; i<info->num_of_child; i++) {
> > +        upstream_mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(wgc), i+=
1);
> > +        g_assert(upstream_mr);
> > +        memory_region_add_subregion(system_memory, info->c_offset[i], =
upstream_mr);
> > +    }
> > +
> > +    return wgc;
> > +}
> > +
> > +static void virt_create_worldguard(WGCInfo *wgcinfo, int wgc_num,
> > +                                   DeviceState *irqchip)
> > +{
> > +    CPUState *cpu;
> > +
> > +    /* Global WG config */
> > +    riscv_worldguard_create(VIRT_WG_NWORLDS,
> > +                            VIRT_WG_TRUSTEDWID,
> > +                            VIRT_WG_HWBYPASS,
> > +                            VIRT_WG_TZCOMPAT);
> > +
> > +    /* Enable WG extension of each CPU */
> > +    CPU_FOREACH(cpu) {
> > +        CPURISCVState *env =3D cpu ? cpu_env(cpu) : NULL;
> > +
> > +        riscv_worldguard_apply_cpu(env->mhartid);
> > +    }
> > +
> > +    /* Create all wgChecker devices */
> > +    for (int i=3D0; i<wgc_num; i++) {
> > +        create_wgc(&wgcinfo[i], DEVICE(irqchip));
> > +    }
> > +}
> > +
> >   static void virt_machine_done(Notifier *notifier, void *data)
> >   {
> >       RISCVVirtState *s =3D container_of(notifier, RISCVVirtState,
> > @@ -1527,10 +1638,12 @@ static void virt_machine_done(Notifier *notifie=
r, void *data)
> >   static void virt_machine_init(MachineState *machine)
> >   {
> >       const MemMapEntry *memmap =3D virt_memmap;
> > +    WGCInfo *wgcinfo =3D virt_wgcinfo;
> >       RISCVVirtState *s =3D RISCV_VIRT_MACHINE(machine);
> >       MemoryRegion *system_memory =3D get_system_memory();
> >       MemoryRegion *mask_rom =3D g_new(MemoryRegion, 1);
> >       DeviceState *mmio_irqchip, *virtio_irqchip, *pcie_irqchip;
> > +    SerialMM *uart;
> >       int i, base_hartid, hart_count;
> >       int socket_count =3D riscv_socket_count(machine);
> >
> > @@ -1546,6 +1659,11 @@ static void virt_machine_init(MachineState *mach=
ine)
> >           exit(1);
> >       }
> >
> > +    if (!tcg_enabled() && s->have_wg) {
> > +        error_report("'wg' is only available with TCG acceleration");
> > +        exit(1);
> > +    }
> > +
> >       /* Initialize sockets */
> >       mmio_irqchip =3D virtio_irqchip =3D pcie_irqchip =3D NULL;
> >       for (i =3D 0; i < socket_count; i++) {
> > @@ -1673,6 +1791,10 @@ static void virt_machine_init(MachineState *mach=
ine)
> >       memory_region_add_subregion(system_memory, memmap[VIRT_DRAM].base=
,
> >           machine->ram);
> >
> > +    if (tcg_enabled() && s->have_wg) {
> > +        wgc_append_child(&wgcinfo[WGC_DRAM], machine->ram, memmap[VIRT=
_DRAM].base);
> > +    }
>
> I see this "(tcg_enabled() && s->have_wg)" check being used throughout th=
e code.
> Given that s->have_wg is a machine property "wg":
>
> > +    object_class_property_add_bool(oc, "wg", virt_get_wg,
> > +                                   virt_set_wg);
>
> I suggest changing the getter to check for TCG:
>
> > +static bool virt_get_wg(Object *obj, Error **errp)
> > +{
> > +    RISCVVirtState *s =3D RISCV_VIRT_MACHINE(obj);
> > +
> > +    return tcg_enabled() && s->have_wg;
> > +}
>
> And then each time you need to check "tcg_enabled() && s->have_wg" you do=
 a:
>
> if (object_property_get_bool(OBJECT(s), "wg")) ...
>
>
> If you don't want to use QOM feel free to use virt_get_wg() directly too.
>
>
> Everything else LGTM. Thanks,
>
>
> Daniel
>
>
>
>
> > +
> >       /* boot rom */
> >       memory_region_init_rom(mask_rom, NULL, "riscv_virt_board.mrom",
> >                              memmap[VIRT_MROM].size, &error_fatal);
> > @@ -1700,10 +1822,16 @@ static void virt_machine_init(MachineState *mac=
hine)
> >
> >       create_platform_bus(s, mmio_irqchip);
> >
> > -    serial_mm_init(system_memory, memmap[VIRT_UART0].base,
> > +    uart =3D serial_mm_init(system_memory, memmap[VIRT_UART0].base,
> >           0, qdev_get_gpio_in(mmio_irqchip, UART0_IRQ), 399193,
> >           serial_hd(0), DEVICE_LITTLE_ENDIAN);
> >
> > +    if (tcg_enabled() && s->have_wg) {
> > +        wgc_append_child(&wgcinfo[WGC_UART],
> > +                         sysbus_mmio_get_region(SYS_BUS_DEVICE(uart), =
0),
> > +                         memmap[VIRT_UART0].base);
> > +    }
> > +
> >       sysbus_create_simple("goldfish_rtc", memmap[VIRT_RTC].base,
> >           qdev_get_gpio_in(mmio_irqchip, RTC_IRQ));
> >
> > @@ -1712,7 +1840,16 @@ static void virt_machine_init(MachineState *mach=
ine)
> >           pflash_cfi01_legacy_drive(s->flash[i],
> >                                     drive_get(IF_PFLASH, 0, i));
> >       }
> > -    virt_flash_map(s, system_memory);
> > +
> > +    if (tcg_enabled() && s->have_wg) {
> > +        virt_flash_map(s, system_memory, &wgcinfo[WGC_FLASH]);
> > +    } else {
> > +        virt_flash_map(s, system_memory, NULL);
> > +    }
> > +
> > +    if (tcg_enabled() && s->have_wg) {
> > +        virt_create_worldguard(wgcinfo, WGC_NUM, mmio_irqchip);
> > +    }
> >
> >       /* load/create device tree */
> >       if (machine->dtb) {
> > @@ -1757,6 +1894,20 @@ static void virt_machine_instance_init(Object *o=
bj)
> >       s->iommu_sys =3D ON_OFF_AUTO_AUTO;
> >   }
> >
> > +static bool virt_get_wg(Object *obj, Error **errp)
> > +{
> > +    RISCVVirtState *s =3D RISCV_VIRT_MACHINE(obj);
> > +
> > +    return s->have_wg;
> > +}
> > +
> > +static void virt_set_wg(Object *obj, bool value, Error **errp)
> > +{
> > +    RISCVVirtState *s =3D RISCV_VIRT_MACHINE(obj);
> > +
> > +    s->have_wg =3D value;
> > +}
> > +
> >   static char *virt_get_aia_guests(Object *obj, Error **errp)
> >   {
> >       RISCVVirtState *s =3D RISCV_VIRT_MACHINE(obj);
> > @@ -1977,6 +2128,12 @@ static void virt_machine_class_init(ObjectClass =
*oc, void *data)
> >                                 NULL, NULL);
> >       object_class_property_set_description(oc, "iommu-sys",
> >                                             "Enable IOMMU platform devi=
ce");
> > +
> > +    object_class_property_add_bool(oc, "wg", virt_get_wg,
> > +                                   virt_set_wg);
> > +    object_class_property_set_description(oc, "wg",
> > +                                              "Set on/off to enable/di=
sable the "
> > +                                              "RISC-V WorldGuard.");
> >   }
> >
> >   static const TypeInfo virt_machine_typeinfo =3D {
> > diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> > index 48a14bea2e..3a631a6a23 100644
> > --- a/include/hw/riscv/virt.h
> > +++ b/include/hw/riscv/virt.h
> > @@ -57,6 +57,7 @@ struct RISCVVirtState {
> >       bool have_aclint;
> >       RISCVVirtAIAType aia_type;
> >       int aia_guests;
> > +    bool have_wg;
> >       char *oem_id;
> >       char *oem_table_id;
> >       OnOffAuto acpi;
> > @@ -87,11 +88,17 @@ enum {
> >       VIRT_PLATFORM_BUS,
> >       VIRT_PCIE_ECAM,
> >       VIRT_IOMMU_SYS,
> > +    VIRT_WGC_DRAM,
> > +    VIRT_WGC_FLASH,
> > +    VIRT_WGC_UART
> >   };
> >
> >   enum {
> >       UART0_IRQ =3D 10,
> >       RTC_IRQ =3D 11,
> > +    WGC_DRAM_IRQ =3D 15,
> > +    WGC_FLASH_IRQ =3D 16,
> > +    WGC_UART_IRQ =3D 17,
> >       VIRTIO_IRQ =3D 1, /* 1 to 8 */
> >       VIRTIO_COUNT =3D 8,
> >       PCIE_IRQ =3D 0x20, /* 32 to 35 */
> > @@ -102,7 +109,7 @@ enum {
> >   #define VIRT_PLATFORM_BUS_NUM_IRQS 32
> >
> >   #define VIRT_IRQCHIP_NUM_MSIS 255
> > -#define VIRT_IRQCHIP_NUM_SOURCES 96
> > +#define VIRT_IRQCHIP_NUM_SOURCES 128
> >   #define VIRT_IRQCHIP_NUM_PRIO_BITS 3
> >   #define VIRT_IRQCHIP_MAX_GUESTS_BITS 3
> >   #define VIRT_IRQCHIP_MAX_GUESTS ((1U << VIRT_IRQCHIP_MAX_GUESTS_BITS)=
 - 1U)
> > @@ -158,4 +165,10 @@ uint32_t imsic_num_bits(uint32_t count);
> >   #error "Can't accommodate all IMSIC groups in address space"
> >   #endif
> >
> > +/* WorldGuard */
> > +#define VIRT_WG_NWORLDS         4
> > +#define VIRT_WG_TRUSTEDWID      3
> > +#define VIRT_WG_HWBYPASS        true
> > +#define VIRT_WG_TZCOMPAT        false
> > +
> >   #endif
>

