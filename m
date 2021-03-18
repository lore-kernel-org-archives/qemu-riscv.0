Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lN0Dr-0000BY-6D
	for mharc-qemu-riscv@gnu.org; Thu, 18 Mar 2021 17:30:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lN0Dp-00009H-82; Thu, 18 Mar 2021 17:30:25 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:44937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lN0Dn-0005eB-9c; Thu, 18 Mar 2021 17:30:25 -0400
Received: by mail-il1-x12b.google.com with SMTP id t6so6235716ilp.11;
 Thu, 18 Mar 2021 14:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3M+eOXsTUdkWpyTGXyPAz8ys4D4Sc1b9M4ZGvbObA40=;
 b=n9Nk34SxlNAOONRWR6Iw0EaDwyn7MqA4XmuRuQ4CyLcGXB2bR3JbB6WjeAMD9oyBKR
 kgpAaeu0W9uneQezNTvxJ+ez2DlLSVBvscX85Gj+/JMT3gVfV97pX5q4PVkj7yX5UH40
 MTepJXF4S6VCORhspc2KembRfBmlTVstWH/d9wvq3ZvwNZh1RisqrhqO2iykyy77Ogip
 3kD6DkgCs/fJo6qsY+yv8OH2I901LVu1Y+yKx14QyXc375Bihthr5PziG91gFLfc3Mof
 qBFAHHbFN1PY3My280ZUnmUSNECbyY+LhzpdKQKSt1C4teQTgPhgws81m5MENf+qcilU
 eKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3M+eOXsTUdkWpyTGXyPAz8ys4D4Sc1b9M4ZGvbObA40=;
 b=eyx+D8qzSyDPfCZP+YOoMmHDj13UAo26oThtQWA95xJ7d2mlg8TaqoSLBgl+lfyekV
 AbJVY9D8xI8DmSkwixv7mx2G2nI5OUR8OZoojfJQmTAZBXJ7CMcpswpFpt1Ri1zgl2Oi
 AQhQBQYoKcOH8DeoHQEfSk9XL/87Siw38RJYk8ntm5pz5YWq6R9X8IHKi1AIxWQj/4l0
 sVXX26ol9o7CB7KwJq62CwluZEAwNJO/vUEkE9s+4Qk95V+X42cnzyu6yXQcreyj+Cy0
 Pqr1Y4NDZDD6IP/yaaRxYQdtEoiRAcWlLMIDaX6J4l7Xi4LMfdfrhx5NrIPKRd0ktmtX
 c3eQ==
X-Gm-Message-State: AOAM5324U2KLmJ9MkAM1/qRvH3BWe5qjwRTspoTdPwTdB5Xt48yXux+j
 6QWdDh0J6pct5YdUcV73AsFgObYVDqjqdAcul7k=
X-Google-Smtp-Source: ABdhPJwMr/wnwpwAbQi/0yjo3uLnRpN8A1QKwRPSSjDrM23Kno+ueUpgGPaB//w2IpRknMTxXo2EbHsyDtC2nf+ANVY=
X-Received: by 2002:a92:d6cf:: with SMTP id z15mr460346ilp.40.1616103021658;
 Thu, 18 Mar 2021 14:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210228111657.23240-1-ashe@kivikakk.ee>
 <20210228111657.23240-2-ashe@kivikakk.ee>
 <CAKmqyKNh32DwhD6-2-+8YeHMMqTs9bjU7EMubPh=UM3PsYZ8Cg@mail.gmail.com>
In-Reply-To: <CAKmqyKNh32DwhD6-2-+8YeHMMqTs9bjU7EMubPh=UM3PsYZ8Cg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 18 Mar 2021 17:28:34 -0400
Message-ID: <CAKmqyKNUQaqQypxapfaV=8+NLf9pn76ZBwxTTExQA5VTY_ZSJw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] hw/riscv: Add fw_cfg support to virt
To: Asherah Connor <ashe@kivikakk.ee>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 18 Mar 2021 21:30:25 -0000

On Thu, Mar 18, 2021 at 5:25 PM Alistair Francis <alistair23@gmail.com> wro=
te:
>
> On Sun, Feb 28, 2021 at 6:17 AM Asherah Connor <ashe@kivikakk.ee> wrote:
> >
> > Provides fw_cfg for the virt machine on riscv.  This enables
> > using e.g.  ramfb later.
> >
> > Signed-off-by: Asherah Connor <ashe@kivikakk.ee>
>
> This patch doesn't compile, I see this error:
>
> ../hw/riscv/virt.c: In function =E2=80=98create_fw_cfg=E2=80=99:
> ../hw/riscv/virt.c:523:27: error: =E2=80=98RISCVVirtState=E2=80=99 has no=
 member named =E2=80=98fdt=E2=80=99
>  523 |     qemu_fdt_add_subnode(s->fdt, nodename);
>      |                           ^~
>
> Can you please fix the compilation failure and send a new version?

I'm guessing the failure is because of "hw/riscv: migrate fdt field to
generic MachineState" which moved the fdt element to the MachineState.

The fix should just be to change s->fdt to mc->fdt.

Sorry that the patch stopped compiling while in the RISC-V tree.

Alistair

>
> Alistair
>
> > ---
> >
> > Changes in v3:
> > * Document why fw_cfg is done when it is.
> > * Move VIRT_FW_CFG before VIRT_FLASH.
> >
> > Changes in v2:
> > * Add DMA support (needed for writes).
> >
> >  hw/riscv/Kconfig        |  1 +
> >  hw/riscv/virt.c         | 30 ++++++++++++++++++++++++++++++
> >  include/hw/riscv/virt.h |  2 ++
> >  3 files changed, 33 insertions(+)
> >
> > diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> > index facb0cbacc..afaa5e58bb 100644
> > --- a/hw/riscv/Kconfig
> > +++ b/hw/riscv/Kconfig
> > @@ -33,6 +33,7 @@ config RISCV_VIRT
> >      select SIFIVE_PLIC
> >      select SIFIVE_TEST
> >      select VIRTIO_MMIO
> > +    select FW_CFG_DMA
> >
> >  config SIFIVE_E
> >      bool
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index 2299b3a6be..82eff42c37 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -56,6 +56,7 @@ static const struct MemmapEntry {
> >      [VIRT_PLIC] =3D        {  0xc000000, VIRT_PLIC_SIZE(VIRT_CPUS_MAX =
* 2) },
> >      [VIRT_UART0] =3D       { 0x10000000,         0x100 },
> >      [VIRT_VIRTIO] =3D      { 0x10001000,        0x1000 },
> > +    [VIRT_FW_CFG] =3D      { 0x10100000,          0x18 },
> >      [VIRT_FLASH] =3D       { 0x20000000,     0x4000000 },
> >      [VIRT_PCIE_ECAM] =3D   { 0x30000000,    0x10000000 },
> >      [VIRT_PCIE_MMIO] =3D   { 0x40000000,    0x40000000 },
> > @@ -488,6 +489,28 @@ static inline DeviceState *gpex_pcie_init(MemoryRe=
gion *sys_mem,
> >      return dev;
> >  }
> >
> > +static FWCfgState *create_fw_cfg(const RISCVVirtState *s)
> > +{
> > +    hwaddr base =3D virt_memmap[VIRT_FW_CFG].base;
> > +    hwaddr size =3D virt_memmap[VIRT_FW_CFG].size;
> > +    FWCfgState *fw_cfg;
> > +    char *nodename;
> > +
> > +    fw_cfg =3D fw_cfg_init_mem_wide(base + 8, base, 8, base + 16,
> > +                                  &address_space_memory);
> > +    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)MACHINE(s)->smp.c=
pus);
> > +
> > +    nodename =3D g_strdup_printf("/fw-cfg@%" PRIx64, base);
> > +    qemu_fdt_add_subnode(s->fdt, nodename);
> > +    qemu_fdt_setprop_string(s->fdt, nodename,
> > +                            "compatible", "qemu,fw-cfg-mmio");
> > +    qemu_fdt_setprop_sized_cells(s->fdt, nodename, "reg",
> > +                                 2, base, 2, size);
> > +    qemu_fdt_setprop(s->fdt, nodename, "dma-coherent", NULL, 0);
> > +    g_free(nodename);
> > +    return fw_cfg;
> > +}
> > +
> >  static void virt_machine_init(MachineState *machine)
> >  {
> >      const struct MemmapEntry *memmap =3D virt_memmap;
> > @@ -652,6 +675,13 @@ static void virt_machine_init(MachineState *machin=
e)
> >          start_addr =3D virt_memmap[VIRT_FLASH].base;
> >      }
> >
> > +    /*
> > +     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the=
 device
> > +     * tree cannot be altered and we get FDT_ERR_NOSPACE.
> > +     */
> > +    s->fw_cfg =3D create_fw_cfg(s);
> > +    rom_set_fw(s->fw_cfg);
> > +
> >      /* Compute the fdt load address in dram */
> >      fdt_load_addr =3D riscv_load_fdt(memmap[VIRT_DRAM].base,
> >                                     machine->ram_size, s->fdt);
> > diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> > index 84b7a3848f..b0ded3fc55 100644
> > --- a/include/hw/riscv/virt.h
> > +++ b/include/hw/riscv/virt.h
> > @@ -40,6 +40,7 @@ struct RISCVVirtState {
> >      RISCVHartArrayState soc[VIRT_SOCKETS_MAX];
> >      DeviceState *plic[VIRT_SOCKETS_MAX];
> >      PFlashCFI01 *flash[2];
> > +    FWCfgState *fw_cfg;
> >
> >      void *fdt;
> >      int fdt_size;
> > @@ -54,6 +55,7 @@ enum {
> >      VIRT_PLIC,
> >      VIRT_UART0,
> >      VIRT_VIRTIO,
> > +    VIRT_FW_CFG,
> >      VIRT_FLASH,
> >      VIRT_DRAM,
> >      VIRT_PCIE_MMIO,
> > --
> > 2.20.1
> >
> >

