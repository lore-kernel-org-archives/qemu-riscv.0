Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nwDju-0000T4-ON
	for mharc-qemu-riscv@gnu.org; Tue, 31 May 2022 22:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwDjr-0000RZ-Gr; Tue, 31 May 2022 22:05:35 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:43774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwDjn-0001o3-Pk; Tue, 31 May 2022 22:05:33 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 c15-20020a9d684f000000b0060b097c71ecso275964oto.10; 
 Tue, 31 May 2022 19:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PyuLz8UQInsl5XooBbbt8eoymq0DdHLll8Nh0hTsoRw=;
 b=m8Rl4CiRsBes5cUbrEP5N4FUhQLrnu1MaNXjJI6ekbVgmExc7cMXoIaYaZqYHHrGeg
 KGYUxjBUn7rRWJ4hXcoZoF370lsDCghaisLu4ZWWKsDtzMwnO3TuDkAD/oaFf2dVK162
 4x1E/qUseLbNBSMjUjck5km0KVIcqEdD3LJLFKAs+u1xTMy3NOZrgabGZ3GmljOFMl17
 Gi1Vl/Grvmh3Nc/GrxYnZz0Qi3rRCbkzlAF/mQzNB15zNYRAvWA/D51ls4QXaWlywG0O
 000P6P+lDnZ8qxHE8mZ4rnRvdHZQXhwjjGUeivF/55Hgwd19CpzHqwhA/ORusLEvlbhM
 JHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PyuLz8UQInsl5XooBbbt8eoymq0DdHLll8Nh0hTsoRw=;
 b=wGabjJWQBWZnyo9YEVnIxB1SC5n0Giq/WumIZb7m5DTgAau352hgWGrvw+Pu1TKCgZ
 kGQEV/1H+4DUqFOYbnibDGq/hGh5iTZ4eDmI8gIa88tq5TG/gGAuMiVFl2y3oArC0ilz
 5lrP+b3ZsID6wv9kez1PSrRUjycekgugMdRSUG0HaXTJg4TDAeWfxo9YuN/7xGQQb+/8
 5SQdCxMdZ2ok+a0cmRpCKFnDEDpEMYASdM3yPmGaXJA53znYX1cVpS+AkzWBWsXAWkRL
 u0eUEgPVdP+AhRqwzp3hXZ9e27g4H7U12J0Ay27kOZZzN8+nGSLlEeZcve/XXqVcbZmA
 iuGQ==
X-Gm-Message-State: AOAM532XRPAN5s6WsrGZKtN6r0c8VBALPQd47q05q5sH/0rWvbfUwUOX
 Pbh6x/4M0kp5WrLcf/27aU/xR4tKd2oEFVWuBKw=
X-Google-Smtp-Source: ABdhPJxSh/djhoOEEGueD+rxKG3kA1pW9vIRAXk0Ch/zt7kWCcAO+zrju9VHhue4cpOQ8h6WZXAynRz/Z3ekW0HD4Fs=
X-Received: by 2002:a05:6830:448e:b0:60b:254e:7439 with SMTP id
 r14-20020a056830448e00b0060b254e7439mr14605657otv.338.1654049129353; Tue, 31
 May 2022 19:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220526203500.847165-1-atishp@rivosinc.com>
In-Reply-To: <20220526203500.847165-1-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 1 Jun 2022 12:05:03 +1000
Message-ID: <CAKmqyKNJFJaNYnJwTXpA3g8QpSirZfzywbt-feLEXJMY+jggMA@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: Generate fw_cfg DT node correctly
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=alistair23@gmail.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 01 Jun 2022 02:05:35 -0000

On Fri, May 27, 2022 at 6:35 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> fw_cfg DT node is generated after the create_fdt without any check
> if the DT is being loaded from the commandline. This results in
> FDT_ERR_EXISTS error if dtb is loaded from the commandline.
>
> Generate fw_cfg node only if the DT is not loaded from the commandline.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c | 28 ++++++++++++++++++----------
>  1 file changed, 18 insertions(+), 10 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index c57617381517..07aeee3bf0c3 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -975,6 +975,23 @@ static void create_fdt_flash(RISCVVirtState *s, const MemMapEntry *memmap)
>      g_free(name);
>  }
>
> +static void create_fdt_fw_cfg(RISCVVirtState *s, const MemMapEntry *memmap)
> +{
> +    char *nodename;
> +    MachineState *mc = MACHINE(s);
> +    hwaddr base = memmap[VIRT_FW_CFG].base;
> +    hwaddr size = memmap[VIRT_FW_CFG].size;
> +
> +    nodename = g_strdup_printf("/fw-cfg@%" PRIx64, base);
> +    qemu_fdt_add_subnode(mc->fdt, nodename);
> +    qemu_fdt_setprop_string(mc->fdt, nodename,
> +                            "compatible", "qemu,fw-cfg-mmio");
> +    qemu_fdt_setprop_sized_cells(mc->fdt, nodename, "reg",
> +                                 2, base, 2, size);
> +    qemu_fdt_setprop(mc->fdt, nodename, "dma-coherent", NULL, 0);
> +    g_free(nodename);
> +}
> +
>  static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
>                         uint64_t mem_size, const char *cmdline, bool is_32_bit)
>  {
> @@ -1023,6 +1040,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
>      create_fdt_rtc(s, memmap, irq_mmio_phandle);
>
>      create_fdt_flash(s, memmap);
> +    create_fdt_fw_cfg(s, memmap);
>
>  update_bootargs:
>      if (cmdline && *cmdline) {
> @@ -1082,22 +1100,12 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
>  static FWCfgState *create_fw_cfg(const MachineState *mc)
>  {
>      hwaddr base = virt_memmap[VIRT_FW_CFG].base;
> -    hwaddr size = virt_memmap[VIRT_FW_CFG].size;
>      FWCfgState *fw_cfg;
> -    char *nodename;
>
>      fw_cfg = fw_cfg_init_mem_wide(base + 8, base, 8, base + 16,
>                                    &address_space_memory);
>      fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)mc->smp.cpus);
>
> -    nodename = g_strdup_printf("/fw-cfg@%" PRIx64, base);
> -    qemu_fdt_add_subnode(mc->fdt, nodename);
> -    qemu_fdt_setprop_string(mc->fdt, nodename,
> -                            "compatible", "qemu,fw-cfg-mmio");
> -    qemu_fdt_setprop_sized_cells(mc->fdt, nodename, "reg",
> -                                 2, base, 2, size);
> -    qemu_fdt_setprop(mc->fdt, nodename, "dma-coherent", NULL, 0);
> -    g_free(nodename);
>      return fw_cfg;
>  }
>
> --
> 2.25.1
>
>

