Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lGFE5-0005MF-1f
	for mharc-qemu-riscv@gnu.org; Sun, 28 Feb 2021 01:06:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGFE4-0005M4-3H; Sun, 28 Feb 2021 01:06:44 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:35554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGFE2-0007eE-D8; Sun, 28 Feb 2021 01:06:43 -0500
Received: by mail-yb1-xb30.google.com with SMTP id p186so13492900ybg.2;
 Sat, 27 Feb 2021 22:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fNaJrRUSbpzO+4C8nnkH0TM7+NvBj5ekXE+8AwFSEXU=;
 b=NDtJbQ6SS1b+OwztRjCR71Fh4aqdLhPA/vLOTzqqWiw/acwEDwRKsr9gYQJ4yODZ5z
 lWpJ7s+3YvAxoJY0faOo7vXz1X2BaFDPWV1Pta1SpYnx5OxFGe1h0lkug56lug54Kas+
 T9CLtHIS6JKhRJ7iQe6/MGjA8wyo0CaHdYbNYIhXbHOp1vf2pjB8Uk5YKW5+cPoEOYGh
 rpfw5hsOC+SL6CiL5/Gt1YiiU0EP4nSJAMCc1FUm+yeZt8IaocgmaJXOLAFPQFL7+g1U
 Bt/ZEZC9kNOxJRrpCJzUSYm84GiRHNM/dvmnGp4kUY8jAT5BOuOVIvWtCitPrtnoP2bC
 VqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fNaJrRUSbpzO+4C8nnkH0TM7+NvBj5ekXE+8AwFSEXU=;
 b=AEkrzaPs1/aguCuH3xBBPcNK1Lr4uXBq4nUJ8ZQbVfaFkRxTL2lKBUVJVV3w7SKiUR
 oy/zgWZ588QcZmlqTwVa0SHalU12mK7Zx5bHIObol4nUtM+byRIT+xfonpNaMa9aDkM1
 RIkqOYKkBIwRpaN/9yX7Wr8BJtj5QcFJjXRd5bGBbq+HefaSo+2AHyqIMvlR1GATWpCu
 sB5IC0yPteK/RtHn54fQ6O2q20eQUJb3U4K1TanwMMyY/LxEEOTfDLwMSXV05F+IFOm1
 /vyLbUNF5hhh12Kjmx823a8hARKuQk4QvE6M/10H+0JYJcqynSn7L2RgHBRL2+xg2pv8
 lJmQ==
X-Gm-Message-State: AOAM533pqWE4uDRplMIjhL4L+xGwLuGLFYSDgyyPgR4FhsMpiVI3LvPs
 Oxs7w2Kmyvauc7LZPNQBMvSI0TAF4XP9cSwRuHo=
X-Google-Smtp-Source: ABdhPJzpy/EdLOuexGMUjrwGJxcAxF0HrWB+IM9XR3qDUcxM83OUxHsxDXHP/oimXN/zo4c1FYq7FfdI60GQR67U5yw=
X-Received: by 2002:a25:d17:: with SMTP id 23mr16372568ybn.387.1614492400777; 
 Sat, 27 Feb 2021 22:06:40 -0800 (PST)
MIME-Version: 1.0
References: <20210226035447.1252-1-ashe@kivikakk.ee>
 <20210226035447.1252-2-ashe@kivikakk.ee>
In-Reply-To: <20210226035447.1252-2-ashe@kivikakk.ee>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 28 Feb 2021 14:06:29 +0800
Message-ID: <CAEUhbmWBPGNQ0J9P3OzV60BW23YCatbU9PZ0whs2ut4bXLPU4A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/riscv: Add fw_cfg support to virt
To: Asherah Connor <ashe@kivikakk.ee>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sun, 28 Feb 2021 06:06:44 -0000

On Fri, Feb 26, 2021 at 12:31 PM Asherah Connor <ashe@kivikakk.ee> wrote:
>
> Provides fw_cfg for the virt machine on riscv.  This enables
> using e.g.  ramfb later.
>
> Signed-off-by: Asherah Connor <ashe@kivikakk.ee>
> ---
>
> Changes in v2:
> * Add DMA support (needed for writes).
>
>  hw/riscv/Kconfig        |  1 +
>  hw/riscv/virt.c         | 27 +++++++++++++++++++++++++++
>  include/hw/riscv/virt.h |  4 +++-
>  3 files changed, 31 insertions(+), 1 deletion(-)
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
> index 2299b3a6be..a10f218c43 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -56,6 +56,7 @@ static const struct MemmapEntry {
>      [VIRT_PLIC] =        {  0xc000000, VIRT_PLIC_SIZE(VIRT_CPUS_MAX * 2) },
>      [VIRT_UART0] =       { 0x10000000,         0x100 },
>      [VIRT_VIRTIO] =      { 0x10001000,        0x1000 },
> +    [VIRT_FW_CFG] =      { 0x10100000,          0x18 },
>      [VIRT_FLASH] =       { 0x20000000,     0x4000000 },
>      [VIRT_PCIE_ECAM] =   { 0x30000000,    0x10000000 },
>      [VIRT_PCIE_MMIO] =   { 0x40000000,    0x40000000 },
> @@ -488,6 +489,28 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
>      return dev;
>  }
>
> +static FWCfgState *create_fw_cfg(const RISCVVirtState *s)
> +{
> +    hwaddr base = virt_memmap[VIRT_FW_CFG].base;
> +    hwaddr size = virt_memmap[VIRT_FW_CFG].size;
> +    FWCfgState *fw_cfg;
> +    char *nodename;
> +
> +    fw_cfg = fw_cfg_init_mem_wide(base + 8, base, 8, base + 16,
> +                                  &address_space_memory);
> +    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)MACHINE(s)->smp.cpus);
> +
> +    nodename = g_strdup_printf("/fw-cfg@%" PRIx64, base);
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
>      const struct MemmapEntry *memmap = virt_memmap;
> @@ -652,6 +675,10 @@ static void virt_machine_init(MachineState *machine)
>          start_addr = virt_memmap[VIRT_FLASH].base;
>      }
>
> +    /* init fw_cfg */

I guess this is put here because riscv_load_fdt() is trying to touch
the device tree, and creating fw_cfg has to be done before that?
Maybe a comment is needed to prevent whoever later wanted to move the
codes around?

> +    s->fw_cfg = create_fw_cfg(s);
> +    rom_set_fw(s->fw_cfg);
> +
>      /* Compute the fdt load address in dram */
>      fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
>                                     machine->ram_size, s->fdt);
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 84b7a3848f..3b81a2e3f6 100644
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
> @@ -58,7 +59,8 @@ enum {
>      VIRT_DRAM,
>      VIRT_PCIE_MMIO,
>      VIRT_PCIE_PIO,
> -    VIRT_PCIE_ECAM
> +    VIRT_PCIE_ECAM,
> +    VIRT_FW_CFG

nits: insert this before VIRT_FLASH

>  };
>
>  enum {
> --

Regards,
Bin

