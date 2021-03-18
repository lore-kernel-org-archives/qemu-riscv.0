Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lN0AO-000690-L7
	for mharc-qemu-riscv@gnu.org; Thu, 18 Mar 2021 17:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lN0AN-00067Y-Ju; Thu, 18 Mar 2021 17:26:51 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:40648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lN0AL-00045q-NX; Thu, 18 Mar 2021 17:26:51 -0400
Received: by mail-il1-x133.google.com with SMTP id c17so6230434ilj.7;
 Thu, 18 Mar 2021 14:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+8LHLgc+qcRrRnV8eG45ouUWpXscSvydGyim7piBOZA=;
 b=oEfxjecnTg4h5/NvjAPf7rgd9FLteSYNLAXyFKGJpLIuYYvYw2vGxyqm7plUDE0cQc
 qNrivgNZzi5wHnKs4CKoyewHuSWWsc5ymjyzJZqR4f3CN0Yw5FsTPqRrR1T025+ShFpb
 H/7HXHbGD9j2KDozfHLUmVkv8TspMgbyg7PJm7l/UtEiDuS1IovzV4BuJybmjPf1nwHD
 VFojuk+6s/K9qv4Av7ovUSSnO0bYTBklkNak/EjjF2renwASc+kROr7qot7kxpcNyRgh
 C9v93EKid5KG+lJw57HgIIuXy4Q+pmtKikwHRlLYSJsMg++mD4cEHim9UzrV41DEAyWv
 eiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+8LHLgc+qcRrRnV8eG45ouUWpXscSvydGyim7piBOZA=;
 b=OWmxFTatzj1WbW2cwJSzerBnYdWAZbM+qOaNvErVEwaTHA0a5y8ZxuHxQr0j+tiRNk
 N6WG0uL8+vsoCFaCuHv4LRGjRfPXUGczHIor2OEgacwsajkawlC1PJ0xSWm7oM3uEhjI
 GDT4Uc9mB9MdGbI2zRaGKGMmh7bfga8h0F7JmQ0+PIV/WGn0i7Rhxzqv05Zp0s3+VTdV
 ZuOCwQh3aMM/nAHn3yzVFL++huHIQSKbGxqhNI49jsK/i+PYUj8OqGMTECvprzSm/0jl
 DWcR7/NHdrHZszoy1ftvCwGYOvgU2rV3PM6ZZNksGU21b6SI6J1tnY+Z7yZ/3Oec8qZu
 tAbw==
X-Gm-Message-State: AOAM530BAM4MlmONNNha591K1SqQyp8SBUh0sHjgXqPF+JWeNWXQbDY7
 JJBI7C54V0foKzwydhzoGgVeN2v/I4dbY5bbR5U=
X-Google-Smtp-Source: ABdhPJyoUxzCwKxgWPXRrAO1jHEnnEMdQ97iyc8KvN6072FGYGvvrBKwUjSkDrgt2Cvk4B1QwnX1xq/zHNnxF/0R2rI=
X-Received: by 2002:a05:6e02:1748:: with SMTP id
 y8mr422600ill.131.1616102808373; 
 Thu, 18 Mar 2021 14:26:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210228111657.23240-1-ashe@kivikakk.ee>
 <20210228111657.23240-2-ashe@kivikakk.ee>
In-Reply-To: <20210228111657.23240-2-ashe@kivikakk.ee>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 18 Mar 2021 17:25:01 -0400
Message-ID: <CAKmqyKNh32DwhD6-2-+8YeHMMqTs9bjU7EMubPh=UM3PsYZ8Cg@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x133.google.com
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
X-List-Received-Date: Thu, 18 Mar 2021 21:26:52 -0000

On Sun, Feb 28, 2021 at 6:17 AM Asherah Connor <ashe@kivikakk.ee> wrote:
>
> Provides fw_cfg for the virt machine on riscv.  This enables
> using e.g.  ramfb later.
>
> Signed-off-by: Asherah Connor <ashe@kivikakk.ee>

This patch doesn't compile, I see this error:

../hw/riscv/virt.c: In function =E2=80=98create_fw_cfg=E2=80=99:
../hw/riscv/virt.c:523:27: error: =E2=80=98RISCVVirtState=E2=80=99 has no m=
ember named =E2=80=98fdt=E2=80=99
 523 |     qemu_fdt_add_subnode(s->fdt, nodename);
     |                           ^~

Can you please fix the compilation failure and send a new version?

Alistair

> ---
>
> Changes in v3:
> * Document why fw_cfg is done when it is.
> * Move VIRT_FW_CFG before VIRT_FLASH.
>
> Changes in v2:
> * Add DMA support (needed for writes).
>
>  hw/riscv/Kconfig        |  1 +
>  hw/riscv/virt.c         | 30 ++++++++++++++++++++++++++++++
>  include/hw/riscv/virt.h |  2 ++
>  3 files changed, 33 insertions(+)
>
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index facb0cbacc..afaa5e58bb 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -33,6 +33,7 @@ config RISCV_VIRT
>      select SIFIVE_PLIC
>      select SIFIVE_TEST
>      select VIRTIO_MMIO
> +    select FW_CFG_DMA
>
>  config SIFIVE_E
>      bool
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 2299b3a6be..82eff42c37 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -56,6 +56,7 @@ static const struct MemmapEntry {
>      [VIRT_PLIC] =3D        {  0xc000000, VIRT_PLIC_SIZE(VIRT_CPUS_MAX * =
2) },
>      [VIRT_UART0] =3D       { 0x10000000,         0x100 },
>      [VIRT_VIRTIO] =3D      { 0x10001000,        0x1000 },
> +    [VIRT_FW_CFG] =3D      { 0x10100000,          0x18 },
>      [VIRT_FLASH] =3D       { 0x20000000,     0x4000000 },
>      [VIRT_PCIE_ECAM] =3D   { 0x30000000,    0x10000000 },
>      [VIRT_PCIE_MMIO] =3D   { 0x40000000,    0x40000000 },
> @@ -488,6 +489,28 @@ static inline DeviceState *gpex_pcie_init(MemoryRegi=
on *sys_mem,
>      return dev;
>  }
>
> +static FWCfgState *create_fw_cfg(const RISCVVirtState *s)
> +{
> +    hwaddr base =3D virt_memmap[VIRT_FW_CFG].base;
> +    hwaddr size =3D virt_memmap[VIRT_FW_CFG].size;
> +    FWCfgState *fw_cfg;
> +    char *nodename;
> +
> +    fw_cfg =3D fw_cfg_init_mem_wide(base + 8, base, 8, base + 16,
> +                                  &address_space_memory);
> +    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)MACHINE(s)->smp.cpu=
s);
> +
> +    nodename =3D g_strdup_printf("/fw-cfg@%" PRIx64, base);
> +    qemu_fdt_add_subnode(s->fdt, nodename);
> +    qemu_fdt_setprop_string(s->fdt, nodename,
> +                            "compatible", "qemu,fw-cfg-mmio");
> +    qemu_fdt_setprop_sized_cells(s->fdt, nodename, "reg",
> +                                 2, base, 2, size);
> +    qemu_fdt_setprop(s->fdt, nodename, "dma-coherent", NULL, 0);
> +    g_free(nodename);
> +    return fw_cfg;
> +}
> +
>  static void virt_machine_init(MachineState *machine)
>  {
>      const struct MemmapEntry *memmap =3D virt_memmap;
> @@ -652,6 +675,13 @@ static void virt_machine_init(MachineState *machine)
>          start_addr =3D virt_memmap[VIRT_FLASH].base;
>      }
>
> +    /*
> +     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the d=
evice
> +     * tree cannot be altered and we get FDT_ERR_NOSPACE.
> +     */
> +    s->fw_cfg =3D create_fw_cfg(s);
> +    rom_set_fw(s->fw_cfg);
> +
>      /* Compute the fdt load address in dram */
>      fdt_load_addr =3D riscv_load_fdt(memmap[VIRT_DRAM].base,
>                                     machine->ram_size, s->fdt);
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 84b7a3848f..b0ded3fc55 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -40,6 +40,7 @@ struct RISCVVirtState {
>      RISCVHartArrayState soc[VIRT_SOCKETS_MAX];
>      DeviceState *plic[VIRT_SOCKETS_MAX];
>      PFlashCFI01 *flash[2];
> +    FWCfgState *fw_cfg;
>
>      void *fdt;
>      int fdt_size;
> @@ -54,6 +55,7 @@ enum {
>      VIRT_PLIC,
>      VIRT_UART0,
>      VIRT_VIRTIO,
> +    VIRT_FW_CFG,
>      VIRT_FLASH,
>      VIRT_DRAM,
>      VIRT_PCIE_MMIO,
> --
> 2.20.1
>
>

