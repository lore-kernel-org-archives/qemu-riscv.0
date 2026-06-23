Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B5ECD98F0
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 04:16:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbsYr-0001y3-JD; Tue, 23 Jun 2026 00:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1wbsYm-0001xV-Jt
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 00:16:28 -0400
Received: from mail-dy1-x1342.google.com ([2607:f8b0:4864:20::1342])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1wbsYk-00065W-9h
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 00:16:28 -0400
Received: by mail-dy1-x1342.google.com with SMTP id
 5a478bee46e88-30c09f29b64so420115eec.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 21:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782188183; x=1782792983; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rPx/MJcNVMqPVt2dKxT6ID2/PppGPTrHxtYKVchm0vg=;
 b=ICzt41awMYFF/Ug8BABK7lFYVz51NNzIBHdQj98a5/nmq/XYbcbkVDdu32oeQeHKWe
 dOj9iXoIx3e4SjgVRJ0m9pZO3JecOSPuvUpumsM4DvrCUpoDK1UN55mGtvLAEUf20+b3
 lAlRA6jhCBkX83GhXc27JHHKWlbuLEictBOlkq7ZSQEz8AzGv3GWpak9mXJDeKZMCDTy
 n47aqmMQm90Qo6xziiG6JS68lG50wQ/Echh5SFAqmxJjvVm5x9jfEXA9bQyeGOKCbBJB
 G1+OToTE8Ej3FTiyzHntoMRdfk1vznNnkEl81vzCErI9ncIoJ6mVD4xbhiCqwuVnaCos
 0wLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782188183; x=1782792983;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rPx/MJcNVMqPVt2dKxT6ID2/PppGPTrHxtYKVchm0vg=;
 b=RMFijKT/jDD4wuyyuMpyj+QaAePtKj291UiMRXjV7ApZmB5iipIzCS8jItgO5Xyjtq
 aWMG3FfxmtH8RPEGv9Eh5cHcSGh+LfTwUiEwNzm4uL4HDA7BkdJGsTq2EmwxpAHJi6tu
 2bLW3IPqzvL3Pphjpm2lhGV3nOx6i5zk/eS7SqBHkr6OLGD9Sc9YIRvbjuQXLbr5NfVQ
 GgD4dCdXHzk79nVDX1WJ+pSfzOmTwFEZXy/2IAPQ5J/LVNAXHX2m0HD1+NHXBSRUdrb4
 of0+OVmbxCV4yNHLV7eaCNcNseL6Sw05lLOukkZC5m7pq9LhTdPkFLXkcBkP60Hl0eyT
 zH6A==
X-Forwarded-Encrypted: i=1;
 AHgh+RqHOXMp6zyz/fptF0NFAbF7MoxD3+KKyHX4JWMS1RQr0V9s7grV6hwSU1BS0HrneI0e1IaIS6BzzUon@nongnu.org
X-Gm-Message-State: AOJu0YxwLHNvwx1B2iInU/zE+bC4KvRlg+rBIdkikPNvhDTzoptG1ida
 62HuojMFOiYsvpGlMv2RbLIpJm+dW3wkkMb81+0+VKfoEpARJnQEM1Cl
X-Gm-Gg: AfdE7clHX59R3R0RwH6rqG1fcR1+i0etcbOk8jJ35dZdaRd8Inphr75gxk9q60IwO8R
 OSEwSSFhfzUWCoR8/BlbQhjyfjFXjLgPJchFJaNac3uSCPrIGpVFhQosgtqp7JEui1tRQDMtYQ8
 F5xFwIEQcO2Eoc9PrWmM7+8xHO1oJHaDEYPbh2AxfS8z1ElO307eS1D62zZZ5+CQvfevcfN4+im
 VCPJwNP+NiUHF56kdtALYV/q+mD1cXTzy9cqwJkNoVVCY2BT9FhdP1FN4Yw+PVEQuP1SdrBb6Dt
 L+Q7Lmr3qNjaM2QTYzQp+R9mUJlXcXmI/RmP22dIy0RECXm9q7vmAzMSgzHmmD+7yLZs5uH4k20
 dePq4UKA5Qnw+IEf4gkP24WWmWSBbjdjvoXS3eta2+mps0Dq6TuOjWsUoIfvPDaIarTtXXj+j8U
 uWqywfNlywC5E3g3Oh62FmFonrSuYwJpEyAcXfM3AcsAcwn+4g7W+g7LkeP9c=
X-Received: by 2002:a05:7300:5794:b0:30c:4670:87a0 with SMTP id
 5a478bee46e88-30c555488ecmr1999642eec.5.1782188182504; 
 Mon, 22 Jun 2026 21:16:22 -0700 (PDT)
Received: from localhost ([64.186.250.142]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c1ba635d8sm14762469eec.10.2026.06.22.21.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 21:16:22 -0700 (PDT)
Date: Tue, 23 Jun 2026 12:16:19 +0800
From: Chao Liu <chao.liu.zevorn@gmail.com>
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH 5/5] hw/riscv: add create_fdt_plic() helper
Message-ID: <ajoIf7ZJlI4NMYyk@ChaodeMacBook-Pro.local>
References: <20260616235939.1358663-1-daniel.barboza@oss.qualcomm.com>
 <20260616235939.1358663-6-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616235939.1358663-6-daniel.barboza@oss.qualcomm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1342;
 envelope-from=chao.liu.zevorn@gmail.com; helo=mail-dy1-x1342.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Jun 16, 2026 at 08:59:39PM +0800, Daniel Henrique Barboza wrote:
> Consolidate the common plic FDT code between 'virt' and sifive_u boards
> into a single place.
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>

Thanks,
Chao
> ---
>  hw/riscv/fdt-common.c         | 30 +++++++++++++++++++++
>  hw/riscv/sifive_u.c           | 34 +++++++-----------------
>  hw/riscv/virt.c               | 49 ++++++++++++-----------------------
>  include/hw/riscv/fdt-common.h |  5 ++++
>  4 files changed, 61 insertions(+), 57 deletions(-)
> 
> diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
> index b27ff13bca..e0e31af09b 100644
> --- a/hw/riscv/fdt-common.c
> +++ b/hw/riscv/fdt-common.c
> @@ -200,3 +200,33 @@ create_fdt_socket_cpu_sifive(void *fdt, char *clust_name,
>                                     socket_id, socket_hartid_base,
>                                     phandle, intc_phandles, false, false);
>  }
> +
> +void create_fdt_plic(void *fdt, hwaddr addr, uint64_t size,
> +                     uint32_t plic_phandle, uint32_t int_cells,
> +                     uint32_t addr_cells, uint32_t *plic_cells,
> +                     uint32_t cells_size, uint32_t ndev_sources,
> +                     bool numa_enabled, int socket_id)
> +{
> +    g_autofree char *nodename = NULL;
> +    static const char * const plic_compat[2] = {
> +        "sifive,plic-1.0.0", "riscv,plic0"
> +    };
> +
> +    nodename = g_strdup_printf("/soc/interrupt-controller@%"HWADDR_PRIx, addr);
> +
> +    qemu_fdt_add_subnode(fdt, nodename);
> +    qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells", int_cells);
> +    qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", addr_cells);
> +    qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
> +        (char **)&plic_compat, ARRAY_SIZE(plic_compat));
> +    qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
> +    qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
> +                     plic_cells, cells_size);
> +    qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
> +                                 2, addr, 2, size);
> +    qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev", ndev_sources);
> +    if (numa_enabled) {
> +        qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id", socket_id);
> +    }
> +    qemu_fdt_setprop_cell(fdt, nodename, "phandle", plic_phandle);
> +}
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 7dfc18d3ec..d923f041e0 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -100,14 +100,11 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>      MachineState *ms = MACHINE(s);
>      void *fdt;
>      int cpu;
> -    uint32_t *cells;
> +    uint32_t *cells, cells_length;
>      char *nodename;
>      uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle = 1;
>      uint32_t hfclk_phandle, rtcclk_phandle, phy_phandle;
>      static const char * const ethclk_names[2] = { "pclk", "hclk" };
> -    static const char * const plic_compat[2] = {
> -        "sifive,plic-1.0.0", "riscv,plic0"
> -    };
>      g_autofree uint32_t *intc_phandles = g_new0(uint32_t, ms->smp.cpus);
>      g_autofree char *clust_name = NULL;
>  
> @@ -197,7 +194,8 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>      g_free(nodename);
>  
>      plic_phandle = phandle++;
> -    cells =  g_new0(uint32_t, ms->smp.cpus * 4 - 2);
> +    cells_length = ms->smp.cpus * 4 - 2;
> +    cells =  g_new0(uint32_t, cells_length);
>      for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
>          /* cpu 0 is the management hart that does not have S-mode */
>          if (cpu == 0) {
> @@ -210,26 +208,14 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>              cells[cpu * 4 + 1] = cpu_to_be32(IRQ_S_EXT);
>          }
>      }
> -    nodename = g_strdup_printf("/soc/interrupt-controller@%lx",
> -        (long)memmap[SIFIVE_U_DEV_PLIC].base);
> -    qemu_fdt_add_subnode(fdt, nodename);
> -    qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells",
> -                          SIFIVE_U_PLIC_INT_CELLS);
> -    qemu_fdt_setprop_cell(fdt, nodename, "#address-cells",
> -                          SIFIVE_U_PLIC_ADDR_CELLS);
> -    qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
> -        (char **)&plic_compat, ARRAY_SIZE(plic_compat));
> -    qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
> -    qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
> -        cells, (ms->smp.cpus * 4 - 2) * sizeof(uint32_t));
> -    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> -        0x0, memmap[SIFIVE_U_DEV_PLIC].base,
> -        0x0, memmap[SIFIVE_U_DEV_PLIC].size);
> -    qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev",
> -                          SIFIVE_U_PLIC_NUM_SOURCES - 1);
> -    qemu_fdt_setprop_cell(fdt, nodename, "phandle", plic_phandle);
> +
> +    create_fdt_plic(fdt, memmap[SIFIVE_U_DEV_PLIC].base,
> +                    memmap[SIFIVE_U_DEV_PLIC].size,
> +                    plic_phandle, SIFIVE_U_PLIC_INT_CELLS,
> +                    SIFIVE_U_PLIC_ADDR_CELLS, cells,
> +                    cells_length * sizeof(uint32_t),
> +                    SIFIVE_U_PLIC_NUM_SOURCES - 1, false, 0);
>      g_free(cells);
> -    g_free(nodename);
>  
>      gpio_phandle = phandle++;
>      nodename = g_strdup_printf("/soc/gpio@%lx",
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index fa464e644f..92c30a6f4c 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -326,39 +326,25 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
>      int cpu;
>      g_autofree char *plic_name = NULL;
>      g_autofree uint32_t *plic_cells;
> -    unsigned long plic_addr;
>      MachineState *ms = MACHINE(s);
> -    static const char * const plic_compat[2] = {
> -        "sifive,plic-1.0.0", "riscv,plic0"
> -    };
> +    unsigned long plic_addr = s->memmap[VIRT_PLIC].base +
> +                              (s->memmap[VIRT_PLIC].size * socket);
> +    bool numa_enabled = riscv_numa_enabled(MACHINE(s));
> +    uint32_t cells_length;
>  
> -    plic_phandles[socket] = (*phandle)++;
> -    plic_addr = s->memmap[VIRT_PLIC].base +
> -                (s->memmap[VIRT_PLIC].size * socket);
>      plic_name = g_strdup_printf("/soc/interrupt-controller@%lx", plic_addr);
> -    qemu_fdt_add_subnode(ms->fdt, plic_name);
> -    qemu_fdt_setprop_cell(ms->fdt, plic_name,
> -        "#interrupt-cells", FDT_PLIC_INT_CELLS);
> -    qemu_fdt_setprop_cell(ms->fdt, plic_name,
> -        "#address-cells", FDT_PLIC_ADDR_CELLS);
> -    qemu_fdt_setprop_string_array(ms->fdt, plic_name, "compatible",
> -                                  (char **)&plic_compat,
> -                                  ARRAY_SIZE(plic_compat));
> -    qemu_fdt_setprop(ms->fdt, plic_name, "interrupt-controller", NULL, 0);
>  
>      if (kvm_enabled()) {
> -        plic_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
> +        cells_length = s->soc[socket].num_harts * 2;
> +        plic_cells = g_new0(uint32_t, cells_length);
>  
>          for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
>              plic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
>              plic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_S_EXT);
>          }
> -
> -        qemu_fdt_setprop(ms->fdt, plic_name, "interrupts-extended",
> -                         plic_cells,
> -                         s->soc[socket].num_harts * sizeof(uint32_t) * 2);
>     } else {
> -        plic_cells = g_new0(uint32_t, s->soc[socket].num_harts * 4);
> +        cells_length = s->soc[socket].num_harts * 4;
> +        plic_cells = g_new0(uint32_t, cells_length);
>  
>          for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
>              plic_cells[cpu * 4 + 0] = cpu_to_be32(intc_phandles[cpu]);
> @@ -366,19 +352,16 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
>              plic_cells[cpu * 4 + 2] = cpu_to_be32(intc_phandles[cpu]);
>              plic_cells[cpu * 4 + 3] = cpu_to_be32(IRQ_S_EXT);
>          }
> -
> -        qemu_fdt_setprop(ms->fdt, plic_name, "interrupts-extended",
> -                         plic_cells,
> -                         s->soc[socket].num_harts * sizeof(uint32_t) * 4);
>      }
>  
> -    qemu_fdt_setprop_sized_cells(ms->fdt, plic_name, "reg",
> -                                 2, plic_addr, 2, s->memmap[VIRT_PLIC].size);
> -    qemu_fdt_setprop_cell(ms->fdt, plic_name, "riscv,ndev",
> -                          VIRT_IRQCHIP_NUM_SOURCES - 1);
> -    riscv_socket_fdt_write_id(ms, plic_name, socket);
> -    qemu_fdt_setprop_cell(ms->fdt, plic_name, "phandle",
> -        plic_phandles[socket]);
> +    plic_phandles[socket] = (*phandle)++;
> +
> +    create_fdt_plic(ms->fdt, plic_addr, s->memmap[VIRT_PLIC].size,
> +                    plic_phandles[socket], FDT_PLIC_INT_CELLS,
> +                    FDT_PLIC_ADDR_CELLS, plic_cells,
> +                    cells_length * sizeof(uint32_t),
> +                    VIRT_IRQCHIP_NUM_SOURCES - 1,
> +                    numa_enabled, socket);
>  
>      if (!socket) {
>          platform_bus_add_all_fdt_nodes(ms->fdt, plic_name,
> diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
> index 2d6b9a5d03..017278b611 100644
> --- a/include/hw/riscv/fdt-common.h
> +++ b/include/hw/riscv/fdt-common.h
> @@ -30,4 +30,9 @@ void create_fdt_socket_cpu_sifive(void *fdt, char *clust_name,
>                                    int cpu_id, int socket_id,
>                                    int socket_hartid_base, uint32_t *phandle,
>                                    uint32_t *intc_phandles);
> +void create_fdt_plic(void *fdt, hwaddr addr, uint64_t size,
> +                     uint32_t plic_phandle, uint32_t int_cells,
> +                     uint32_t addr_cells, uint32_t *plic_cells,
> +                     uint32_t cells_size, uint32_t ndev_sources,
> +                     bool numa_enabled, int socket);
>  #endif
> -- 
> 2.43.0
> 

