Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9639C77B75
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 May 2023 16:50:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwQXz-0007Jt-Qo; Tue, 09 May 2023 12:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pwQXx-0007JQ-RQ
 for qemu-riscv@nongnu.org; Tue, 09 May 2023 12:50:41 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pwQXv-00035o-JX
 for qemu-riscv@nongnu.org; Tue, 09 May 2023 12:50:41 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-965a68abfd4so1149264066b.2
 for <qemu-riscv@nongnu.org>; Tue, 09 May 2023 09:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1683651038; x=1686243038;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OWZfCGIa/9On7dHwWo93/PHiFzYLVhwbD8Na4gd9D2E=;
 b=pMDVufuWUUSZPM9UB53I5SeO5kMlSyl1QJzSLELrRuNxHrSSnrKDJFEStA7ptD0NB3
 caYmu/tEAIkwWVvoGAcFUhqzERqaaxwwVQlvMJP47gRq/BNL5pcXVw9afeyHrU2Xmpg4
 7VGoM/ftc7fNvnsUQlEwyFVLxI9jA4IPD0E90IOyUe7qWyBnDo53DefDRZXxbqRAW/7r
 r4VTS73ycVZHIZv2D44XjAwfufc5YCdUNKRAZp0k0VkWQxOxkfYW/05D5VpWphlUone2
 rflHQ3uannihBAzCfLy0pWryDAIJai+WD2RpVAwFfzCvPRJrWJFRNtppyJkQ8J+5qtav
 UONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683651038; x=1686243038;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OWZfCGIa/9On7dHwWo93/PHiFzYLVhwbD8Na4gd9D2E=;
 b=QUzjMi2IncfLGq+bPPwreeEXsw6DaHFSyflyhE7LCQBbqoJWbAwlgzLsjvMkAetp6h
 qSWVodHrbEpnANCvUW1ZterHHQfTlgNRU+2Je83GlKKGCBnBuaezKCaUhimfV5/K0hpG
 trxhdxzt0CN+PDut0OYk5sZnNmCMtJuyWvKkeId45hE2QNN43lLk2hcvUXR4apKK/nf7
 NISOEA99D7ZAe0yGzm6oKL0k3JzlVmS9CMeSgu49umuLlY9IlbnZO1N3U6hX6fqUpBUB
 eh1I+R2xnuOXZ+1PIIB2VocsgpV8ovnZWHVaqokMHdUKakuQOsgL945bDfC5TyuPnK+n
 LIxA==
X-Gm-Message-State: AC+VfDwEXkd595xiDN8X1G51BOGEy14OqWYbqZjFpLIutPwhRFWdnOSx
 dqWgAacd3uEG3/XwRq4IUSFb7Q==
X-Google-Smtp-Source: ACHHUZ5OnRCWt62PmJVaJPMQL7sc0FhKf8PmlpLwmTo4RbvTMG1nJMYzKVsdZdlV7c6eOgtwUHnDZQ==
X-Received: by 2002:a17:907:720a:b0:953:1fce:301c with SMTP id
 dr10-20020a170907720a00b009531fce301cmr12439361ejc.14.1683651037722; 
 Tue, 09 May 2023 09:50:37 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a170906158200b0094ea48e9052sm1541853ejd.32.2023.05.09.09.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 09:50:37 -0700 (PDT)
Date: Tue, 9 May 2023 18:50:36 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rkanwal@rivosinc.com, 
 anup@brainfault.org, dbarboza@ventanamicro.com, atishp@atishpatra.org, 
 vincent.chen@sifive.com, greentime.hu@sifive.com, frank.chang@sifive.com, 
 jim.shu@sifive.com, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PTACH v2 2/6] target/riscv: support the AIA device emulateion
 with KVM enabled
Message-ID: <20230509-fdc4594fea4d4f418487c9fa@orel>
References: <20230505113946.23433-1-yongxuan.wang@sifive.com>
 <20230505113946.23433-3-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230505113946.23433-3-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


sed 's/emulateion/emulation' <<<$SUBJECT

and for the whole series

sed 's/PTACH/PATCH/' <<<$SUBJECT

Thanks,
drew

On Fri, May 05, 2023 at 11:39:37AM +0000, Yong-Xuan Wang wrote:
> Remove M mode AIA devices when using KVM acceleration
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>
> ---
>  hw/riscv/virt.c | 198 +++++++++++++++++++++++++-----------------------
>  1 file changed, 104 insertions(+), 94 deletions(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4e3efbee16..396025b5a5 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -531,52 +531,53 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
>      imsic_cells = g_new0(uint32_t, ms->smp.cpus * 2);
>      imsic_regs = g_new0(uint32_t, socket_count * 4);
>  
> -    /* M-level IMSIC node */
> -    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
> -        imsic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
> -        imsic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
> -    }
> -    imsic_max_hart_per_socket = 0;
> -    for (socket = 0; socket < socket_count; socket++) {
> -        imsic_addr = memmap[VIRT_IMSIC_M].base +
> -                     socket * VIRT_IMSIC_GROUP_MAX_SIZE;
> -        imsic_size = IMSIC_HART_SIZE(0) * s->soc[socket].num_harts;
> -        imsic_regs[socket * 4 + 0] = 0;
> -        imsic_regs[socket * 4 + 1] = cpu_to_be32(imsic_addr);
> -        imsic_regs[socket * 4 + 2] = 0;
> -        imsic_regs[socket * 4 + 3] = cpu_to_be32(imsic_size);
> -        if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
> -            imsic_max_hart_per_socket = s->soc[socket].num_harts;
> +    if (!kvm_enabled()) {
> +        /* M-level IMSIC node */
> +        for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
> +            imsic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
> +            imsic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
>          }
> +        imsic_max_hart_per_socket = 0;
> +        for (socket = 0; socket < socket_count; socket++) {
> +            imsic_addr = memmap[VIRT_IMSIC_M].base +
> +                         socket * VIRT_IMSIC_GROUP_MAX_SIZE;
> +            imsic_size = IMSIC_HART_SIZE(0) * s->soc[socket].num_harts;
> +            imsic_regs[socket * 4 + 0] = 0;
> +            imsic_regs[socket * 4 + 1] = cpu_to_be32(imsic_addr);
> +            imsic_regs[socket * 4 + 2] = 0;
> +            imsic_regs[socket * 4 + 3] = cpu_to_be32(imsic_size);
> +            if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
> +                imsic_max_hart_per_socket = s->soc[socket].num_harts;
> +            }
> +        }
> +        imsic_name = g_strdup_printf("/soc/imsics@%lx",
> +            (unsigned long)memmap[VIRT_IMSIC_M].base);
> +        qemu_fdt_add_subnode(ms->fdt, imsic_name);
> +        qemu_fdt_setprop_string(ms->fdt, imsic_name, "compatible",
> +            "riscv,imsics");
> +        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "#interrupt-cells",
> +            FDT_IMSIC_INT_CELLS);
> +        qemu_fdt_setprop(ms->fdt, imsic_name, "interrupt-controller",
> +            NULL, 0);
> +        qemu_fdt_setprop(ms->fdt, imsic_name, "msi-controller",
> +            NULL, 0);
> +        qemu_fdt_setprop(ms->fdt, imsic_name, "interrupts-extended",
> +            imsic_cells, ms->smp.cpus * sizeof(uint32_t) * 2);
> +        qemu_fdt_setprop(ms->fdt, imsic_name, "reg", imsic_regs,
> +            socket_count * sizeof(uint32_t) * 4);
> +        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,num-ids",
> +            VIRT_IRQCHIP_NUM_MSIS);
> +        if (socket_count > 1) {
> +            qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,hart-index-bits",
> +                imsic_num_bits(imsic_max_hart_per_socket));
> +            qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,group-index-bits",
> +                imsic_num_bits(socket_count));
> +            qemu_fdt_setprop_cell(ms->fdt, imsic_name,
> +                "riscv,group-index-shift", IMSIC_MMIO_GROUP_MIN_SHIFT);
> +        }
> +        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "phandle", *msi_m_phandle);
> +        g_free(imsic_name);
>      }
> -    imsic_name = g_strdup_printf("/soc/imsics@%lx",
> -        (unsigned long)memmap[VIRT_IMSIC_M].base);
> -    qemu_fdt_add_subnode(ms->fdt, imsic_name);
> -    qemu_fdt_setprop_string(ms->fdt, imsic_name, "compatible",
> -        "riscv,imsics");
> -    qemu_fdt_setprop_cell(ms->fdt, imsic_name, "#interrupt-cells",
> -        FDT_IMSIC_INT_CELLS);
> -    qemu_fdt_setprop(ms->fdt, imsic_name, "interrupt-controller",
> -        NULL, 0);
> -    qemu_fdt_setprop(ms->fdt, imsic_name, "msi-controller",
> -        NULL, 0);
> -    qemu_fdt_setprop(ms->fdt, imsic_name, "interrupts-extended",
> -        imsic_cells, ms->smp.cpus * sizeof(uint32_t) * 2);
> -    qemu_fdt_setprop(ms->fdt, imsic_name, "reg", imsic_regs,
> -        socket_count * sizeof(uint32_t) * 4);
> -    qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,num-ids",
> -        VIRT_IRQCHIP_NUM_MSIS);
> -    if (socket_count > 1) {
> -        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,hart-index-bits",
> -            imsic_num_bits(imsic_max_hart_per_socket));
> -        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,group-index-bits",
> -            imsic_num_bits(socket_count));
> -        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,group-index-shift",
> -            IMSIC_MMIO_GROUP_MIN_SHIFT);
> -    }
> -    qemu_fdt_setprop_cell(ms->fdt, imsic_name, "phandle", *msi_m_phandle);
> -
> -    g_free(imsic_name);
>  
>      /* S-level IMSIC node */
>      for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
> @@ -653,37 +654,40 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
>      aplic_s_phandle = (*phandle)++;
>      aplic_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
>  
> -    /* M-level APLIC node */
> -    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
> -        aplic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
> -        aplic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
> -    }
> -    aplic_addr = memmap[VIRT_APLIC_M].base +
> -                 (memmap[VIRT_APLIC_M].size * socket);
> -    aplic_name = g_strdup_printf("/soc/aplic@%lx", aplic_addr);
> -    qemu_fdt_add_subnode(ms->fdt, aplic_name);
> -    qemu_fdt_setprop_string(ms->fdt, aplic_name, "compatible", "riscv,aplic");
> -    qemu_fdt_setprop_cell(ms->fdt, aplic_name,
> -        "#interrupt-cells", FDT_APLIC_INT_CELLS);
> -    qemu_fdt_setprop(ms->fdt, aplic_name, "interrupt-controller", NULL, 0);
> -    if (s->aia_type == VIRT_AIA_TYPE_APLIC) {
> -        qemu_fdt_setprop(ms->fdt, aplic_name, "interrupts-extended",
> -            aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
> -    } else {
> -        qemu_fdt_setprop_cell(ms->fdt, aplic_name, "msi-parent",
> -            msi_m_phandle);
> +    if (!kvm_enabled()) {
> +        /* M-level APLIC node */
> +        for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
> +            aplic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
> +            aplic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
> +        }
> +        aplic_addr = memmap[VIRT_APLIC_M].base +
> +                     (memmap[VIRT_APLIC_M].size * socket);
> +        aplic_name = g_strdup_printf("/soc/aplic@%lx", aplic_addr);
> +        qemu_fdt_add_subnode(ms->fdt, aplic_name);
> +        qemu_fdt_setprop_string(ms->fdt, aplic_name,
> +            "compatible", "riscv,aplic");
> +        qemu_fdt_setprop_cell(ms->fdt, aplic_name,
> +            "#interrupt-cells", FDT_APLIC_INT_CELLS);
> +        qemu_fdt_setprop(ms->fdt, aplic_name, "interrupt-controller", NULL, 0);
> +        if (s->aia_type == VIRT_AIA_TYPE_APLIC) {
> +            qemu_fdt_setprop(ms->fdt, aplic_name, "interrupts-extended",
> +                aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
> +        } else {
> +            qemu_fdt_setprop_cell(ms->fdt, aplic_name, "msi-parent",
> +                msi_m_phandle);
> +        }
> +        qemu_fdt_setprop_cells(ms->fdt, aplic_name, "reg",
> +            0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_M].size);
> +        qemu_fdt_setprop_cell(ms->fdt, aplic_name, "riscv,num-sources",
> +            VIRT_IRQCHIP_NUM_SOURCES);
> +        qemu_fdt_setprop_cell(ms->fdt, aplic_name, "riscv,children",
> +            aplic_s_phandle);
> +        qemu_fdt_setprop_cells(ms->fdt, aplic_name, "riscv,delegate",
> +            aplic_s_phandle, 0x1, VIRT_IRQCHIP_NUM_SOURCES);
> +        riscv_socket_fdt_write_id(ms, aplic_name, socket);
> +        qemu_fdt_setprop_cell(ms->fdt, aplic_name, "phandle", aplic_m_phandle);
> +        g_free(aplic_name);
>      }
> -    qemu_fdt_setprop_cells(ms->fdt, aplic_name, "reg",
> -        0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_M].size);
> -    qemu_fdt_setprop_cell(ms->fdt, aplic_name, "riscv,num-sources",
> -        VIRT_IRQCHIP_NUM_SOURCES);
> -    qemu_fdt_setprop_cell(ms->fdt, aplic_name, "riscv,children",
> -        aplic_s_phandle);
> -    qemu_fdt_setprop_cells(ms->fdt, aplic_name, "riscv,delegate",
> -        aplic_s_phandle, 0x1, VIRT_IRQCHIP_NUM_SOURCES);
> -    riscv_socket_fdt_write_id(ms, aplic_name, socket);
> -    qemu_fdt_setprop_cell(ms->fdt, aplic_name, "phandle", aplic_m_phandle);
> -    g_free(aplic_name);
>  
>      /* S-level APLIC node */
>      for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
> @@ -1162,16 +1166,20 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
>      int i;
>      hwaddr addr;
>      uint32_t guest_bits;
> -    DeviceState *aplic_m;
> +    DeviceState *aplic_s = NULL;
> +    DeviceState *aplic_m = NULL;
>      bool msimode = (aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) ? true : false;
>  
>      if (msimode) {
> -        /* Per-socket M-level IMSICs */
> -        addr = memmap[VIRT_IMSIC_M].base + socket * VIRT_IMSIC_GROUP_MAX_SIZE;
> -        for (i = 0; i < hart_count; i++) {
> -            riscv_imsic_create(addr + i * IMSIC_HART_SIZE(0),
> -                               base_hartid + i, true, 1,
> -                               VIRT_IRQCHIP_NUM_MSIS);
> +        if (!kvm_enabled()) {
> +            /* Per-socket M-level IMSICs */
> +            addr = memmap[VIRT_IMSIC_M].base +
> +                   socket * VIRT_IMSIC_GROUP_MAX_SIZE;
> +            for (i = 0; i < hart_count; i++) {
> +                riscv_imsic_create(addr + i * IMSIC_HART_SIZE(0),
> +                        base_hartid + i, true, 1,
> +                        VIRT_IRQCHIP_NUM_MSIS);
> +            }
>          }
>  
>          /* Per-socket S-level IMSICs */
> @@ -1184,19 +1192,21 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
>          }
>      }
>  
> -    /* Per-socket M-level APLIC */
> -    aplic_m = riscv_aplic_create(
> -        memmap[VIRT_APLIC_M].base + socket * memmap[VIRT_APLIC_M].size,
> -        memmap[VIRT_APLIC_M].size,
> -        (msimode) ? 0 : base_hartid,
> -        (msimode) ? 0 : hart_count,
> -        VIRT_IRQCHIP_NUM_SOURCES,
> -        VIRT_IRQCHIP_NUM_PRIO_BITS,
> -        msimode, true, NULL);
> -
> -    if (aplic_m) {
> +    if (!kvm_enabled()) {
> +        /* Per-socket M-level APLIC */
> +        aplic_m = riscv_aplic_create(
> +                memmap[VIRT_APLIC_M].base + socket * memmap[VIRT_APLIC_M].size,
> +                memmap[VIRT_APLIC_M].size,
> +                (msimode) ? 0 : base_hartid,
> +                (msimode) ? 0 : hart_count,
> +                VIRT_IRQCHIP_NUM_SOURCES,
> +                VIRT_IRQCHIP_NUM_PRIO_BITS,
> +                msimode, true, NULL);
> +    }
> +
> +    if (aplic_m || kvm_enabled()) {
>          /* Per-socket S-level APLIC */
> -        riscv_aplic_create(
> +        aplic_s = riscv_aplic_create(
>              memmap[VIRT_APLIC_S].base + socket * memmap[VIRT_APLIC_S].size,
>              memmap[VIRT_APLIC_S].size,
>              (msimode) ? 0 : base_hartid,
> @@ -1206,7 +1216,7 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
>              msimode, false, aplic_m);
>      }
>  
> -    return aplic_m;
> +    return kvm_enabled() ? aplic_s : aplic_m;
>  }
>  
>  static void create_platform_bus(RISCVVirtState *s, DeviceState *irqchip)
> -- 
> 2.17.1
> 
> 

