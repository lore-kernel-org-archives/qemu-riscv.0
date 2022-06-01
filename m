Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nwFPl-0004H1-5o
	for mharc-qemu-riscv@gnu.org; Tue, 31 May 2022 23:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwFPi-0004Fa-SB; Tue, 31 May 2022 23:52:54 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35]:46749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwFPh-0000FQ-9k; Tue, 31 May 2022 23:52:54 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-d39f741ba0so1060360fac.13; 
 Tue, 31 May 2022 20:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o4itVQk8TBr2hM69JWgUGV5tjebUeSCOJ6CUjwGE1Uw=;
 b=cbaOrRXoJfvMqQIjpIBxDduo9YVF//U3vCSeaAvv1IUEG7ZfaGATxepXy/bJpkeNB/
 eZbiZOU8Wu3Q0dbrVSfeKuUpIvbm34nCq2ONJwcs4nLvB9KkeBLaR0mIDJrx4ud7vIEE
 NlZUmKxV1NZlf5XEvsMRxbEwkrZOSgtguAGgMh79ts/DjKFPItHRxZymQSfhfvFqHMGl
 IabCFg/TDFJQJlmYY76vFC1YIZ4Dp4ikL8ZNrjGve+qYk3P9dJQr58nUh32G4i4wCAU7
 B1qO+c5kCnwza7UaNzWoHnGvBOugw0GAuC2S3XHHshDl8BwdVZiuZ1CEWkpbaZ52+xKJ
 TgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o4itVQk8TBr2hM69JWgUGV5tjebUeSCOJ6CUjwGE1Uw=;
 b=nWU86LIHEWQM0AyxOchgLj+qjZsthA1Vhum3XWXmRJMNw4U390IoWnXNdt670NyZul
 3IDplfGbl6lM9kN3HWFN9WO2msiA5EmW4CMJbrrpC41EmReJA7JulSmFlyNJFswG1BC/
 bWtI+g8wJFFF0+yYYOTCh6xarPKtSaW2YxG2sKyaKRl19V8T47Jsv7Zmj1GFbSydKe/e
 ahQuCVMLNylTRVbFKI0lBKlbDCORR6qIc4Shh9oIN7eLfWZEDZKnuCiLjIIbK7aBziim
 R0w7+3fORJwNCsLjUT7OGHLsFj4dsXwyVu5g0KSEd0R1CgTLRoCWEKanzDzLDnVNdW3E
 w2mA==
X-Gm-Message-State: AOAM53150Zq4fMdTj9jRk/nxKnysJrVa/Qpbhtve8HkwfwIF9ZjvxzhV
 gq2LP+JZRFJLh+8EZa2dFcVzgih0ra/7zeJl7NcbnOBLxZVFzQ==
X-Google-Smtp-Source: ABdhPJyqjTuZyQYBQPugltqBrxokv5Th9XcbAChJ9vJDusJxWYOReYEAlyjgxe7MrbTPHshjhuSPA9sVAhRx6oAfL+0=
X-Received: by 2002:a05:6870:b00a:b0:f1:7f07:8c36 with SMTP id
 y10-20020a056870b00a00b000f17f078c36mr15369328oae.278.1654055561649; Tue, 31
 May 2022 20:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220526203500.847165-1-atishp@rivosinc.com>
In-Reply-To: <20220526203500.847165-1-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 1 Jun 2022 13:52:15 +1000
Message-ID: <CAKmqyKNtX5HF8wWd_ScepiX8aafC3s2+QEGwsnw4r_Zx5-6dSQ@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: Generate fw_cfg DT node correctly
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=alistair23@gmail.com; helo=mail-oa1-x35.google.com
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
X-List-Received-Date: Wed, 01 Jun 2022 03:52:55 -0000

On Fri, May 27, 2022 at 6:35 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> fw_cfg DT node is generated after the create_fdt without any check
> if the DT is being loaded from the commandline. This results in
> FDT_ERR_EXISTS error if dtb is loaded from the commandline.
>
> Generate fw_cfg node only if the DT is not loaded from the commandline.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Thanks!

Applied to riscv-to-apply.next

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

